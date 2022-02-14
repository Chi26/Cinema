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
import org.springframework.data.repository.query.Param;
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

import tw.cinema.model.Movie;
import tw.cinema.service.MovieService;

@Controller
@RequestMapping(path = "/movie")
@SessionAttributes(names = { "totalPages", "totalElements" })
public class MovieController {

	@Autowired
	private MovieService movieService;

	@RequestMapping(path = "/MovieQueryAll.controller", method = RequestMethod.GET)
	public String processQueryAll(Model m) throws IOException {
		
	 return	QueryByPageForController(1,m);
		
	}

	@GetMapping("/MovieQueryAll.controller/insertmovie.controller")
	public String insertMainAction() {
		return "movie/Create";
	}

	@RequestMapping(path = "/MovieQueryAll.controller/MovieCreate.controller", method = RequestMethod.POST)
    public String processInsert(@RequestParam("moviename") String moviename,
			@RequestParam("rdate") @DateTimeFormat(pattern = "yyyy-MM-dd") Date rdate,
			@RequestParam("movielength") int movielength, @RequestParam("type") String type,
			@RequestParam("grading") String grading, @RequestParam("releases") String releases,
			@RequestParam("director") String director, @RequestParam("actor") String actor,
			@RequestParam("vedio_url") String vedio_url, @RequestParam("intro") String intro,
			@RequestParam("files") MultipartFile multipartFile, HttpServletRequest request, Model m)
			throws IllegalStateException, IOException {

		String fileName = multipartFile.getOriginalFilename();

		String saveFileDir = request.getSession().getServletContext().getRealPath("/") + "upload/";

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

		Movie themovie = new Movie(moviename, rdate, movielength, type, grading, releases, director, actor, intro, b,
				fileName, vedio_url);
		Movie newMovie = movieService.insert(themovie);

		m.addAttribute("newMovie", newMovie);

		return "movie/Result";

	}

	@RequestMapping(path = "/MovieQueryAll.controller/deletemovie/{movie_No}", method = RequestMethod.GET)
    public String processDelete(@PathVariable("movie_No") int movieno) {
		movieService.delete(movieno);
		return "movie/Result";
	}

	@GetMapping("/MovieQueryAll.controller/findMovieById/{movie_No}")
	public String findMovieById(@PathVariable("movie_No") int movieno, Model model)
			throws IllegalStateException, IOException {
		Movie m1 = movieService.findById(movieno);

		model.addAttribute("m1", m1);

		return "movie/Update";
	}

	@PostMapping("/MovieQueryAll.controller/findMovieById/MovieUpdate.controller")
    public String processUpdate(@ModelAttribute("m1") Movie movie, @RequestParam("files") MultipartFile multipartFile,
			HttpServletRequest request) throws IllegalStateException, IOException {
		String fileName = multipartFile.getOriginalFilename();

		String saveFileDir = request.getSession().getServletContext().getRealPath("/") + "upload/";

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
		Movie m2 = new Movie(movie.getMovie_No(), movie.getMovie_Name(), movie.getMovie_Date(), movie.getMovie_Length(),
				movie.getType(), movie.getGrading(), movie.getReleases(), movie.getDirector(), movie.getActor(),
				movie.getIntro(), b, fileName, movie.getVedio_url());
		movieService.update(m2);
		return "movie/Result";

	}

	@GetMapping("/movieusermain.controller")
	public String processUserMainAction() {
		return "movieUser/movieUserhome";
	}

	@PostMapping("/queryallbypage/{pageNo}")
	@ResponseBody
	public List<Movie> processQueryAllByPageAction(@PathVariable("pageNo") int pageNo, Model m) {
		int pageSize = 8;

		Pageable pageable = PageRequest.of(pageNo - 1, pageSize);
		Page<Movie> page = movieService.findByPage(pageable);
        
		m.addAttribute("totalPages", page.getTotalPages());
		m.addAttribute("totalElements", page.getTotalElements());

		return page.getContent();
	}
	
	@GetMapping("/MovieQueryAll.controller/{pageNo}")
	public String QueryByPageForController(@PathVariable("pageNo") int pageNo, Model m) {
		int pageSize = 4;

		Pageable pageable = PageRequest.of(pageNo - 1, pageSize);
		Page<Movie> page = movieService.findByPage(pageable);
		m.addAttribute("allMovies", page.getContent());
		m.addAttribute("totalPages", page.getTotalPages());
		m.addAttribute("totalElements", page.getTotalElements());
		m.addAttribute("currentPage", pageNo);
		return "movie/moviehome";
	}
	

	@PostMapping("/onemovie.controller")
	@ResponseBody
	public Movie processUserOneMovieAction(@RequestParam("id") int id) {
		return movieService.findById(id);
	}

	@GetMapping("/singleMovie.controller")
	public String processOneMovieInfo(@RequestParam("id") int id, Model model) {
		model.addAttribute("id", id);
		return "movieUser/OneMovie";
	}

	@GetMapping("/singleNameMovie.controller")
	public String processOneMovieNameInfo(@RequestParam("name") String name, Model model) {
		model.addAttribute("name", name);
		return "movieUser/OneMovie2";
	}

	@PostMapping("/onemoviename.controller")
	@ResponseBody
	public Movie processUserOnenameMovieAction(@RequestParam("name") String name) {
		return movieService.findByName(name);
	}

	@PostMapping("/moviesearch.controller")
	@ResponseBody
	public List<Movie> processSearch(@RequestParam("keyword") String mName) {
		return searchResult(mName);
	}

	private List<Movie> searchResult(String mName) {
		List<Movie> movie = movieService.findAll();

		List<Movie> result = new ArrayList<Movie>();
		for (Movie m : movie) {

			if (m.getMovie_Name().contains(mName) && mName.length() != 0) {
				result.add(m);
			}
		}

		return result;
	}

	@GetMapping("/getActionForChart")
	@ResponseBody
	public List<Integer> getAllForChart() {
		List<Integer> targetList = new ArrayList<Integer>();
		List<Movie> allAction = movieService.findAction("動作");
		List<Movie> allComedy= movieService.findAction("喜劇");
		List<Movie> allScary = movieService.findAction("恐怖");
		List<Movie> allScience = movieService.findAction("科幻");
		List<Movie> allSuspense = movieService.findAction("懸疑");
		List<Movie> allLove = movieService.findAction("愛情");
	 Integer m= allAction.size();
	 Integer c= allComedy.size();
	 Integer s1= allScary.size();
	 Integer s2= allScience.size();
	 Integer s3= allSuspense.size();
	 Integer l= allLove.size();
	 System.out.println(m);
	 targetList.add(m);
	 targetList.add(c);
	 targetList.add(s1);
	 targetList.add(s2);
	 targetList.add(s3);
	 targetList.add(l);
	   return targetList;
	}
	@GetMapping("MovieQueryAll.controller/export/csv")
	public void exportToCSV(HttpServletResponse response) throws IOException {
		List<Movie> allMovies = movieService.findAll();
		UserCSVExporter exporter=  new UserCSVExporter();
		exporter.export(allMovies, response);
	}
	
	@GetMapping("/insertToFavorite")
	public String insertToFavorite(@Param("name") String name,Model m) {
		Movie movie = movieService.findByName(name);
		
		m.addAttribute("name",movie.getMovie_Name());
		return "movieUser/Favorite";
	}

}
