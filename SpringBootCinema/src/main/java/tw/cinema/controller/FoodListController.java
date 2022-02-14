package tw.cinema.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import tw.cinema.model.FoodListBean;
import tw.cinema.model.Menu;
import tw.cinema.model.MenuPayment;
import tw.cinema.model.Stock;
import tw.cinema.service.FoodListService;
import tw.cinema.service.MenuPaymentService;
import tw.cinema.service.StockService;



@Controller
@SessionAttributes(names = { "totalPages", "totalElements" })
public class FoodListController {

	@Autowired
	private FoodListService FLService;
	
	
	@Autowired
	private StockService StService;
	
	@Autowired
	private MenuPaymentService MpService;

	//商品主頁
	@GetMapping("/food.controller")
	public String Action2() {
		return "FoodList/FoodList";
	}
	
	

//////轉跳執行頁面//////
	// 新增
	@GetMapping(path = "/addFood.controller")
	public String showCreateForm() {
		return "FoodList/InsertFoodList";
		
	}



////////////CRUD/////////////////

	// 新增
	@PostMapping("/addFood.controller")
	public String processInsertFileUploadAction(@RequestParam("myFiles") MultipartFile mf,
			@RequestParam("food") String food, @RequestParam("price") String Price,
			@RequestParam("pcs") String Pcs, Model m, HttpServletRequest request)
			throws IllegalStateException, IOException {

		FoodListBean FLB = FLService.findByFood(food);
		if (FLB != null) {
			System.out.println("品項已經存在");
			m.addAttribute("res", false);

			return "FoodList/InsertFoodList";

		} else {
			try {
				int price = Integer.parseInt(Price);
				int pcs = Integer.parseInt(Pcs);
				if(price>=0 && pcs>=0) {
					String fileName = mf.getOriginalFilename();

					String saveFileDir = request.getSession().getServletContext().getRealPath("/")
							+ "WEB-INF/resources/images\\";
					File saveDir = new File(saveFileDir);// 建立資料夾
					saveDir.mkdirs();// 會自動判斷資料夾存不存在,不存在會自動建立資料夾

					String saveFilePath = saveFileDir + fileName;// 串接實際要儲存的檔案路徑
					File saveFile = new File(saveFilePath);
					mf.transferTo(saveFile);// 存檔

					System.out.println("saveFilePath:" + saveFilePath);

					FoodListBean FLBean = new FoodListBean();

					FileInputStream is1 = new FileInputStream(saveFilePath);
					byte[] b = new byte[is1.available()]; // 有多少byte準備被讀進來
					is1.read(b);
					is1.close();

					String path = "/images/" + fileName;
					String realpath = '"' + path + '"';
					String pic = "<img class=\"player\" src =" + path + ">";

					FLBean.setFood(food);
					FLBean.setPrice(price);
					FLBean.setPcs(pcs);
					FLBean.setFilename(fileName);
					FLBean.setPicture(b);
					FLBean.setPic(pic);
					FLService.insert(FLBean);
					//初始化庫存
					FoodListBean FF = FLService.findByFood(food);
					DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
					LocalDateTime now = LocalDateTime.now();
					String date = dtf.format(now);
					StService.updateQ(food, pcs, pcs, 0,date, FF.getId());
					
					System.out.println(saveFilePath);
					m.addAttribute("res", true);
				}else {
					m.addAttribute("res", 2);
				}
				
			} catch (Exception e) {
				m.addAttribute("res", 2);
			}

			return "FoodList/InsertFoodList";
		}

	}

	@RequestMapping(path = "search/{id}", method = RequestMethod.GET)
	public String processQueryByIdAction(@PathVariable("id") int id, Model m) {
		FoodListBean FLB = FLService.findById(id);		
		m.addAttribute("food", FLB.getFood());
		m.addAttribute("price", FLB.getPrice());
		m.addAttribute("pcs", FLB.getPcs());
		m.addAttribute("pic", FLB.getPic());
		return "FoodList/UpdateFoodList";

	}
	


	// 更新
	@PostMapping("search/updateFood.controller")
	public String processUpdateAction(@RequestParam("myFiles") MultipartFile mf, @RequestParam("food") String food,
			@RequestParam("price") String Price, Model m,
			HttpServletRequest request) throws IllegalStateException, IOException {

		FoodListBean FLB = FLService.findByFood(food);
		if (FLB != null) {
			try {
				int price = Integer.parseInt(Price);
//				int pcs = Integer.parseInt(Pcs);
				if(price>=0 ) {
//				if(price>=0 && pcs>=0) {
					String fileName = mf.getOriginalFilename();

					String saveFileDir = request.getSession().getServletContext().getRealPath("/")
							+ "WEB-INF/resources/images\\";
					File saveDir = new File(saveFileDir);// 建立資料夾
					saveDir.mkdirs();// 會自動判斷資料夾存不存在,不存在會自動建立資料夾

					String saveFilePath = saveFileDir + fileName;// 串接實際要儲存的檔案路徑
					File saveFile = new File(saveFilePath);
					mf.transferTo(saveFile);// 存檔
					System.out.println("saveFilePath:" + saveFilePath);

					FoodListBean FLBean = new FoodListBean();

					FileInputStream is1 = new FileInputStream(saveFilePath);
					byte[] b = new byte[is1.available()]; // 有多少byte準備被讀進來
					is1.read(b);
					is1.close();

					String path = "/images/" + fileName;
					String realpath = '"' + path + '"';
					String pic = "<img class=\"player\" src =" + path + ">";

					FLBean.setId(FLB.getId());
					FLBean.setFood(food);
					FLBean.setPrice(price);
//					FLBean.setPcs(pcs);
					FLBean.setPcs(FLB.getPcs());
					FLBean.setFilename(fileName);
					FLBean.setPicture(b);
					FLBean.setPic(pic);
					FLService.update(FLBean);					
				
					m.addAttribute("res", true);
				}else {
					m.addAttribute("res", 2);
				}
					
				}catch (Exception e) {
					m.addAttribute("res", 2);
				}

			return "FoodList/UpdateFoodList";

		} else {
			m.addAttribute("res", false);
			return "FoodList/UpdateFoodList";
		}

	}
	


	// 刪除
		@RequestMapping(path = "delete/{id}", method = RequestMethod.GET)
		public String processDeleteACtion(@PathVariable("id") int id, Model m) {

			
			//刪除庫存
			FoodListBean FF = FLService.findById(id);
			DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
			LocalDateTime now = LocalDateTime.now();
			String date = dtf.format(now);
			StService.updateQ(FF.getFood(), 0, 0, FF.getPcs(),date, id);
			
			FLService.deleteById(id);
			m.addAttribute("res", "刪除");
			
			return "FoodList/FoodList";

		}


	@PostMapping("/AllFoodList.controller")
	@ResponseBody
	public List<FoodListBean> processQueryAllAction() {
		return FLService.findAll();
	}
	
	

	@PostMapping("/AllFoodListByPage/{pageNo}")
	@ResponseBody // 才會變成json格式
	public List<FoodListBean> processQueryAllByPageAction(@PathVariable("pageNo") int pageNo, Model m) {
		int pageSize = 7;

		Pageable pageable = PageRequest.of(pageNo - 1, pageSize);
		Page<FoodListBean> page = FLService.findAllByPage(pageable);

		m.addAttribute("totalPages", page.getTotalPages());
		m.addAttribute("totalElements", page.getTotalElements());

		return page.getContent();
	}
	
	
	@PostMapping("/searchid") @ResponseBody
	public FoodListBean processQueryByIdAction2(@RequestParam("foodNo") int foodNo) {
		return FLService.findById(foodNo);
	}
	
	// 查詢所有已付款訂單
	@GetMapping("/TotalMenuOrder")
	@ResponseBody
	public List<MenuPayment> TotalMenuOrder(Model m) {
		
		return MpService.findAll();
	}

	
	// 已付款訂單使用者介面
	@GetMapping(path = "/AllOrder")
	public String AllOrder() {
		return "FoodList/AllOrder";
	}

	// 查詢所有庫存紀錄	(最新資料放上面)
	@GetMapping("/TotalStock")
	@ResponseBody
	public List<Stock> TotalStock(Model m) {		
		return StService.findAllDESC();
	}

	
	// 所有庫存紀錄管理者介面
	@GetMapping(path = "/AllStock")
	public String AllStock() {
		return "FoodList/AllStock";
	}

	//查找個別庫存
	@GetMapping("/FindStock")
	@ResponseBody
	public List<Map<String, Object>> FindStock (@RequestParam("id") int id,Model m) {	
		return StService.findAllbyId(id);		
	}
	
	// 查找個別庫存管理者介面
	@GetMapping(path = "/FindAllStock")
	public String FindAllStock(@RequestParam("id") int id,Model m) {	
		m.addAttribute("id", id);
		return "FoodList/FindAllStock";
	}
	
	//改變庫存
	@RequestMapping("/ChangeStock")
	@ResponseBody
	public String ChangeStock (Model m,@RequestBody Stock stock) {	
		System.out.println("這裡是改變庫存");
		
		//stock庫存操作
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
		LocalDateTime now = LocalDateTime.now();
		String date = dtf.format(now);
		Stock st = StService.findById(stock.getId());
		int pcs = st.getPcs()+stock.getIncrease()-stock.getDecrease();
		StService.updateQ(st.getFood(), pcs, stock.getIncrease(), stock.getDecrease(),date, stock.getId());		
		m.addAttribute("res", "庫存更新成功");
		//FoodList庫存操作
		FoodListBean FLB = FLService.findById(stock.getId());
		FLService.update2(FLB.getFood(), FLB.getPrice(), pcs, FLB.getFilename(), FLB.getPicture(),
				FLB.getPic(), FLB.getId());
		
		return "FoodList/FindAllStock";	
//		return "FoodList/FoodList";	
	}


}
