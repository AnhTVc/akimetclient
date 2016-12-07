package com.project.POJO.REST;

import java.io.Serializable;

public class HomeRESTData implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private CareSale care_sale;
	private LastSale last_sale;
	private SpecialSale special_sale;
	private SaleResult sale_business;
	
	public CareSale getCare_sale() {
		return care_sale;
	}
	public void setCare_sale(CareSale care_sale) {
		this.care_sale = care_sale;
	}
	public LastSale getLast_sale() {
		return last_sale;
	}
	public void setLast_sale(LastSale last_sale) {
		this.last_sale = last_sale;
	}
	public SpecialSale getSpecial_sale() {
		return special_sale;
	}
	public void setSpecial_sale(SpecialSale special_sale) {
		this.special_sale = special_sale;
	}
	public SaleResult getSale_business() {
		return sale_business;
	}
	public void setSale_business(SaleResult sale_business) {
		this.sale_business = sale_business;
	}
}
