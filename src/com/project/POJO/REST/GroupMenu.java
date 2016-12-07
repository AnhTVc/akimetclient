package com.project.POJO.REST;

import java.util.ArrayList;

public class GroupMenu {
	private String name;
	private ArrayList<Menu> menu;

	public ArrayList<Menu> getMenu() {
		return menu;
	}

	public void setMenus(ArrayList<Menu> menu) {
		this.menu = menu;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
}
