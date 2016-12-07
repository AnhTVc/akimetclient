package com.project.POJO;

import java.io.Serializable;


/**
 * Boss lưu thông tin của chủ nhà hàng
 * 
 * @author VietAnh
 *
 */

public class Boss implements People, Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String idBoss;
	private Restaurant restaurant;// Ông chủ sở hữu nhà hàng ==> nhà hàng là
									// phần tử của ông chủ
	private String username;
	private String password;
	private String fullName;
	private String email;
	private String phoneNumber;
	private String statusUpdate;
	
	
	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getIdBoss() {
		return idBoss;
	}

	public void setIdBoss(String idBoss) {
		this.idBoss = idBoss;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public Restaurant getRestaurant() {
		return restaurant;
	}

	public void setRestaurant(Restaurant restaurant) {
		this.restaurant = restaurant;
	}

	public String getStatusUpdate() {
		return statusUpdate;
	}

	public void setStatusUpdate(String statusUpdate) {
		this.statusUpdate = statusUpdate;
	}

}
