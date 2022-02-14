package tw.cinema.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Entity
@Table(name = "Stock")
@Component
public class Stock {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int stockno;
	private String food;
	private int pcs;
	private int increase;
	private int decrease;
	private String date;
	private int id;

	
	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public int getStockno() {
		return stockno;
	}

	public void setStockno(int stockno) {
		this.stockno = stockno;
	}

	public String getFood() {
		return food;
	}

	public void setFood(String food) {
		this.food = food;
	}

	public int getPcs() {
		return pcs;
	}

	public void setPcs(int pcs) {
		this.pcs = pcs;
	}

	public int getIncrease() {
		return increase;
	}

	public void setIncrease(int increase) {
		this.increase = increase;
	}

	public int getDecrease() {
		return decrease;
	}

	public void setDecrease(int decrease) {
		this.decrease = decrease;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Stock() {		
	}



	public Stock(String food, int pcs, int increase, int decrease, String date, int id) {
		super();
		this.food = food;
		this.pcs = pcs;
		this.increase = increase;
		this.decrease = decrease;
		this.date = date;
		this.id = id;
	}


	



	
	

}
