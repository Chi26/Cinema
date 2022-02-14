package tw.cinema.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Entity
@Table(name = "Menupayment")
@Component
public class MenuPayment {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int payno;
	private int account;
	private String item;
	private int totalprice;
	private String date;
	
	
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public int getPayno() {
		return payno;
	}
	public void setPayno(int payno) {
		this.payno = payno;
	}
	public int getAccount() {
		return account;
	}
	public void setAccount(int account) {
		this.account = account;
	}
	public String getItem() {
		return item;
	}
	public void setItem(String item) {
		this.item = item;
	}
	public int getTotalprice() {
		return totalprice;
	}
	public void setTotalprice(int totalprice) {
		this.totalprice = totalprice;
	}
	public MenuPayment() {
		super();
	}
	public MenuPayment(int payno, int account, String item, int totalprice, String date) {
		super();
		this.payno = payno;
		this.account = account;
		this.item = item;
		this.totalprice = totalprice;
		this.date = date;
	}
	public MenuPayment(int account, String item, int totalprice, String date) {
		super();
		this.account = account;
		this.item = item;
		this.totalprice = totalprice;
		this.date = date;
	}

	
	
	

}
