package com.project.POJO;

import java.util.ArrayList;

/**
 * Đối với 1 nhà hàng thì có các nhóm các món ăn e.g: cafe việt name, cafe hàn quốc ...
 * @author VietAnh
 *
 */

public class GroupMenu {
	private String idGroupMenu;
	private String name;
	private ArrayList<Menu> menus;
	public String getIdGroupMenu() {
		return idGroupMenu;
	}
	public void setIdGroupMenu(String idGroupMenu) {
		this.idGroupMenu = idGroupMenu;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public ArrayList<Menu> getMenus() {
		return menus;
	}
	public void setMenus(ArrayList<Menu> menus) {
		this.menus = menus;
	}
}
