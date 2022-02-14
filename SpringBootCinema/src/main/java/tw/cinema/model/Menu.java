package tw.cinema.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Entity
@Table(name = "Menu")
@Component
public class Menu {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int foodno;
	private int account;
	private String food;
	private int price;
	private int quantity;
	private int point;
	private int mealprice;
	private int id;
	public int getFoodno() {
		return foodno;
	}
	public void setFoodno(int foodno) {
		this.foodno = foodno;
	}
	public int getAccount() {
		return account;
	}
	public void setAccount(int account) {
		this.account = account;
	}
	public String getFood() {
		return food;
	}
	public void setFood(String food) {
		this.food = food;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public int getMealprice() {
		return mealprice;
	}
	public void setMealprice(int mealprice) {
		this.mealprice = mealprice;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Menu() {
		super();
	}
	public Menu(int foodno, int account, String food, int price, int quantity, int point, int mealprice, int id) {
		super();
		this.foodno = foodno;
		this.account = account;
		this.food = food;
		this.price = price;
		this.quantity = quantity;
		this.point = point;
		this.mealprice = mealprice;
		this.id = id;
	}
	public Menu(int account, String food, int price, int quantity, int point, int mealprice, int id) {
		super();
		this.account = account;
		this.food = food;
		this.price = price;
		this.quantity = quantity;
		this.point = point;
		this.mealprice = mealprice;
		this.id = id;
	}
	
	
	

}
