package tw.cinema.repository;


import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import tw.cinema.model.Members;

public interface MembersRepository extends JpaRepository<Members, Integer> {
	@Query(value = "SELECT SUBSTRING(id,2,1) AS gender FROM Member WHERE SUBSTRING(id,2,1)=?1",nativeQuery = true)
	 List<Object[]> statGender(String id);
	 
	 @Query(value = "SELECT LEFT(address, 3) AS place FROM Member WHERE LEFT(address, 3)=?1",nativeQuery = true)
	 List<Object[]> statAddress(String address);
	 
	 @Query(value = "SELECT LEFT(birthday, 4) AS age FROM Member WHERE LEFT(birthday, 4) BETWEEN ?1 AND ?2",nativeQuery = true)
	 List<Object[]> statAge(String start,String end);
}
