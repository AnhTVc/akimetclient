package com.project.POJO;

import java.util.ArrayList;

public class Customer implements People{
	private String idCustomer;
	private String username;
	private String password;
	private String name;
	private String email;
	private String phoneNumber;
	private String userId;
	private String contact;//URL
	
	public ArrayList<Reservation> getDeservations() {
		return deservations;
	}
	public void setDeservations(ArrayList<Reservation> deservations) {
		this.deservations = deservations;
	}
	private ArrayList<Reservation> deservations; //Danh sách đã đặt bàn 
	public String getIdCustomer() {
		return idCustomer;
	}
	public void setIdCustomer(String idCustomer) {
		this.idCustomer = idCustomer;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
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
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getContact() {
		return contact;
	}
	public void setContact(String contact) {
		this.contact = contact;
	}

}
