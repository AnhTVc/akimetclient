package com.project.POJO.REST;

import java.util.ArrayList;

import com.project.POJO.Feedback;
import com.project.POJO.Rate;

public class Restaurant {
	private String id_restaurant;
	private String address;
	private String name_restaurant;
	private String avatar;
	private String phone_number;
	private String introduce;
	private String images;
	private ArrayList<Sale> sales;
	private Address poistion;
	private ArrayList<GroupMenu> groupMenus;
	private ArrayList<Collection> collections;
	private ArrayList<Feedback> feedbacks; 
	private ArrayList<Rate> rates;
	public String getId_restaurant() {
		return id_restaurant;
	}

	public void setId_restaurant(String id_restaurant) {
		this.id_restaurant = id_restaurant;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getName_restaurant() {
		return name_restaurant;
	}

	public void setName_restaurant(String name_restaurant) {
		this.name_restaurant = name_restaurant;
	}

	public String getAvatar() {
		return avatar;
	}

	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}

	public String getPhone_number() {
		return phone_number;
	}

	public void setPhone_number(String phone_number) {
		this.phone_number = phone_number;
	}

	public String getIntroduce() {
		return introduce;
	}

	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}

	public String getImages() {
		return images;
	}

	public void setImages(String images) {
		this.images = images;
	}

	public Address getPoistion() {
		return poistion;
	}

	public void setPoistion(Address poistion) {
		this.poistion = poistion;
	}

	public ArrayList<Collection> getCollections() {
		return collections;
	}

	public void setCollections(ArrayList<Collection> collections) {
		this.collections = collections;
	}

	public ArrayList<Sale> getSales() {
		return sales;
	}

	public void setSales(ArrayList<Sale> sales) {
		this.sales = sales;
	}

	public ArrayList<GroupMenu> getGroupMenus() {
		return groupMenus;
	}

	public void setGroupMenus(ArrayList<GroupMenu> groupMenus) {
		this.groupMenus = groupMenus;
	}

	public ArrayList<Feedback> getFeedbacks() {
		return feedbacks;
	}

	public void setFeedbacks(ArrayList<Feedback> feedbacks) {
		this.feedbacks = feedbacks;
	}

	public ArrayList<Rate> getRates() {
		return rates;
	}

	public void setRates(ArrayList<Rate> rates) {
		this.rates = rates;
	}
}
