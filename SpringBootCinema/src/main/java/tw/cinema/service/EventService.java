package tw.cinema.service;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import tw.cinema.model.Event;
import tw.cinema.repository.EventRepository;

@Service
@Transactional
public class EventService {

	@Autowired
	private EventRepository eventRepository;

	public Event insert(Event event) {
		return eventRepository.save(event);
	}

	public Event update(Event event) {
		return eventRepository.save(event);
	}

	public void delete(Integer id) {
		eventRepository.deleteById(id);
	}

	public List<Event> findAll() {
		return eventRepository.findAll();
	}

	public Event findById(Integer id) {
		Optional<Event> op1 = eventRepository.findById(id);
		if (op1.isPresent()) {
			return op1.get();
		}
		return null;
	}

	public Page<Event> findByPage(Pageable pageable) {
		return eventRepository.findAll(pageable);
	}

}
