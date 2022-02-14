package tw.cinema.repository;



import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import tw.cinema.model.Movie;

public interface MovieRepository extends JpaRepository<Movie, Integer> {
	
	@Query(value = "select * from Movie where movie_Name = ?1", nativeQuery = true)
    Movie queryByName(String name);

	@Query(value = "select * from Movie where type =?1", nativeQuery = true)
      List<Movie> queryByTypeAction(String type);
}
