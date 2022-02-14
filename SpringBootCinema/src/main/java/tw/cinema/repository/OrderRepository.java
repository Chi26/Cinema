package tw.cinema.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;

import tw.cinema.model.Order;

public interface OrderRepository extends PagingAndSortingRepository<Order, Integer> {
	
	@Query(value="SELECT * FROM OrderList od where od.movie=?1 and od.seat=?2 and od.date=?3 and od.showing=?4"
			,nativeQuery = true)	
	public Order checkOrderUnique(String movie_name, int seat_num, String date_time, String showing_time);
	
	@Query(value="SELECT * FROM OrderList od where od.order_No between ?1 and ?2",nativeQuery = true)
	public List<Order> select(int min_id,int max_id);
	//findByAccountAndPhone
	
	public Page<Order> findByAccountAndPhone(String account,String phone, Pageable pageable);
	
	public List<Order> findByAccountAndPhoneAndMovieAndDateAndShowingAndPaid(
			String account,String phone,String movie, String date, String showing, String paid);
	
	@Query(value="SELECT * FROM OrderList od where od.account=?1 and od.phone=?2 and od.paid=?3",nativeQuery = true)
	public List<Order> MySearchMethod(String account,String phone, String paid);

}
