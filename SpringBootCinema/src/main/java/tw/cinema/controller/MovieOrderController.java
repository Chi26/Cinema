package tw.cinema.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import tw.cinema.model.Order;
import tw.cinema.service.OrderService;

@Controller
@RequestMapping(path = "/movieorder")
@SessionAttributes(names = { "MovieOrdertotalPages", "MovieOrdertotalElements" })

public class MovieOrderController {

	@Autowired
	private OrderService odService;

	@Autowired
	HttpServletRequest request = null;

	// 訂單CRUD畫面(View)
	@GetMapping("/ordermain.controller")
	public String processMainAction() {
		return "movieorder/movieorderCRUD";
	}

	// 查詢訂單
	@PostMapping("/queryallbypage/{pageNo}")
	@ResponseBody
	public List<Order> processQueryAllBtPage(@PathVariable("pageNo") int pageNo, Model m) {

		int pageSize = 10;
		Pageable pageable = PageRequest.of(pageNo - 1, pageSize);
		Page<Order> page = odService.findAllByPage(pageable);

		m.addAttribute("MovieOrdertotalPages", page.getTotalPages());
		m.addAttribute("MovieOrdertotalElements", page.getTotalElements());

		return page.getContent();
	}

	@PostMapping("/cancelOrder")
	@ResponseBody
	public Integer deleteOrder(@RequestParam("orderNo") int orderNo, @RequestParam("pageNo") int pageNo, Model m) {
		System.out.println(orderNo);

		Order targetOd = odService.getOrder(orderNo);

		try {
			int pageSize = 10;
			Pageable pageable = PageRequest.of(pageNo - 1, pageSize);
			Page<Order> page = odService.findAllByPage(pageable);

			odService.delete(targetOd.getOrder_No());

			return 1;
			
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}
	
	@GetMapping("/insertorder")
	public String processInsertAction() {
		return "movieorder/create/movieorderCreate";
	}
	
	@PostMapping("/insertOrderbyAjax")
	@ResponseBody
	public Integer inMovieOrder(@RequestBody Order od) {		
		System.out.println(od.getUnit_Price());		
		odService.insert(od);		
		System.out.println("新增成功");				
		return 1;
	}
	
	@PostMapping("/searchoneorder")
	@ResponseBody
	public Order insertBird(@RequestParam int orderNo) {		
	
		return odService.getOrder(orderNo);
	}
	
	@PostMapping("/updateOrderbyAjax")
	@ResponseBody
	public Integer updateMovieOrder(@RequestBody Order od) {		

		odService.update(od);	
		System.out.println("修改成功");				
		return 1;
	}


}
