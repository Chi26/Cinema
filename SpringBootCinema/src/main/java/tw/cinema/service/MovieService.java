package tw.cinema.service;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import tw.cinema.model.Movie;
import tw.cinema.repository.MovieRepository;

@Service
@Transactional
public class MovieService {

	@Autowired
	private MovieRepository movieRepository;
	
	
	

	public Movie insert(Movie movie) {
		return movieRepository.save(movie);
	}

	public Movie update(Movie movie) {
		return movieRepository.save(movie);
	}

	public void delete(Integer id) {
		movieRepository.deleteById(id);
	}

	public List<Movie> findAll() {
		return movieRepository.findAll();
	}
	
	public Movie findById(Integer id) {
	 Optional<Movie> op1 = movieRepository.findById(id);
	 if (op1.isPresent()) {
		return op1.get();
	}
	 return null;
	}

	public Page<Movie> findByPage(Pageable pageable) {
		return movieRepository.findAll(pageable);
	}
	
	public Movie findByName(String name) {
	return	movieRepository.queryByName(name);

}
	public List<Movie> findAction(String type) {

		return movieRepository.queryByTypeAction(type);
	
}
}
