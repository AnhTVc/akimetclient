package com.project.POJO.REST;

import java.io.Serializable;
import java.util.ArrayList;

import com.google.gson.Gson;

public class RestaurantRESTData implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Restaurant restaurant;
	private Sale sale;
	private ArrayList<GroupMenu> group_menus;

	public Restaurant getRestaurant() {
		return restaurant;
	}

	public void setRestaurant(Restaurant restaurant) {
		this.restaurant = restaurant;
	}

	public Sale getSale() {
		return sale;
	}

	public void setSale(Sale sale) {
		this.sale = sale;
	}

	public ArrayList<GroupMenu> getGroup_menus() {
		return group_menus;
	}

	public void setGroup_menus(ArrayList<GroupMenu> group_menus) {
		this.group_menus = group_menus;
	}

	public static void main(String[] agm) {
		RestaurantRESTData restaurantRESTData = new RestaurantRESTData();

		Restaurant restaurant = new Restaurant();
		restaurant.setName_restaurant("name");

		restaurantRESTData.setRestaurant(restaurant);

		Sale sale = new Sale();
		sale.setId_sale("131321");

		restaurantRESTData.setSale(sale);

		GroupMenu groupMenu = new GroupMenu();
		groupMenu.setName("Cá mập");

		ArrayList<Menu> menus = new ArrayList<Menu>();
		Menu menu = new Menu();
		menu.setId_menu("123321");

		menus.add(menu);
		menus.add(menu);

		groupMenu.setMenus(menus);

		ArrayList<GroupMenu> groupMenus = new ArrayList<GroupMenu>();

		groupMenus.add(groupMenu);
		groupMenus.add(groupMenu);

		restaurantRESTData.setGroup_menus(groupMenus);
		System.out.print(new Gson().toJson(restaurantRESTData));
	}
}
