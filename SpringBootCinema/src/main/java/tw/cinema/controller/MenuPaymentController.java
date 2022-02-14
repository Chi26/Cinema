package tw.cinema.controller;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Hashtable;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import ecpay.payment.integration.AllInOne;
import ecpay.payment.integration.domain.AioCheckOutALL;
import ecpay.payment.integration.domain.QueryTradeInfoObj;
import tw.cinema.model.FoodListBean;
import tw.cinema.model.Members;
import tw.cinema.model.Menu;
import tw.cinema.model.MenuPayment;
import tw.cinema.model.MovieOrderPayment;
import tw.cinema.model.Order;
import tw.cinema.service.FoodListService;
import tw.cinema.service.MenuPaymentService;
import tw.cinema.service.MenuService;
import tw.cinema.service.StockService;

@Controller
@SessionAttributes(names = { "totalPages", "totalElements" })
public class MenuPaymentController {

	@Autowired
	private FoodListService FLService;

	@Autowired
	private StockService StService;

	@Autowired
	private MenuService MService;

	@Autowired
	private MenuPaymentService MpService;

	@Autowired
	HttpServletRequest request = null;

	public static AllInOne all;

	public String shoppingView() {

		String account = "admin";
		String phone = "0123456789";

		HttpSession session = request.getSession();
		session.setAttribute("account", account);
		session.setAttribute("phone", phone);

		return null;
	}

	@PostMapping("/MenuCar")
//	@ResponseBody
	public String AllMenu2(Model m,HttpServletRequest request) {
		System.out.println("進入儲存訂單");
		String status = request.getParameter("RtnCode");
		System.out.println(status);
		System.out.println(status.getClass());

		String TradeNo = request.getParameter("TradeNo");
		System.out.println(TradeNo);

		String merchantTradeNo = request.getParameter("CustomField1");
		System.out.println(merchantTradeNo);

		String tradeInfo = postQueryTradeInfo(merchantTradeNo);
//		System.out.println(tradeInfo);
		System.out.println(TradeNo);
		
		// 新增至已結帳訂單
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
		LocalDateTime now = LocalDateTime.now();
		String date = dtf.format(now);
		
		List<Menu> Menu = MService.findAll();
		String item = "";
		int account = 0;
		int totalprice = 0;
		for (Menu FLB : Menu) {
			item += (FLB.getFood() + "x" + FLB.getQuantity() + ",");
			totalprice += FLB.getMealprice();
			account = FLB.getAccount();
		}
		System.out.println(account);
		MenuPayment Mp = new MenuPayment();
		Mp.setAccount(account);
		Mp.setItem(item);
		Mp.setTotalprice(totalprice);
		Mp.setDate(date);
		MpService.insert(Mp);


		// 扣庫存
		List<FoodListBean> FF = FLService.renew();
		for (FoodListBean FLB : FF) {
			FLService.update2(FLB.getFood(), FLB.getPrice(), FLB.getPcs(), FLB.getFilename(), FLB.getPicture(),
					FLB.getPic(), FLB.getId());
		}

		//更新庫存異動表紀錄
		List<Map<String, Object>> stFF = StService.findQ2();

		for (Map<String, Object> st : stFF) {
			String food = (String) st.get("food");
			int pcs = (int) st.get("pcs");
			int decrease = (int) st.get("quantity");
			int id = (int) st.get("id");
			StService.updateQ(food, pcs, 0, decrease,date, id);
		}
		
		// 清空購物車
		MService.deleteByAccount(account);

		return "Menu/MyOrder";
	}

//	//ECPay	
//
//		// 1.init
	public static void initial() {
		all = new AllInOne("");
		System.out.println("AllInOne constructed!");
		Hashtable<String, String> dict = new Hashtable<String, String>();
		dict.put("MerchantID", "2000132");
		dict.put("CheckMacValue", "50BE3989953C1734E32DD18EB23698241E035F9CBCAC74371CCCF09E0E15BD61");
		System.out.println("compare CheckMacValue method testing result: " + all.compareCheckMacValue(dict));
	}

//
//		// 2.generate 訂單
	public static String genAioCheckOutALL(String merchantTradeNo, String merchantTradeDate, String totalAmount,
			String tradeDesc, String itemName, String returnURL) {
		AioCheckOutALL obj = new AioCheckOutALL();
		obj.setMerchantID("2000132");
		obj.setMerchantTradeNo(merchantTradeNo);
//			obj.setMerchantTradeDate("2017/01/01 08:05:23");
		obj.setMerchantTradeDate(merchantTradeDate);
		obj.setTotalAmount(totalAmount);
		obj.setTradeDesc(tradeDesc);
		obj.setItemName(itemName);
		obj.setReturnURL(returnURL);
//			obj.setClientRedirectURL(returnURL);
		obj.setOrderResultURL("http://localhost:8080/MenuCar");
		obj.setCustomField1(merchantTradeNo);
		obj.setNeedExtraPaidInfo("N");
		String form = all.aioCheckOut(obj, null);
		return form;
	}

//
	public static String postQueryTradeInfo(String merchantTradeNo) {
		QueryTradeInfoObj obj = new QueryTradeInfoObj();
		obj.setMerchantTradeNo(merchantTradeNo);
		return all.queryTradeInfo(obj);
	}

//		
	@GetMapping("/payMenu")
	@ResponseBody
	public List<String> buyOrder(Model m) {

		HttpSession session = request.getSession();

		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
		LocalDateTime now = LocalDateTime.now();
		String merchantTradeDate = dtf.format(now);
		String hour = merchantTradeDate.substring(11, 13);
		String minute = merchantTradeDate.substring(14, 16);
		String second = merchantTradeDate.substring(17, 19);
		int account = 1001;

		String merchantTradeNo = hour + "h" + minute + "m" + second + "s" + "No" + account;
		System.out.println(merchantTradeNo);
		session.setAttribute("merchantTradeNo", merchantTradeNo);

		List<Menu> Menu = MService.findAll();
		String item = "";

		int totalprice = 0;
		String phone = "0988522732";
		for (Menu FLB : Menu) {
			item += (FLB.getFood() + "x" + FLB.getQuantity() + ",");
			totalprice += FLB.getMealprice();
		}

		String strPrice = Integer.toString(totalprice);
		System.out.println(strPrice);

		String itemName = "帳戶:" + account + ", 電話:" + phone + ", 品項:" + item + ", 價錢:" + totalprice;
		String tradeDesc = account + ", " + phone + ", " + item + ", " + totalprice;
		String returnStringURL = "http://localhost:8080/shopping.searchingTrade";

		initial();

		String form = genAioCheckOutALL(merchantTradeNo, merchantTradeDate, strPrice, tradeDesc, itemName,
				returnStringURL);
		System.out.println(form);

		List<String> jsonForm = new ArrayList<String>();

		jsonForm.add(form);

		String tradeInfo = postQueryTradeInfo(merchantTradeNo); // 09h25m53sNo160

		return jsonForm;

	}

	// 查詢已付款訂單
	@GetMapping("/MyMenuOrder")
	@ResponseBody
	public List<Map<String, Object>> MyMenuOrder(Model m,HttpServletRequest request) {
		HttpSession session = request.getSession();
		Members member = (Members) session.getAttribute("members");			
		int account = member.getAccount_No();
		return MpService.findMyAccount(account);
	}

	// 已付款訂單使用者介面
	@GetMapping(path = "/thisOrder")
	public String ThisOrder() {
		return "Menu/MyOrder";
	}
	
	
	// 測試
//	@GetMapping("/test12345")
//	@ResponseBody
//	public String test(Model m) {
//		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
//		LocalDateTime now = LocalDateTime.now();
//		String date = dtf.format(now);
//		System.out.println(date.getClass());
//		return null;
//	}

}
