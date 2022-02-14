package tw.cinema.service;

import java.util.List;
import java.util.Optional;

import org.hibernate.query.criteria.internal.expression.function.AggregationFunction.COUNT;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import tw.cinema.model.Order;
import tw.cinema.repository.OrderRepository;

@Service
@Transactional
public class OrderService {

	@Autowired
	private OrderRepository odRepository;

	public Order getOrder(int order_No) {

		Optional<Order> targetOrder = odRepository.findById(order_No);

		if (targetOrder.isPresent()) {

			return targetOrder.get();
		}

		return null;

	}

	public Order insert(Order od) {

		return odRepository.save(od);
	}

	public Order delete(int order_No) {

		Optional<Order> targetOrder = odRepository.findById(order_No);

		if (targetOrder.isPresent()) {
			odRepository.deleteById(order_No);
			return targetOrder.get();
		}

		return null;

	}

	public Order update(Order od) {

		return odRepository.save(od);
	}

	public Order checkOrderUnique(String movie_name, int seat_num, String date_time, String showing_time) {

		return odRepository.checkOrderUnique(movie_name, seat_num, date_time, showing_time);
	}

	public List<Order> select(int min_id, int max_id) {

		return odRepository.select(min_id, max_id);
	}

	public Page<Order> findAllByPage(Pageable pageable) {

		return odRepository.findAll(pageable);
	}

	public Page<Order> findByAccountAndPhone(String account, String phone, Pageable pageable) {

		return odRepository.findByAccountAndPhone(account, phone, pageable);
	}

	public List<Order> mySearchMethod(String account, String phone, String paid) {

		return odRepository.MySearchMethod(account, phone, paid);
	}
	
	public List<Order> findByAccountAndPhoneAndMovieAndDateAndShowingAndPaid(
			String account,String phone,String movie, String date, String showing, String paid){
		
		return odRepository
				.findByAccountAndPhoneAndMovieAndDateAndShowingAndPaid(account, phone, movie, date, showing,paid);
	}
	

	public void addOrder(Order od, List<Order> targetList) {

		if (targetList.size() == 0) {
			targetList.add(od);
			System.out.println(od.getMovie() + "已加入" + "target_List!");

		} else {

			int count = 0;

			for (Order tod : targetList) {

				boolean sameMovie = ((tod.getMovie()).equals(od.getMovie()));

				boolean sameDate = ((tod.getDate()).equals(od.getDate()));

				boolean sameShowing = ((tod.getShowing()).equals(od.getShowing()));
				if ((sameMovie && sameDate && sameShowing)!=true) {
					count++;
				}

			}
			
			if (count == targetList.size()) {
				targetList.add(od);
			}

		}
	}

}
