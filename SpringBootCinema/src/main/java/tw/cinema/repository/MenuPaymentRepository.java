package tw.cinema.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import tw.cinema.model.MenuPayment;

public interface MenuPaymentRepository extends JpaRepository<MenuPayment, Integer>{

	Optional<MenuPayment> findByAccount(int account);
	
	@Query(value = "select * from Menupayment where account=? ", nativeQuery = true) //資料表名字
	 List<Map<String, Object>> findMyAccount(@Param("account") int account);

}
