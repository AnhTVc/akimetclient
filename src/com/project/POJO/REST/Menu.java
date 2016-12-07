package com.project.POJO.REST;

public class Menu {
	private String id_menu;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	private String name;
	private String price;
	private String image;
	public String getId_menu() {
		return id_menu;
	}
	public void setId_menu(String id_menu) {
		this.id_menu = id_menu;
	}
}
