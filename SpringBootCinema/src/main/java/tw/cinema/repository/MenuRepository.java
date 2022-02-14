package tw.cinema.repository;

import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import tw.cinema.model.FoodListBean;
import tw.cinema.model.Menu;


public interface MenuRepository extends JpaRepository<Menu, Integer> {	
	Optional<Menu> findByFood(String food);

	void deleteByFood(String food);
	
//	@Query(value = "select food from Menu ", nativeQuery = true) //資料表名字
//	 List<Map<String, Object>> findAllId(@Param("food") String food);
	
	@Query(value = "select id from Menu ", nativeQuery = true) //資料表名字
	 List<Map<String, Object>> findAllId(@Param("id") String id);
	
	@Query(value = "select id,quantity from Menu ", nativeQuery = true) //資料表名字
	 List<Map<String, Object>> findQ(@Param("id") String id,@Param("quantity") String quantity);

	void deleteByAccount(int account);

	
}