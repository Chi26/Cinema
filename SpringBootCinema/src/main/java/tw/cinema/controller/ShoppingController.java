package tw.cinema.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.Hashtable;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import ecpay.payment.integration.AllInOne;
import ecpay.payment.integration.domain.AioCheckOutALL;
import ecpay.payment.integration.domain.QueryTradeInfoObj;
import tw.cinema.model.Members;
import tw.cinema.model.Movie;
import tw.cinema.model.MovieOrderPayment;
import tw.cinema.model.Order;
import tw.cinema.service.MovieService;
import tw.cinema.service.OrderService;
import tw.cinema.service.ShoppingService;

@Controller
@SessionAttributes(names = { "totalPages", "totalElements" })
public class ShoppingController {

	@Autowired
	private MovieService movieService;

	@Autowired
	private OrderService orderService;

	@Autowired
	private ShoppingService shoppingService;

	@Autowired
	HttpServletRequest request = null;

	public static AllInOne all;

	@RequestMapping(path = "/shopping.mainPage", method = RequestMethod.GET)
	public String shoppingView() {
		
		HttpSession session = request.getSession();
		Members member = (Members) session.getAttribute("members");
		String account = member.getUsername();
		String phone = member.getPhone();


		session.setAttribute("account", account);
		session.setAttribute("phone", phone);

		return "shoppingSystem/mainPage/shoppingView";
	}

	@RequestMapping(path = "/shopping.step1", method = RequestMethod.GET)
	public String shoppingStep1() {

		List<Movie> movieList = movieService.findAll();

		HttpSession session = request.getSession();
		session.setAttribute("movieList", movieList);

		return "shoppingSystem/step1/moviePicking";
	}

	@RequestMapping(path = "/shopping.step2", method = RequestMethod.POST)
	public String shoppingStep2(@RequestParam("Movie") String movie,
			@RequestParam("date") @DateTimeFormat(pattern = "yyyy-MM-dd") Date date,
			@RequestParam("Showing") String showing) {

		System.out.println(movie + " " + date + " " + showing);

		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		String strDate = dateFormat.format(date);

		Set<Integer> remaining_Seats = shoppingService.searchingSeat(movie, date, showing);
		HttpSession session = request.getSession();
		session.setAttribute("movie", movie);
		session.setAttribute("date", date);
		session.setAttribute("strdate", strDate);
		session.setAttribute("showing", showing);
		session.setAttribute("remaining_Seats", remaining_Seats);

		return "shoppingSystem/step2/seatInitializing";
	}

	@RequestMapping(path = "seatController", method = RequestMethod.POST)
	public String seatController(@RequestParam("MovieSeat") int movieSeat, @RequestParam("MoviePrice") int price) {

//		System.out.println(movieSeat + " " + price);
		HttpSession session = request.getSession();
		session.setAttribute("seat", movieSeat);
		session.setAttribute("price", price);

		String movie = (String) session.getAttribute("movie");
		String strdate = (String) session.getAttribute("strdate");
		String showing = (String) session.getAttribute("showing");

		Order checkOrder = orderService.checkOrderUnique(movie, movieSeat, strdate, showing);

		// 檢查 OrderList 是否該日期場次的電影座位已被訂走，沒被訂走的話則寫入資料庫。
		if (checkOrder == null) {

			String account = (String) session.getAttribute("account");
			String phone = (String) session.getAttribute("phone");
			Order od = new Order(account, movie, movieSeat, strdate, showing, price, 1, phone, price,"N");
			orderService.insert(od);

			List<Order> buyerSeats = shoppingService.buyer_Seat(account, phone, movie, strdate, showing,"N");

			session.setAttribute("buyerSeats", buyerSeats);

			return "shoppingSystem/step3/shoppingInfoChecking";

		} else {

			Date date = (Date) session.getAttribute("date");
			Set<Integer> remaining_Seats = shoppingService.searchingSeat(movie, date, showing);
			session.setAttribute("remaining_Seats", remaining_Seats);
			System.out.println("Hey~~~~~~~~~~~~~~~~~~");
			session.setAttribute("seat_is_taking", true);

			return "shoppingSystem/step2/seatSelecting";
		}
	}

	@RequestMapping(path = "/deleteSeatController", method = RequestMethod.POST)
	public String shoppingStep3() {

		HttpSession session = request.getSession();
		String pickSeat = request.getParameter("pickSeat");
		String deleteSeatNo = request.getParameter("deleteSeat");

		String movie = (String) session.getAttribute("movie");
		String strdate = (String) session.getAttribute("strdate");
		String showing = (String) session.getAttribute("showing");

		if (pickSeat != null) {

			Date date = (Date) session.getAttribute("date");
			Set<Integer> remaining_Seats = shoppingService.searchingSeat(movie, date, showing);
			session.setAttribute("remaining_Seats", remaining_Seats);
			session.setAttribute("seat_is_taking", false);
			return "shoppingSystem/step2/seatSelecting";

		} else if (deleteSeatNo!=null) {

			String strdeleteNo = request.getParameter("deleteSeat").substring(5);
			int deleteNo = Integer.parseInt(strdeleteNo);
			System.out.println(deleteNo);

			Order checkOrder = orderService.checkOrderUnique(movie, deleteNo, strdate, showing);
			orderService.delete(checkOrder.getOrder_No());

			String account = (String) session.getAttribute("account");
			String phone = (String) session.getAttribute("phone");
			List<Order> buyerSeats = shoppingService.buyer_Seat(account, phone, movie, strdate, showing,"N");

			session.setAttribute("buyerSeats", buyerSeats);

			return "shoppingSystem/step3/shoppingInfoChecking";
			
		} else {
			
//			return null;
			return "shoppingSystem/step3/shoppingInfoChecking";
		}
		
	}

	@GetMapping("/shopping.searchingOrder")
	public String returnSearchOrderMain() {

		return "shoppingSystem/mainPage/searchorder";
	}

	@PostMapping("/searchingOrder")
	@ResponseBody
	public List<Order> queryOrder() {
		HttpSession session = request.getSession();
		String account = (String) session.getAttribute("account");
		String phone = (String) session.getAttribute("phone");
		List<Order> selecting_List = orderService.mySearchMethod(account, phone,"N");

		List<Order> target_List = new ArrayList<Order>();

		for (Order od : selecting_List) {
			orderService.addOrder(od, target_List);

		}

		List<MovieOrderPayment> tradeList = shoppingService.findByAccountAndPhoneAndPaid(account, phone, "Y");
		List<Integer> tradeNoList = new ArrayList<Integer>();

		for (MovieOrderPayment mop : tradeList) {
			int tradeNo = Integer.parseInt(mop.getMerchantTrade_No().substring(11));
			tradeNoList.add(tradeNo);
		}

		for (int tradeNo : tradeNoList) {
			shoppingService.moveOrder(tradeNo, target_List);
		}

		int pageSize = 3;
		Pageable pageable = PageRequest.of(0, pageSize);
		Page<Order> page = new PageImpl<Order>(target_List, pageable, pageSize);

//		return target_List;
		return page.getContent();
	}

	@PostMapping("/searchingOrder/findOrder")
	@ResponseBody
	public List<Order> findOrder(@RequestParam("orderNo") int orderNo, Model m) {
		System.out.println(orderNo);

		Order targetOd = orderService.getOrder(orderNo);
		String account = targetOd.getAccount();
		String phone = targetOd.getPhone();
		String movie = targetOd.getMovie();
		String date = targetOd.getDate();
		String showing = targetOd.getShowing();

		List<Order> order_Info = orderService.findByAccountAndPhoneAndMovieAndDateAndShowingAndPaid(account, phone, movie,
				date, showing,"N");

		return order_Info;
	}

	@PostMapping("/searchingOrder/cancelOrder")
	@ResponseBody
	public Integer cancelOrder(@RequestParam("orderNo") int orderNo, Model m) {
		System.out.println(orderNo);

		Order targetOd = orderService.getOrder(orderNo);
		String account = targetOd.getAccount();
		String phone = targetOd.getPhone();
		String movie = targetOd.getMovie();
		String date = targetOd.getDate();
		String showing = targetOd.getShowing();

		List<Order> order_Info = orderService.findByAccountAndPhoneAndMovieAndDateAndShowingAndPaid(account, phone, movie,
				date, showing, "N");

		try {
			for (Order od : order_Info) {
				orderService.delete(od.getOrder_No());
			}

			return 1;
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}

//ECPay	

	// 1.init
	public static void initial() {
		all = new AllInOne("");
		System.out.println("AllInOne constructed!");
		Hashtable<String, String> dict = new Hashtable<String, String>();
		dict.put("MerchantID", "2000132");
		dict.put("CheckMacValue", "50BE3989953C1734E32DD18EB23698241E035F9CBCAC74371CCCF09E0E15BD61");
		System.out.println("compare CheckMacValue method testing result: " + all.compareCheckMacValue(dict));
	}

	// 2.generate 訂單
	public static String genAioCheckOutALL(String merchantTradeNo, String merchantTradeDate, String totalAmount,
			String tradeDesc, String itemName, String returnURL) {
		AioCheckOutALL obj = new AioCheckOutALL();
		obj.setMerchantID("2000132");
		obj.setMerchantTradeNo(merchantTradeNo);
//		obj.setMerchantTradeDate("2017/01/01 08:05:23");
		obj.setMerchantTradeDate(merchantTradeDate);
		obj.setTotalAmount(totalAmount);
		obj.setTradeDesc(tradeDesc);
		obj.setItemName(itemName);
		obj.setReturnURL(returnURL);
//		obj.setClientRedirectURL(returnURL);
		obj.setOrderResultURL("http://localhost:8080/shopping.searchingTrade");
		obj.setCustomField1(merchantTradeNo);
		obj.setNeedExtraPaidInfo("N");
		String form = all.aioCheckOut(obj, null);
		return form;
	}

	public static String postQueryTradeInfo(String merchantTradeNo) {
		QueryTradeInfoObj obj = new QueryTradeInfoObj();
		obj.setMerchantTradeNo(merchantTradeNo);
		return all.queryTradeInfo(obj);
	}

	@PostMapping("/searchingOrder/buyOrder")
	@ResponseBody
	public List<String> buyOrder(@RequestParam("orderNo") int orderNo, Model m) {
		System.out.println(orderNo);

		HttpSession session = request.getSession();

		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
		LocalDateTime now = LocalDateTime.now();
		String merchantTradeDate = dtf.format(now);
		String hour = merchantTradeDate.substring(11, 13);
		String minute = merchantTradeDate.substring(14, 16);
		String second = merchantTradeDate.substring(17, 19);

		Order targetOd = orderService.getOrder(orderNo);
		String strOrderNo = Integer.toString(orderNo);
		String merchantTradeNo = hour + "h" + minute + "m" + second + "s" + "No" + strOrderNo;
		System.out.println(merchantTradeNo);
		session.setAttribute("merchantTradeNo", merchantTradeNo);

		String account = targetOd.getAccount();
		String phone = targetOd.getPhone();
		String movie = targetOd.getMovie();
		String date = targetOd.getDate();
		String showing = targetOd.getShowing();
		String tradeDesc = account + ", " + phone + ", " + movie + ", " + date + ", " + showing;
		System.out.println(tradeDesc);

		int price = 0;
		String seats_No = "";

		List<Order> order_Info = orderService.findByAccountAndPhoneAndMovieAndDateAndShowingAndPaid(account, phone, movie,
				date, showing,"N");

		for (Order od : order_Info) {
			price += od.getUnit_Price();
			seats_No += (Integer.toString(od.getSeat()))+", ";
		}
		int seatSize = seats_No.length();
		
		String seat = seats_No.substring(0,seatSize-2);
		
		String strPrice = Integer.toString(price);
		System.out.println(strPrice);

		String itemName ="帳戶:" + account + ", 電話:" + phone + ", 電影名稱:" + movie + ", 日期:" + date + ", 場次:" + showing;

		String returnStringURL = "http://localhost:8080/shopping.searchingTrade";

		initial();

		String form = genAioCheckOutALL(merchantTradeNo, merchantTradeDate, strPrice, tradeDesc, itemName,
				returnStringURL);
		System.out.println(form);

		List<String> jsonForm = new ArrayList<String>();

		jsonForm.add(form);

		String tradeInfo = postQueryTradeInfo(merchantTradeNo); // 09h25m53sNo160
		System.out.println(tradeInfo);

		MovieOrderPayment payment = new MovieOrderPayment(merchantTradeNo, account, phone, "N", price, movie, date,
				showing, seat);

		shoppingService.savePayment(payment);

		return jsonForm;

	}

	@PostMapping("/searchingOrder/{pageNo}")
	@ResponseBody
	public List<Order> processQueryAllByPage(@PathVariable("pageNo") int pageNo, Model m) {

		HttpSession session = request.getSession();
		String account = (String) session.getAttribute("account");
		System.out.println(account);
		String phone = (String) session.getAttribute("phone");
		System.out.println(phone);

		int pageSize = 3;
		Pageable pageable = PageRequest.of(pageNo - 1, pageSize);
		Page<Order> page = orderService.findByAccountAndPhone(account, phone, pageable);

		m.addAttribute("totalPages", page.getTotalPages());
		m.addAttribute("totalElements", page.getTotalElements());

		for (Order od : page) {
			System.out.println(od.getMovie());
		}
		return page.getContent();
	}

	@PostMapping("/shopping.searchingTrade")
	public String testecpay() {

		String status = request.getParameter("RtnCode");
		System.out.println(status);

		String TradeNo = request.getParameter("TradeNo");
		System.out.println(TradeNo);

		String merchantTradeNo = request.getParameter("CustomField1");
		System.out.println(merchantTradeNo);

		String tradeInfo = postQueryTradeInfo(merchantTradeNo); 
		System.out.println(tradeInfo);
		System.out.println(TradeNo);
		MovieOrderPayment payment = shoppingService.getPayment(merchantTradeNo);
		payment.setPaid("Y");
		shoppingService.savePayment(payment);
		
		int size= merchantTradeNo.length();
		
		int orderNo =Integer.parseInt(merchantTradeNo.substring(11,size));
		System.out.println(orderNo);
		
		Order targetOd = orderService.getOrder(orderNo);
		String account = targetOd.getAccount();
		String phone = targetOd.getPhone();
		String movie = targetOd.getMovie();
		String date = targetOd.getDate();
		String showing = targetOd.getShowing();

		List<Order> order_Info = orderService.findByAccountAndPhoneAndMovieAndDateAndShowingAndPaid(account, phone, movie,
				date, showing, "N");
		
		for(Order od:order_Info) {
			od.setPaid("Y");
			orderService.update(od);
		}
		

		return "shoppingSystem/mainPage/testpay";

	}

	// 查詢交易紀錄
	@GetMapping("/shopping.getsearchingTrade")
	public String geTestEcpay() {

		return "shoppingSystem/mainPage/searchtrade";

	}

	@PostMapping("/shopping.tradehistory")
	@ResponseBody
	public List<MovieOrderPayment> getTradeHistory() {
		HttpSession session = request.getSession();
		String account = (String) session.getAttribute("account");
		System.out.println(account);
		String phone = (String) session.getAttribute("phone");
		System.out.println(phone);

		return shoppingService.findByAccountAndPhoneAndPaid(account, phone, "Y");
	}

}
