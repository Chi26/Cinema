package tw.cinema.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import tw.cinema.model.FoodOrder;
import tw.cinema.model.Order;
import tw.cinema.repository.FoodOrderRepository;

@Service
@Transactional
public class FoodOrderService {
	
	@Autowired
	private FoodOrderRepository fodRepository;
	
	
	public FoodOrder insert(FoodOrder od) {

		return fodRepository.save(od);
	}

	public FoodOrder delete(int foodorder_No) {

		
			Optional<FoodOrder> targetOrder = fodRepository.findById(foodorder_No);
			
			if (targetOrder.isPresent()) {
				fodRepository.deleteById(foodorder_No);
			return targetOrder.get();
			}
			
			return null;
										
	}

	public FoodOrder update(FoodOrder od) {

		return fodRepository.save(od);
	}

	public FoodOrder checkOrderUnique(String movie_name, int seat_num, String date_time, String showing_time) {

		return fodRepository.checkOrderUnique(movie_name, seat_num, date_time, showing_time);
	}

	public List<FoodOrder> select(int min_id, int max_id) {

		return fodRepository.select(min_id, max_id);
	}
	
	public Page<FoodOrder> findAllByPage(Pageable pageable) {
				
		return fodRepository.findAll(pageable);
	}
}
