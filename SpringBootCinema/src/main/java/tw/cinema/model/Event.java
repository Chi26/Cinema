package tw.cinema.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonFormat;

@Entity
@Table(name = "Events")
@Component("event")
public class Event {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "event_No")
	private int event_No;

	@Column(name = "event_Name")
	private String event_Name;

	@Column(name = "begin_Date")
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
	private Date begin_Date;

	@Column(name = "end_Date")
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
	private Date end_Date;

	@Column(name = "location")
	private String location;
	
	@Column(name = "method")
	private String method;

	@Column(name = "notice")
	private String notice;

	@Column(name = "filename")
	private String filename;

	@Column(name = "picture")
	private byte[] picture;

	public Event() {

	}

	public Event(String event_Name, Date begin_Date, Date end_Date, String location, String method, String notice,
			String filename, byte[] picture) {
		super();
		this.event_Name = event_Name;
		this.begin_Date = begin_Date;
		this.end_Date = end_Date;
		this.location = location;
		this.method = method;
		this.notice = notice;
		this.filename = filename;
		this.picture = picture;
	}
	

	public Event(int event_No, String event_Name, Date begin_Date, Date end_Date, String location, String method,
			String notice, String filename, byte[] picture) {
		super();
		this.event_No = event_No;
		this.event_Name = event_Name;
		this.begin_Date = begin_Date;
		this.end_Date = end_Date;
		this.location = location;
		this.method = method;
		this.notice = notice;
		this.filename = filename;
		this.picture = picture;
	}

	public int getEvent_No() {
		return event_No;
	}

	public void setEvent_No(int event_No) {
		this.event_No = event_No;
	}

	public String getEvent_Name() {
		return event_Name;
	}

	public void setEvent_Name(String event_Name) {
		this.event_Name = event_Name;
	}

	public Date getBegin_Date() {
		return begin_Date;
	}

	public void setBegin_Date(Date begin_Date) {
		this.begin_Date = begin_Date;
	}

	public Date getEnd_Date() {
		return end_Date;
	}

	public void setEnd_Date(Date end_Date) {
		this.end_Date = end_Date;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getMethod() {
		return method;
	}

	public void setMethod(String method) {
		this.method = method;
	}

	public String getNotice() {
		return notice;
	}

	public void setNotice(String notice) {
		this.notice = notice;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public byte[] getPicture() {
		return picture;
	}

	public void setPicture(byte[] picture) {
		this.picture = picture;
	}

	

}
