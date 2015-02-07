package org.edu.uams.pojo;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.edu.uams.api.Users;

@Entity(name = "UserMaster")
@Table(name = "user_master")
public class UsersEntity implements Users {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;


	public static final  String  USER_MASTER_FIND_ALL="SELECT u FROM UserMaster u";


	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id", unique = true, nullable = false)
	private long userId;

	@Column(name = "user_name", unique = true, nullable = false, length = 200)
	private String userName;

	@Column(name = "pass_word", nullable = false, length = 10)
	private String passWord;

	@Column(name = "name", nullable = false, length = 20)
	private String name;

	@Column(name = "address", nullable = true, length = 30)
	private String address;

	@Column(name = "gender", nullable = true, length = 6)
	private String gender;

	@Column(name = "email", nullable = false, length = 30)
	private String email;


	public long getUserId() {
		return userId;
	}

	
	public void setUserId(long userId) {
		this.userId = userId;
	}

	
	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}


	public String getPassWord() {
		return passWord;
	}

	
	public void setPassWord(String passWord) {
		this.passWord = passWord;
	}

	
	public String getName() {
		return name;
	}

	
	public void setName(String name) {
		this.name = name;
	}

	
	public String getAddress() {
		return address;
	}

	
	public void setAddress(String address) {
		this.address = address;
	}


	public String getGender() {
		return gender;
	}


	public void setGender(String gender) {
		this.gender = gender;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}

}
