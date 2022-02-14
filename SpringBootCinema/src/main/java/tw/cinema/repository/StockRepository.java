package tw.cinema.repository;

import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import tw.cinema.model.FoodListBean;
import tw.cinema.model.Stock;

public interface StockRepository extends JpaRepository<Stock, Integer>{
	
	@Query(value = "select a.food,a.pcs,b.quantity,a.id from Food a ,Menu b where a.id=b.id ", nativeQuery = true) //資料表名字
	 List<Map<String, Object>> findQ2(@Param("food") String food,@Param("pcs") String pcs,@Param("quantity") String quantity,@Param("id") String id);

	
	@Query(value = "select a.food,a.pcs,b.quantity,a.id from Food a ,Menu b where a.id=b.id", nativeQuery = true) //資料表名字
	public List<Stock> desQ();

	
	@Modifying
	@Query(value = "INSERT INTO Stock (food,pcs,increase,decrease,date,id)\r\n"
			+ "VALUES (?,?,?,?,?,?);",nativeQuery = true)
	public void updateQ(String food,int pcs,int increase,int decrease,String date ,int id);
	
	@Query(value = "select * from Stock where id=? order by stockno DESC", nativeQuery = true) //資料表名字
	 List<Map<String, Object>> findAllbyId(@Param("id") int id);
	
	@Query(value = "select *from Stock order by stockno DESC ", nativeQuery = true) //資料表名字
	List<Stock> findAllDESC();
}
