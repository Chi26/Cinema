package tw.cinema.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import org.springframework.stereotype.Component;

@Component
@Entity
@Table(name = "member")
public class Members  {
	
	@Id
	@Column(name = "account_No")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int account_No;

	@Column(name = "username")
//	@NotEmpty(message = "會員帳號不可為空")
	private String username;

	@Column(name = "name")
//	@NotEmpty(message = "會員姓名不可為空")
	private String name;

	@Column(name = "password")
//	@NotEmpty(message = "會員密碼不可為空")
	private String password;

	@Column(name = "email")
	private String email;

	@Column(name = "Id")
//	@NotEmpty(message = "身分證字號不可為空")
	private String id;

	@Column(name = "phone")
//	@NotEmpty(message = "聯絡資訊不可為空")
	private String phone;

	@Column(name = "address")
	private String address;

	@Column(name = "birthday")
	private String birthday;
	
	@Column(name = "role")
	private String role;
	

	public int getAccount_No() {
		return account_No;
	}

	public void setAccount_No(int account_No) {
		this.account_No = account_No;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	
}
