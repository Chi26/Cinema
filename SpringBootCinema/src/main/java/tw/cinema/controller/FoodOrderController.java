package tw.cinema.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import tw.cinema.model.FoodOrder;
import tw.cinema.model.Order;
import tw.cinema.service.FoodOrderService;
import tw.cinema.service.OrderService;

@Controller
@RequestMapping(path = "/foodOrder")
public class FoodOrderController {
	
	@Autowired
	private FoodOrderService fodService;
//	private OrderService odService = new OrderService();

	@Autowired
	HttpServletRequest request = null;

	// 訂單CRUD畫面(View)
	@GetMapping("/foodordermain.controller")
	public String processMainAction() {
		return "foodorder/OrderCRUD";
	}

	// 1.新增訂單
	@GetMapping("/foodordercreate")
	public String createFoodOrderBean(Model m) {

		FoodOrder fod = new FoodOrder();
		m.addAttribute("FoodOrder", fod);

		return "foodorder/create/OrderCreate";
	}
	
	@PostMapping("createFoodOrders")
	public String createOrder(@ModelAttribute("FoodOrder") FoodOrder fod, BindingResult result) {

		int p = fod.getUnit_Price();
		int n = fod.getNumber();
		fod.setFood_Price(p * n);

		FoodOrder uniqueness = fodService.checkOrderUnique(fod.getMovie(), fod.getSeat(), fod.getDate(), fod.getShowing());

		try {
				
			if (uniqueness == null) {

				fodService.insert(fod);
				

				
				HttpSession session = request.getSession();

				session.setAttribute("create_Info", fod);

				return "foodorder/create/createAction";
			}

		} catch (Exception e) {
			e.printStackTrace();
			return "foodorder/create/insertError";
		}

		return "foodorder/create/orderRepeat";

	}
	
	// 2.刪除訂單
			@GetMapping("/foodorderdelete")
			public String deleteFoodOrderBean() {

				return "foodorder/delete/OrderDelete";

			}
			
			@PostMapping("/deleteFoodOrders")                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
			public String deleteFoodOrder(@RequestParam("foodorder_No") int foodorder_No, Model m) {

				FoodOrder fod = fodService.delete(foodorder_No);

				if (fod != null) {
					HttpSession session = request.getSession();
					session.setAttribute("delete_Info", fod);
					
					
					return "foodorder/delete/deleteAction";
				} else {
					return "foodorder/delete/deletefail";
				}

			}
			// 3.修改訂單
			@GetMapping("/foodorderupdate")
			public String updateFoodOrderBean(Model m) {

				FoodOrder fod = new FoodOrder();
				m.addAttribute("FoodOrder", fod);

				return "foodorder/update/OrderUpdate";

			}
			
			@PostMapping("/updateFoodOrders")
			public String updateFoodOrders(@ModelAttribute("FoodOrder") FoodOrder fod, BindingResult result) {

				FoodOrder uniqueness = fodService.checkOrderUnique(fod.getMovie(), fod.getSeat(), fod.getDate(), fod.getShowing());

				try {

					if (uniqueness == null) {
						
						FoodOrder targetOrder = fodService.update(fod);

						HttpSession session = request.getSession();
						session.setAttribute("update_Info", targetOrder);

						return "foodorder/update/updateAction";
					}
				} catch (Exception e) {
					e.printStackTrace();

					return "foodorder/update/updateError";
				}

				return "foodorder/update/orderRepeat";

			}
			
			@GetMapping("/foodorderread")
			public String readFoodOrderId() {

				return "foodorder/read/OrderRead";
			}
			
			@PostMapping("/readFoodOrders")
			public String searchFoodOrderId(@RequestParam("maxid") int maxid, @RequestParam("minid") int minid) {

				if (maxid >= minid) {
					HttpSession session = request.getSession();
					List<FoodOrder> select_Info = fodService.select(minid, maxid);
					session.setAttribute("select_Info", select_Info);

					if (select_Info.size() != 0) {
						return "foodorder/read/readAction";
					} else {
						return "foodorder/read/orderNotFound";
					}

				} else {

					return "foodorder/read/orderNotFound";
				}

			}


}
