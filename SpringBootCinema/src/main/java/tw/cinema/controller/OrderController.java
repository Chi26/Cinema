package tw.cinema.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import tw.cinema.model.Order;
import tw.cinema.service.OrderService;

@Controller
@RequestMapping(path = "/order")
public class OrderController {

	@Autowired
	private OrderService odService;
//	private OrderService odService = new OrderService();

	@Autowired
	HttpServletRequest request = null;

	// 訂單CRUD畫面(View)
	@GetMapping("/ordermain.controller")
	public String processMainAction() {
		return "order/OrderCRUD";
	}

	// 1.新增訂單
	@GetMapping("/ordercreate")
	public String createOrderBean(Model m) {

		Order od = new Order();
		m.addAttribute("Order", od);

		return "order/create/OrderCreate";
	}

	@PostMapping("createOrders")
	public String createOrder(@ModelAttribute("Order") Order od, BindingResult result) {

		int p = od.getUnit_Price();
		int n = od.getNumber();
		od.setMovie_Price(p * n);

		Order uniqueness = odService.checkOrderUnique(od.getMovie(), od.getSeat(), od.getDate(), od.getShowing());

		try {
				
			if (uniqueness == null) {

				odService.insert(od);
				HttpSession session = request.getSession();

				session.setAttribute("create_Info", od);

				return "order/create/createAction";
			}

		} catch (Exception e) {
			e.printStackTrace();
			return "order/create/insertError";
		}

		return "order/create/orderRepeat";

	}
	
	// 2.刪除訂單
		@GetMapping("/orderdelete")
		public String deleteOrderBean() {

			return "order/delete/OrderDelete";

		}
		
		@PostMapping("/deleteOrders")                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
		public String deleteOrder(@RequestParam("order_No") int order_No, Model m) {

			Order od = odService.delete(order_No);

			if (od != null) {
				HttpSession session = request.getSession();
				session.setAttribute("delete_Info", od);
				
				
				return "order/delete/deleteAction";
			} else {
				return "order/delete/deletefail";
			}

		}

		// 3.修改訂單
		@GetMapping("/orderupdate")
		public String updateOrderBean(Model m) {

			Order od = new Order();
			m.addAttribute("Order", od);

			return "order/update/OrderUpdate";

		}
		
		@PostMapping("/updateOrders")
		public String updateOrders(@ModelAttribute("Order") Order od, BindingResult result) {

			Order uniqueness = odService.checkOrderUnique(od.getMovie(), od.getSeat(), od.getDate(), od.getShowing());

			try {
				

				if (uniqueness == null) {
					

					Order targetOrder = odService.update(od);

					HttpSession session = request.getSession();
					session.setAttribute("update_Info", targetOrder);

					return "order/update/updateAction";
				}
			} catch (Exception e) {
				e.printStackTrace();

				return "order/update/updateError";
			}

			return "order/update/orderRepeat";

		}
		
		@PostMapping("/updateOrderwithno")
		public String updateOrderWithNo(@ModelAttribute("Order") Order od, BindingResult result) {

			Order uniqueness = odService.checkOrderUnique(od.getMovie(), od.getSeat(), od.getDate(), od.getShowing());

			try {
				
				HttpSession session = request.getSession();
				int updatevalue = (int) session.getAttribute("updatevalue");
				od.setOrder_No(updatevalue);
				
				if (uniqueness == null) {
					

					Order targetOrder = odService.update(od);

					session.setAttribute("update_Info", targetOrder);

					return "order/update/updateAction";
				}
			} catch (Exception e) {
				e.printStackTrace();

				return "order/update/updateError";
			}

			return "order/update/orderRepeat";

		}

		

		// 4.查詢訂單
		@GetMapping("/orderread")
		public String readOrderId() {

			return "order/read/OrderRead";
		}
		
		@PostMapping("/readOrders")
		public String searchOrderId(@RequestParam("maxid") int maxid, @RequestParam("minid") int minid) {

			if (maxid >= minid) {
				HttpSession session = request.getSession();
				List<Order> select_Info = odService.select(minid, maxid);
				session.setAttribute("select_Info", select_Info);
				session.setAttribute("maxid", maxid);
				session.setAttribute("minid", minid);

				
				if (select_Info.size() != 0) {
					return "order/read/readAction";
				} else {
					return "order/read/orderNotFound";
				}

			} else {

				return "order/read/orderNotFound";
			}

		}

		// 4.updateordelete after search
		@PostMapping("/updateordelete")
		public String updateordelete(Model m) {
			
		String delete = request.getParameter("delete");
		HttpSession session = request.getSession();

		
		if( delete != null ) {
			
			int deletevalue = Integer.parseInt(request.getParameter("delete"));
			odService.delete(deletevalue);
			
			int maxid = (int) session.getAttribute("maxid");
			int minid = (int) session.getAttribute("minid");
			
			List<Order> select_Info = odService.select(minid, maxid);
			session.setAttribute("select_Info", select_Info);
			
			return "order/read/readAction";
		} else { 
			
			int updatevalue = Integer.parseInt(request.getParameter("update"));
			session.setAttribute("updatevalue", updatevalue);
			Order od = odService.getOrder(updatevalue);
			m.addAttribute("Order",od);
			
			return "order/update/OrderUpdateNoReadOnly";
		}
		}
		

		



}
