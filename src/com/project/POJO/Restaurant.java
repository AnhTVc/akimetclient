package com.project.POJO;

import java.io.Serializable;
import java.util.ArrayList;

public class Restaurant implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String idRestaurant;
	private Address address;
	private String name;
	private String phoneNumber;
	private ArrayList<String> images;
	private String introduce;// Mô tả nhà hàng
	private String contact;
	private String avatar; // Url ảnh đại diện
	private ArrayList<GroupMenu> groupMenus; // Danh sách các món ăn
	private Sale sale; // Một nhà hàng có nhiều chương trình giảm giá
	private String statusUpdate;
	private int active;
	private int type;// Loại hình nhà hàng: Ẩm thực hay Karaoke, làm đẹp hay du lich
	private String extend; // Tiện ích mở rộng của nhà hàng: như wifi, gửi xe miễn phí ...
	
	
	private ArrayList<Reservation> deservationsUpComing;
	private ArrayList<Reservation> deservationsDownComing;
	
	public ArrayList<Reservation> getDeservationsUpComing() {
		return deservationsUpComing;
	}

	public void setDeservationsUpComing(ArrayList<Reservation> deservations) {
		this.deservationsUpComing = deservations;
	}

	public String getIdRestaurant() {
		return idRestaurant;
	}

	public void setIdRestaurant(String idRestaurant) {
		this.idRestaurant = idRestaurant;
	}

	public Address getAddress() {
		return address;
	}

	public void setAddress(Address address) {
		this.address = address;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getIntroduce() {
		return introduce;
	}

	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}

	public String getAvatar() {
		return avatar;
	}

	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}

	public ArrayList<GroupMenu> getGroupMenus() {
		return groupMenus;
	}

	public void setGroupMenus(ArrayList<GroupMenu> groupMenus) {
		this.groupMenus = groupMenus;
	}

	public String getStatusUpdate() {
		return statusUpdate;
	}

	public void setStatusUpdate(String statusUpdate) {
		this.statusUpdate = statusUpdate;
	}

	public String getContact() {
		return contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}

	public Sale getSale() {
		return sale;
	}

	public void setSale(Sale sale) {
		this.sale = sale;
	}

	public ArrayList<String> getImages() {
		return images;
	}

	public void setImages(ArrayList<String> images) {
		this.images = images;
	}

	public ArrayList<Reservation> getDeservationsDownComing() {
		return deservationsDownComing;
	}

	public void setDeservationsDownComing(ArrayList<Reservation> deservationsDownComing) {
		this.deservationsDownComing = deservationsDownComing;
	}

	public int getActive() {
		return active;
	}

	public void setActive(int active) {
		this.active = active;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public String getExtend() {
		return extend;
	}

	public void setExtend(String extend) {
		this.extend = extend;
	}

}
