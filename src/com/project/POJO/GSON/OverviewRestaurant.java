package com.project.POJO.GSON;

import com.project.POJO.Boss;

public class OverviewRestaurant {
	private Boss boss;
	private int usageStatistics;
	private int viewStatistics;
	//TODO thông kê theo ngày, bla bla
	public Boss getBoss() {
		return boss;
	}
	public void setBoss(Boss boss) {
		this.boss = boss;
	}
	public int getUsageStatistics() {
		return usageStatistics;
	}
	public void setUsageStatistics(int usageStatistics) {
		this.usageStatistics = usageStatistics;
	}
	public int getViewStatistics() {
		return viewStatistics;
	}
	public void setViewStatistics(int viewStatistics) {
		this.viewStatistics = viewStatistics;
	}
	
}
