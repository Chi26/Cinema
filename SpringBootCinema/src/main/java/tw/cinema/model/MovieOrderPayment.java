package tw.cinema.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Entity
@Table(name = "payment")
@Component
public class MovieOrderPayment implements Serializable {

	@Id
	@Column(name = "payment_No")
	private String merchantTrade_No;
	@Column(name = "account")
	private String account;
	@Column(name = "phone")
	private String phone;
	@Column(name = "paid")
	private String paid;
	@Column(name = "payment")
	private int payment;
	@Column(name = "movie")
	private String movie;
	@Column(name = "date")
	private String date;
	@Column(name = "showing")
	private String showing;
	@Column(name = "seat")
	private String seat;
	
	
	public MovieOrderPayment() {
		
	}
	
	public MovieOrderPayment(String merchantTrade_No, String account, String phone, String paid, int payment,
			String movie, String date, String showing, String seat) {
		super();
		this.merchantTrade_No = merchantTrade_No;
		this.account = account;
		this.phone = phone;
		this.paid = paid;
		this.payment = payment;
		this.movie = movie;
		this.date = date;
		this.showing = showing;
		this.seat = seat;
	}
	public String getMerchantTrade_No() {
		return merchantTrade_No;
	}
	public void setMerchantTrade_No(String merchantTrade_No) {
		this.merchantTrade_No = merchantTrade_No;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getPaid() {
		return paid;
	}
	public void setPaid(String paid) {
		this.paid = paid;
	}
	public int getPayment() {
		return payment;
	}
	public void setPayment(int payment) {
		this.payment = payment;
	}
	public String getMovie() {
		return movie;
	}
	public void setMovie(String movie) {
		this.movie = movie;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getShowing() {
		return showing;
	}
	public void setShowing(String showing) {
		this.showing = showing;
	}
	public String getSeat() {
		return seat;
	}
	public void setSeat(String seat) {
		this.seat = seat;
	}

	
}
