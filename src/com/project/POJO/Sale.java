package com.project.POJO;

public class Sale {
	private String idSale;
	private String saleOff; //Giảm giá theo % ví dụ 10 <=> 10%
	private String timeCreate; //Ví dụ 10:30:00 08:06:2016
	private String time;// ví dụ :[{"time_start": "10:30", "time_end": "11:30"}, {"time_start": "2:30", "time_end": "22:30"}]
	private int status; //Trạng thái giảm giá; mặc định là 0; -1 sale này đã được nhà hàng update
	private String fromDate;
	private String toDate;
	
	public String getTimeCreate() {
		return timeCreate;
	}
	public void setTimeCreate(String timeCreate) {
		this.timeCreate = timeCreate;
	}
	public String getSaleOff() {
		return saleOff;
	}
	public void setSaleOff(String saleOff) {
		this.saleOff = saleOff;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getIdSale() {
		return idSale;
	}
	public void setIdSale(String idSale) {
		this.idSale = idSale;
	}

	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getFromDate() {
		return fromDate;
	}
	public void setFromDate(String fromDate) {
		this.fromDate = fromDate;
	}
	public String getToDate() {
		return toDate;
	}
	public void setToDate(String toDate) {
		this.toDate = toDate;
	}

}
