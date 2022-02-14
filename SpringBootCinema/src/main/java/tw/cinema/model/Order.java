package tw.cinema.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Entity
@Table(name = "orderlist")
@Component
public class Order implements Serializable {

	private static final long serialVersionUID = 1L;
	@Id
	@Column(name = "order_No")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int order_No;
	@Column(name = "account")
	private String account;
	@Column(name = "movie")
	private String movie;
	@Column(name = "seat")
	private int seat;
	@Column(name = "date")
	private String date;
	@Column(name = "showing")
	private String showing;
	@Column(name = "unit_price")
	private int unit_Price;
	@Column(name = "number")
	private int number;
//	private String payment;
	@Column(name = "phone")
	private String phone;
	@Column(name = "movie_price")
	private int movie_Price;
	@Column(name = "paid")
	private String paid;

	
	public Order() {

	}

	
	public Order(int order_NO, String account, String movie, int seat, String date, String showing, int unit_price,
			int number, String phone, int movie_Price) {
		this.order_No = order_NO;
		this.account = account;
		this.movie = movie;
		this.seat = seat;
		this.date = date;
		this.showing = showing;
		this.unit_Price = unit_price;
		this.number = number;
//		this.payment = payment;
		this.phone = phone;
		this.movie_Price = movie_Price;
//		this.order_id = order_id;
	}

	
	public Order(String account, String movie, int seat, String date, String showing, int unit_price, int number,
			String phone, int movie_Price) {

		this.account = account;
		this.movie = movie;
		this.seat = seat;
		this.date = date;
		this.showing = showing;
		this.unit_Price = unit_price;
		this.number = number;
//		this.payment = payment;
		this.phone = phone;
		this.movie_Price = movie_Price;

	}
	
	

	public Order(String account, String movie, int seat, String date, String showing, int unit_Price,
			int number, String phone, int movie_Price, String paid) {
		super();
		this.account = account;
		this.movie = movie;
		this.seat = seat;
		this.date = date;
		this.showing = showing;
		this.unit_Price = unit_Price;
		this.number = number;
		this.phone = phone;
		this.movie_Price = movie_Price;
		this.paid = paid;
	}


	public int getOrder_No() {
		return order_No;
	}

	public void setOrder_No(int order_No) {
		this.order_No = order_No;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getMovie() {
		return movie;
	}

	public void setMovie(String movie) {
		this.movie = movie;
	}

	public int getSeat() {
		return seat;
	}

	public void setSeat(int seat) {
		this.seat = seat;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public int getUnit_Price() {
		return unit_Price;
	}

	public void setUnit_Price(int unit_Price) {
		this.unit_Price = unit_Price;
	}

	public int getNumber() {
		return number;
	}

	public void setNumber(int number) {
		this.number = number;
	}
//	public String getPayment() {
//		return payment;
//	}
//	public void setPayment(String payment) {
//		this.payment = payment;
//	}

	public String getShowing() {
		return showing;
	}

	public void setShowing(String showing) {
		this.showing = showing;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public int getMovie_Price() {
		return movie_Price;
	}

	public void setMovie_Price(int movie_Price) {
		this.movie_Price = movie_Price;
	}


	public String getPaid() {
		return paid;
	}


	public void setPaid(String paid) {
		this.paid = paid;
	}
	
	
}
