package tw.cinema.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import tw.cinema.model.FoodOrder;


public interface FoodOrderRepository extends JpaRepository<FoodOrder, Integer> {
	
	@Query(value="SELECT * FROM FoodOrderList od where od.movie=?1 and od.seat=?2 and od.date=?3 and od.showing=?4"
			,nativeQuery = true)	
	public FoodOrder checkOrderUnique(String movie_name, int seat_num, String date_time, String showing_time);
	
	@Query(value="SELECT * FROM FoodOrderList od where od.foodorder_No between ?1 and ?2",nativeQuery = true)
	public List<FoodOrder> select(int min_id,int max_id);
}
