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
@Table(name = "foodorderlist")
@Component
public class FoodOrder implements Serializable {

	private static final long serialVersionUID = 1L;
	@Id
	@Column(name = "foodorder_No")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int foodorder_No;
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
	@Column(name = "food_name")
	private String food_Name;
	@Column(name = "unit_price")
	private int unit_Price;
	@Column(name = "number")
	private int number;
//	private String payment;
	@Column(name = "phone")
	private String phone;
	@Column(name = "food_price")
	private int food_Price;
	
	
	public int getFoodorder_No() {
		return foodorder_No;
	}
	public void setFoodorder_No(int foodorder_No) {
		this.foodorder_No = foodorder_No;
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
	public String getShowing() {
		return showing;
	}
	public void setShowing(String showing) {
		this.showing = showing;
	}
	public String getFood_Name() {
		return food_Name;
	}
	public void setFood_Name(String food_Name) {
		this.food_Name = food_Name;
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
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public int getFood_Price() {
		return food_Price;
	}
	public void setFood_Price(int food_Price) {
		this.food_Price = food_Price;
	}
	
	
	
}
