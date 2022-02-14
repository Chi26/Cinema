package tw.cinema.controller;

import java.net.http.HttpRequest;
import java.util.Date;
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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;


import tw.cinema.model.FoodListBean;
import tw.cinema.model.Members;
import tw.cinema.model.Menu;

import tw.cinema.service.FoodListService;
import tw.cinema.service.MenuService;



@Controller
@SessionAttributes(names = { "totalPages", "totalElements" })
public class MenuController {
	@Autowired
	private MenuService MService;
	
	@Autowired
	HttpServletRequest request = null;

	
	//商品主頁
	@GetMapping("/menu.controller")
	public String MenuHome() {
		return "Menu/MenuList";
	}
	
	//影城介紹
		@GetMapping("/introduce.controller")
		public String introduce() {
			return "Menu/introduce";
		}
		
	//影城地圖
		@GetMapping("/map.controller")
		public String gomap() {
			return "Menu/map";
		}
	
	

	@GetMapping("/searchmenu")
	public String SearchMenu(@RequestParam("foodNo") int foodNo, Model m) {		
		m.addAttribute("foodNo", foodNo);
		return "Menu/SearchMenu";
	}
	

	
	
	//新增和更新
		@PostMapping("/insertmenu")	
		@ResponseBody
		public Menu InsertMenu(@RequestBody Menu menu, Model m,HttpServletRequest request) {
			Menu me= MService.findByFood(menu.getFood());
			HttpSession session = request.getSession();
			Members member = (Members) session.getAttribute("members");			
			int account = member.getAccount_No();
			
			
			//新增
			if (me==null) {
				Menu newmenu=new Menu(account,menu.getFood(),menu.getPrice(),menu.getQuantity(),menu.getPoint(),menu.getMealprice(),menu.getId());	
				MService.insert(newmenu);		
				m.addAttribute("res", "更新");
			//更新
			}else {
				int foodno = me.getFoodno();
				Menu updatemenu=new Menu(foodno,account,menu.getFood(),menu.getPrice(),menu.getQuantity(),menu.getPoint(),menu.getMealprice(),menu.getId());			
				MService.update(updatemenu);
				m.addAttribute("res", "更新");
			}	
//			return "redirect:menu.controller";
			return me;

		}
	
	//查詢全部
	@GetMapping("/AllMenuOrder")
	@ResponseBody
	public List<Menu> AllMenu(Model m) {	
		
		return MService.findAll();
	}
	
	
	
	@GetMapping("/AllMenuList")
	public String AllMenuList(Model m) {
		int finalprice=0;
		for (Menu st : MService.findAll()) {
			finalprice+=st.getMealprice();			
		}
		m.addAttribute("finalprice", finalprice);
		System.out.println(finalprice);
		return "Menu/AllMenu";
	}
	

	
	// 刪除
	@RequestMapping(path = "deletemenu/{foodno}", method = RequestMethod.GET)
	public String DeleteMenu(@PathVariable("foodno") int foodno, Model m) {
		System.out.println("這裡是刪除");
		MService.deleteById(foodno);
		m.addAttribute("res", "刪除");
		return "Menu/AllMenu";

	}
	
	//查找全部ID
	@GetMapping("/AllMenuId")
	@ResponseBody
	public List<Map<String, Object>> AllMenuId(Model m) {
		System.out.println("查看全部ID");
		for( Object id : MService.findAllId()) {			
			System.out.println(id);

		}	
		return MService.findAllId();
	}
	



}
