package com.project.POJO;

public class Reservation {
	private String idCustomer;
	private String idRestaurant;
	private String phoneCustomer;
	private String idDeservation;
	private String idSale;
	private String date;// Thời gian đặt bàn
	private String time;// Giờ đặt bàn
	private int countPeople; // Số người đặt bàn
	private int status; // Trạng thái
	private String timeCreate; // Thời gian khởi tạo
	private String nameCustomer;
	private String contactCustomer;
	private String saleOff;
	private String nameRestaurant;
	private String addressDetail;
	

	public Reservation() {

	}

	public Reservation(String idCustomer, String idRestaurant,
			String phoneCustomer, String date, String time, int countPeople,
			String nameCustomer, String idSale, String saleOff,String contactCustomer) {
		this.idCustomer = idCustomer;
		this.idRestaurant = idRestaurant;
		this.phoneCustomer = phoneCustomer;
		this.date = date;
		this.time = time;
		this.countPeople = countPeople;
		this.nameCustomer = nameCustomer;
		this.idSale = idSale;
		this.saleOff = saleOff;
		this.contactCustomer = contactCustomer;
	}

	public String getIdDeservation() {
		return idDeservation;
	}

	public void setIdDeservation(String idDeservation) {
		this.idDeservation = idDeservation;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public int getCountPeople() {
		return countPeople;
	}

	public void setCountPeople(int countPeople) {
		this.countPeople = countPeople;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getTimeCreate() {
		return timeCreate;
	}

	public void setTimeCreate(String timeCreate) {
		this.timeCreate = timeCreate;
	}

	public String getNameCustomer() {
		return nameCustomer;
	}

	public void setNameCustomer(String nameCustomer) {
		this.nameCustomer = nameCustomer;
	}

	public String getContactCustomer() {
		return contactCustomer;
	}

	public void setContactCustomer(String contactCustomer) {
		this.contactCustomer = contactCustomer;
	}

	public String getIdRestaurant() {
		return idRestaurant;
	}

	public void setIdRestaurant(String idRestaurant) {
		this.idRestaurant = idRestaurant;
	}

	public String getIdCustomer() {
		return idCustomer;
	}

	public void setIdCustomer(String idCustomer) {
		this.idCustomer = idCustomer;
	}

	public String getPhoneCustomer() {
		return phoneCustomer;
	}

	public void setPhoneCustomer(String phoneCustomer) {
		this.phoneCustomer = phoneCustomer;
	}

	public String getIdSale() {
		return idSale;
	}

	public void setIdSale(String idSale) {
		this.idSale = idSale;
	}

	public String getSaleOff() {
		return saleOff;
	}

	public void setSaleOff(String saleOff) {
		this.saleOff = saleOff;
	}

	public String getNameRestaurant() {
		return nameRestaurant;
	}

	public void setNameRestaurant(String nameRestaurant) {
		this.nameRestaurant = nameRestaurant;
	}

	public String getAddressDetail() {
		return addressDetail;
	}

	public void setAddressDetail(String addressDetail) {
		this.addressDetail = addressDetail;
	}

}
