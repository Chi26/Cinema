package tw.cinema.repository;


import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import tw.cinema.model.MovieOrderPayment;


public interface ShoppingRepository extends JpaRepository<MovieOrderPayment, String> {
	
	public List<MovieOrderPayment> findByAccountAndPhoneAndPaid(String account, String phone, String paid );

}
