package tw.cinema.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;



import tw.cinema.model.Event;
import tw.cinema.service.EventService;


@Controller
@RequestMapping(path = "/event")
@SessionAttributes(names = { "totalPages", "totalElements" })
public class EventController {

	@Autowired
	private EventService eventService;

	@RequestMapping(path = "/EventQueryAll.controller", method = RequestMethod.GET)
	public String processQueryAll(HttpServletRequest request,Model m) throws IOException {
		List<Event> allEvents = eventService.findAll();
		m.addAttribute("allEvents", allEvents);

		
		return "event/eventhome";
	}

	@GetMapping("/insertevent.controller")
	public String insertMainAction() {
		return "event/CreateEvent";
	}

	@RequestMapping(path = "/EventCreate.controller", method = RequestMethod.POST)
	
	public String processInsert(@RequestParam("eventname") String eventname,
			@RequestParam("begindate") @DateTimeFormat(pattern = "yyyy-MM-dd") Date begindate,
			@RequestParam("enddate") @DateTimeFormat(pattern = "yyyy-MM-dd") Date enddate,
			@RequestParam("method") String method,@RequestParam("location") String location,
			@RequestParam("notice") String notice,@RequestParam("files") MultipartFile multipartFile,
			HttpServletRequest request, Model m) throws IllegalStateException, IOException {
		
		String fileName = multipartFile.getOriginalFilename();

		String saveFileDir = request.getSession().getServletContext().getRealPath("/")+"upload/";
		
		File savedir = new File(saveFileDir);
		savedir.mkdirs();

		String saveFilePath = saveFileDir + fileName;
		
		System.out.println(saveFilePath);
		
		File saveFile = new File(saveFilePath);

		multipartFile.transferTo(saveFile);

		FileInputStream is1 = new FileInputStream(saveFilePath);
		byte[] b = new byte[is1.available()];
		is1.read(b);
		is1.close();

		Event theevent = new Event(eventname, begindate, enddate,location, method, notice, fileName, b);
		Event newEvent = eventService.insert(theevent);

		m.addAttribute("newEvent", newEvent);
		

			return "event/ResultEvent";
		
		
		
	}

	@RequestMapping(path = "deleteEvent/{event_No}", method = RequestMethod.GET)
	
	public String processDelete(@PathVariable("event_No") int movieno) {
		eventService.delete(movieno);
	  return "event/ResultEvent";
	}

	@GetMapping("findEventById/{event_No}")
	public String findEventById(@PathVariable("event_No") int eventno ,Model model) throws IllegalStateException, IOException {
		Event e1 = eventService.findById(eventno);

		model.addAttribute("e1", e1);

		return "event/UpdateEvent";
	}

	@PostMapping("findEventById/EventUpdate.controller")
	
	public String processUpdate(@ModelAttribute("e1") Event event,@RequestParam("files") MultipartFile multipartFile,
			HttpServletRequest request) throws IllegalStateException, IOException {
		String fileName = multipartFile.getOriginalFilename();

		String saveFileDir = request.getSession().getServletContext().getRealPath("/")+"upload/";
		
		File savedir = new File(saveFileDir);
		savedir.mkdirs();

		String saveFilePath = saveFileDir + fileName;
		
		System.out.println(saveFilePath);
		
		File saveFile = new File(saveFilePath);

		multipartFile.transferTo(saveFile);

		FileInputStream is1 = new FileInputStream(saveFilePath);
		byte[] b = new byte[is1.available()];
		is1.read(b);
		is1.close();
	    Event e2  = new Event(event.getEvent_No(),event.getEvent_Name(),event.getBegin_Date(),event.getEnd_Date(),event.getLocation(),
	    		event.getMethod(),event.getNotice(),fileName,b);
		eventService.update(e2);
		return "event/ResultEvent";

	}
	
	@GetMapping("/eventusermain.controller")
	public String processUserMainAction() {
		return "eventUser/eventUserhome";
	}


	@PostMapping("/queryallEventbypage/{pageNo}") 
	@ResponseBody
	public List<Event> processQueryAllByPageAction(@PathVariable("pageNo") int pageNo, Model m){
		int pageSize = 10;
		
		Pageable pageable = PageRequest.of(pageNo-1, pageSize);
		Page<Event> page = eventService.findByPage(pageable);
		
		m.addAttribute("totalPages", page.getTotalPages());
		m.addAttribute("totalElements", page.getTotalElements());
		
		return page.getContent();
	}
	

	@PostMapping("/oneEvent.controller")
	@ResponseBody	
	public Event processUserOneMovieAction(@RequestParam("id")int id) {
		return eventService.findById(id);
	}
	
	@GetMapping("/singleEvent.controller")
	public String processOneMovieInfo(@RequestParam("id") int id, Model model) {
		model.addAttribute("id",id);
		return "eventUser/OneEvent";
	}

}

