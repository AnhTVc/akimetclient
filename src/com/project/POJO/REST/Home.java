package com.project.POJO.REST;

/**
 * Created by knight_cs on 11/08/2016.
 */
public class Home {
    private SaleResult care_sale;
    private SaleResult last_sale;
    private SaleResult special_sale;
    private SaleResult sale_addtion;
    private SaleResult sale_business;

    public Home( SaleResult special_sale, SaleResult last_sale, SaleResult care_sale, SaleResult sale_business) {
        this.setCare_sale(care_sale);
        this.setLast_sale(last_sale);
        this.setSpecial_sale(special_sale);
        this.setSale_business(sale_business);
    }
    public Home(){
    	
    }

    public Home(SaleResult sale_addtion) {
        this.setSale_addtion(sale_addtion);
    }


	public SaleResult getCare_sale() {
		return care_sale;
	}


	public void setCare_sale(SaleResult care_sale) {
		this.care_sale = care_sale;
	}


	public SaleResult getSpecial_sale() {
		return special_sale;
	}


	public void setSpecial_sale(SaleResult special_sale) {
		this.special_sale = special_sale;
	}


	public SaleResult getLast_sale() {
		return last_sale;
	}


	public void setLast_sale(SaleResult last_sale) {
		this.last_sale = last_sale;
	}


	public SaleResult getSale_addtion() {
		return sale_addtion;
	}


	public void setSale_addtion(SaleResult sale_addtion) {
		this.sale_addtion = sale_addtion;
	}


	public SaleResult getSale_business() {
		return sale_business;
	}


	public void setSale_business(SaleResult sale_business) {
		this.sale_business = sale_business;
	}
}
