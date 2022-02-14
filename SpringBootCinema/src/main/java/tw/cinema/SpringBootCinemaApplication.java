package tw.cinema;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.boot.web.servlet.ServletComponentScan;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

@SpringBootApplication
@ServletComponentScan
@EnableJpaRepositories(basePackages = {"tw.cinema"})
@EntityScan(basePackages = {"tw.cinema.model"})
public class SpringBootCinemaApplication {

	public static void main(String[] args) {
		SpringApplication.run(SpringBootCinemaApplication.class, args);
	}

}
