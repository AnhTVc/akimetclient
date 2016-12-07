package com.project.POJO;

/**
 * Class Analytics: Analytics data user 
 * @author VietAnh
 *
 */
public class Analytics {
	private String idAnalytics;
	private String MACAdress;
	private String ipPublic;
	private String OS;
	private String browser;
	private String timeEvent;
	private String URL; 				//	Danh sách các URL người dùng
	private String event;				//  Thao tác người dùng, scroll, click chuột 
	
	public Analytics(){
		
	}
	
	public Analytics(String MACAdress, 
			String ipPublic,
			String OS,
			String browser,
			String timeEvent,
			String URL,
			String event){
		this.MACAdress = MACAdress;
		this.ipPublic = ipPublic;
		this.OS = OS;
		this.browser = browser;
		this.timeEvent = timeEvent;
		this.URL = URL;
		this.event = event;
	}
	
	public String getIdAnalytics() {
		return idAnalytics;
	}
	public void setIdAnalytics(String idAnalytics) {
		this.idAnalytics = idAnalytics;
	}
	public String getMACAdress() {
		return MACAdress;
	}
	public void setMACAdress(String mACAdress) {
		MACAdress = mACAdress;
	}
	public String getIpPublic() {
		return ipPublic;
	}
	public void setIpPublic(String ipPublic) {
		this.ipPublic = ipPublic;
	}
	public String getOS() {
		return OS;
	}
	public void setOS(String oS) {
		OS = oS;
	}
	public String getBrowser() {
		return browser;
	}
	public void setBrowser(String browser) {
		this.browser = browser;
	}
	public String getTimeEvent() {
		return timeEvent;
	}
	public void setTimeEvent(String timeEvent) {
		this.timeEvent = timeEvent;
	}
	public String getURL() {
		return URL;
	}
	public void setURL(String uRL) {
		URL = uRL;
	}
	public String getEvent() {
		return event;
	}
	public void setEvent(String event) {
		this.event = event;
	}
	
	
}
