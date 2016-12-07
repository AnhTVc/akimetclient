package com.project.POJO;
/**
 * Thời gian giảm giá:
 * ví dụ: giảm giá khung giờ
 * giảm giá từng ngày. Một class sale có nhiều timesale
 * @author VietAnh
 *
 */
public class TimeSale {
	private String idTimeSale;
	private String fromTime;
	private String toTime;
	private String fromDate;
	private String toDate;
	public String getFromTime() {
		return fromTime;
	}
	public void setFromTime(String fromTime) {
		this.fromTime = fromTime;
	}
	public String getToTime() {
		return toTime;
	}
	public void setToTime(String toTime) {
		this.toTime = toTime;
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
	public String getIdTimeSale() {
		return idTimeSale;
	}
	public void setIdTimeSale(String idTimeSale) {
		this.idTimeSale = idTimeSale;
	}
}
