package tw.cinema.service;

import java.util.Date;
import java.util.List;
import java.util.Set;

import tw.cinema.model.MovieOrderPayment;
import tw.cinema.model.Order;





public interface ShoppingService {
	
	public Set<Integer> searchingSeat(String movie, Date date, String showing);
	
	public Set<Integer> pickSeat(int seat_num);
	
	public Set<Integer> deleteSeat(int pickseat_num);
	
	public Set<Integer> selected_Seats();
	
	public List<Order> buyer_Seat(String account, String phone, 
			String movie_name, String date, String showing, String paid);
	
	public MovieOrderPayment savePayment(MovieOrderPayment payment);
	
	public MovieOrderPayment getPayment(String payment_No);
	
	public List<MovieOrderPayment> findByAccountAndPhoneAndPaid(String account, String phone, String paid );

	public void moveOrder(Integer order_No, List<Order> targetList);
}
