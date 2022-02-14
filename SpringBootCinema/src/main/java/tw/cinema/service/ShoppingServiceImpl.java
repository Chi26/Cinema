package tw.cinema.service;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Optional;
import java.util.Set;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import tw.cinema.model.MovieOrderPayment;
import tw.cinema.model.Order;
import tw.cinema.repository.ShoppingRepository;

@Service
@Repository
@Transactional
public class ShoppingServiceImpl implements ShoppingService {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	@Autowired
	private ShoppingRepository shoppingRepository;
	

	private LinkedHashSet<Integer> selectedSeat;
	

	@Override
	public Set<Integer> searchingSeat(String movie_name, Date date, String showing) {
		
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		String strDate = dateFormat.format(date);
		System.out.println(strDate);
		System.out.println(showing);
//		String strDateForSQL = strDate.substring(0, 3)+strDate.substring(5,7)+strDate.substring(89)
		
		String hql = "from Order o where o.movie =:movie_name and o.date =:date_time and o.showing =:showing_time";
		Query<Order> query = session.createQuery(hql, Order.class)
				.setParameter("movie_name", movie_name)
				.setParameter("date_time",strDate)
				.setParameter("showing_time", showing);

		List<Order> select_Info = query.getResultList();
		
		session.getTransaction().commit();
		session.close();
		
		Set<Integer> remaining_Seats = new LinkedHashSet<Integer>();
		
		for(int i=1;i<=50;i++) {
			remaining_Seats.add(i);
		}
		
		for(Order od:select_Info) {			
			remaining_Seats.remove(od.getSeat());
		}
		return remaining_Seats;
	}

	@Override
	public Set<Integer> pickSeat(int seat_num) {
		
		return null;
	}

	@Override
	public Set<Integer> deleteSeat(int pickseat_num) {
		
		return null;
	}

	@Override
	public Set<Integer> selected_Seats() {
		
		return null;
	}
	
	@Override
	public List<Order> buyer_Seat(String account, String phone, 
			String movie_name, String date, String showing,String paid){
		
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		
		
		String hql = "from Order o where o.account =:account and o.phone =:phone and o.movie =:movie_name and o.date =:date_time and o.showing =:showing_time and o.paid =:paid";
		Query<Order> query = session.createQuery(hql, Order.class)
				.setParameter("account", account)
				.setParameter("phone", phone)
				.setParameter("movie_name", movie_name)
				.setParameter("date_time",date)
				.setParameter("showing_time", showing)
				.setParameter("paid", paid);

		List<Order> select_Info = query.getResultList();
		
		session.getTransaction().commit();
		session.close();
		
		return select_Info;
	}
	
	@Override
	public MovieOrderPayment savePayment(MovieOrderPayment payment) {
		
		return shoppingRepository.save(payment);
	}
	
	@Override
	public MovieOrderPayment getPayment(String payment_NO) {
		
		Optional<MovieOrderPayment> targetPayment = shoppingRepository.findById(payment_NO);
		
		if (targetPayment.isPresent()) {

			return targetPayment.get();
		}

		return null;

	}
	
	@Override
	public List<MovieOrderPayment> findByAccountAndPhoneAndPaid(String account, String phone, String paid ){
		
		return shoppingRepository.findByAccountAndPhoneAndPaid(account, phone, paid);
	}
	
	@Override
	public void moveOrder(Integer order_No, List<Order> targetList) {
		
		Order moveOrder = null;
		
		if(targetList.size()!=0) {
			for(Order od:targetList) {
				if(order_No == od.getOrder_No()) {
					moveOrder = od;
				}
			}
			targetList.remove(moveOrder);
		}
	}

}
