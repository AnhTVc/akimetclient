package com.project.POJO.REST;

import java.io.Serializable;
import java.util.ArrayList;

import com.google.gson.Gson;

public class SaleAddtion implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private ArrayList<Campaign> campaigns;

	public ArrayList<Campaign> getCampaigns() {
		return campaigns;
	}

	public void setCampaigns(ArrayList<Campaign> campaigns) {
		this.campaigns = campaigns;
	}
	
	public static void main(String[] agr) {
		SaleAddtion sale_addtion = new SaleAddtion();
		ArrayList<Campaign> campaigns = new ArrayList<Campaign>();
		Campaign campaign = new Campaign();
		campaign.setRestaurant(new Restaurant());
		
		campaigns.add(campaign);
		campaigns.add(campaign);
		
		sale_addtion.setCampaigns(campaigns);
		Gson gson = new Gson();
		System.out.print(gson.toJson(sale_addtion));
		
	}
}
