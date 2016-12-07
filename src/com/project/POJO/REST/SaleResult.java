package com.project.POJO.REST;

import java.util.ArrayList;

public class SaleResult {

	private ArrayList<Restaurant> restaurants;
    public SaleResult(ArrayList<Restaurant> restaurants){
        this.setRestaurants(restaurants);
    }
	public ArrayList<Restaurant> getRestaurants() {
		return restaurants;
	}
	public void setRestaurants(ArrayList<Restaurant> restaurants) {
		this.restaurants = restaurants;
	}
}
