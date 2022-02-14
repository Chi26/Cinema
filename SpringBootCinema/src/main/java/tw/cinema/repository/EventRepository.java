package tw.cinema.repository;


import org.springframework.data.jpa.repository.JpaRepository;

import tw.cinema.model.Event;

public interface EventRepository extends JpaRepository<Event, Integer> {

}
