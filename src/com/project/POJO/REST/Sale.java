package com.project.POJO.REST;

public class Sale {
	private String id_sale;
	private String sale_off;
	private String time;
	private String from_date;
	private String to_date;
	private String image;

	public String getId_sale() {
		return id_sale;
	}

	public void setId_sale(String id_sale) {
		this.id_sale = id_sale;
	}

	public String getSale_off() {
		return sale_off;
	}

	public void setSale_off(String sale_off) {
		this.sale_off = sale_off;
	}

	public String getTime() {
		return time;
	}

	public void setTime_sale(String time) {
		this.time = time;
	}

	public String getFrom_date() {
		return from_date;
	}

	public void setFrom_date(String from_date) {
		this.from_date = from_date;
	}

	public String getTo_date() {
		return to_date;
	}

	public void setTo_date(String to_date) {
		this.to_date = to_date;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}
}
