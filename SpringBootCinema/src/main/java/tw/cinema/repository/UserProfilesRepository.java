package tw.cinema.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import tw.cinema.model.Members;

public interface UserProfilesRepository extends JpaRepository<Members, String> {
	
	@Query(value = "SELECT * FROM member WHERE username= ?1",nativeQuery = true)
	public Optional<Members> findByName(String username);
	
	@Query(value = "SELECT * FROM member WHERE username= ?1",nativeQuery = true)
	Members checkByUsername(String username);
	
	@Query(value = "SELECT * FROM member WHERE email= ?1",nativeQuery = true)
	Members selectByEmail(String email);
	
	@Query(value = "UPDATE Member SET password= ?1 WHERE email= ?2",nativeQuery = true)
	Members changePassword(String email,String password);
}
