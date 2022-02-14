package tw.cinema.controller;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.supercsv.io.CsvBeanWriter;
import org.supercsv.prefs.CsvPreference;

import tw.cinema.model.Movie;

public class UserCSVExporter {

	public void export(List<Movie> allMovies, HttpServletResponse response) throws IOException {
		DateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd_HH-mm-ss");
		String timeStamp = simpleDateFormat.format(new Date());
		String fileName = "Movies_" + timeStamp + ".csv";
		response.setContentType("text/csv");
		String headerKey = "Content-Disposition";
		String headerValue = "attchment; filename=" + fileName;
		response.setHeader(headerKey, headerValue);
		response.setCharacterEncoding("UTF-8");
		CsvBeanWriter csvBeanWriter = new CsvBeanWriter(response.getWriter(), CsvPreference.STANDARD_PREFERENCE);
		String[] csvHeader = { "Movie No.", "Name", "Release Date", "Length", "Type", "Grading" ,"Release","Director","Actor","Intro"};
		String[] csvContents = { "movie_No", "movie_Name", "movie_Date", "movie_Length", "grading", "releases","director","actor","intro"};
		csvBeanWriter.writeHeader(csvHeader);
	
		for (Movie movie : allMovies) {
			csvBeanWriter.write(movie, csvContents);
		}
		
		csvBeanWriter.close();
	}
}
