package tw.cinema.repository;

import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import tw.cinema.model.FoodListBean;



//JpaRepository<實體類，主鍵型別>
public interface FoodListRepository extends JpaRepository<FoodListBean, Integer>{

	Optional<FoodListBean> findByFood(String food);

	void deleteByFood(String food);
	
	@Query(value = "select id,quantity from Menu ", nativeQuery = true) //資料表名字
	 List<Map<String, Object>> findQ(@Param("id") String id,@Param("quantity") String quantity);

//	@Query(value = "select a.id,a.food,a.price,(a.pcs-b.quantity) as pcs,a.filename,a.picture,a.pic from Food a ,Menu b where a.id=b.id ", nativeQuery = true) //資料表名字
//	 List<Food> instock();
	
	@Query(value = "select a.id,a.food,a.price,(a.pcs-b.quantity) as pcs,a.filename,a.picture,a.pic from Food a ,Menu b where a.id=b.id", nativeQuery = true) //資料表名字
	public List<FoodListBean> renew();
	

	
	@Modifying
	@Query(value = "Update Food set food=?,price=?,pcs=?,filename=?,picture=?,pic=? where id=?",nativeQuery = true)
	public void update2(String food,int price ,int pcs, String filename,byte[] picture ,String pic,int id);
	

}
