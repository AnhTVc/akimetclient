package com.project.util;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import com.google.gson.Gson;
import com.project.POJO.Analytics;
import com.project.util.constant.Config;

/**
 * 
 * @author VietAnh
 *
 */
public class AnalyticsUtil {

	/**
	 * Reeceive Data from Http request Save data to mongodb TODO: save to mysql,
	 * table:
	 * 
	 * @return
	 */
	public static boolean receiveResquest(HttpServletRequest request) {
		Analytics analytics = new Analytics();

		// Get Ip Public
		String ip = request.getHeader("X-Forwarded-For");
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("WL-Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("HTTP_CLIENT_IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("HTTP_X_FORWARDED_FOR");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getRemoteAddr();
		}

		analytics.setIpPublic(ip);
		analytics.setTimeEvent(new Date().toString());

		System.out.println("Client IP: " + ip + ", Time ");

		String browserDetails = request.getHeader("User-Agent");
		String userAgent = browserDetails;
		String user = userAgent.toLowerCase();

		String os = "";
		String browser = "";

		// =================OS=======================
		if (userAgent.toLowerCase().indexOf("windows") >= 0) {
			os = "Windows";
		} else if (userAgent.toLowerCase().indexOf("mac") >= 0) {
			os = "Mac";
		} else if (userAgent.toLowerCase().indexOf("x11") >= 0) {
			os = "Unix";
		} else if (userAgent.toLowerCase().indexOf("android") >= 0) {
			os = "Android";
		} else if (userAgent.toLowerCase().indexOf("iphone") >= 0) {
			os = "IPhone";
		} else {
			os = "UnKnown, More-Info: " + userAgent;
		}
		// ===============Browser===========================
		if (user.contains("msie")) {
			String substring = userAgent.substring(userAgent.indexOf("MSIE"))
					.split(";")[0];
			browser = substring.split(" ")[0].replace("MSIE", "IE") + "-"
					+ substring.split(" ")[1];
		} else if (user.contains("safari") && user.contains("version")) {
			browser = (userAgent.substring(userAgent.indexOf("Safari")).split(
					" ")[0]).split("/")[0]
					+ "-"
					+ (userAgent.substring(userAgent.indexOf("Version")).split(
							" ")[0]).split("/")[1];
		} else if (user.contains("opr") || user.contains("opera")) {
			if (user.contains("opera"))
				browser = (userAgent.substring(userAgent.indexOf("Opera"))
						.split(" ")[0]).split("/")[0]
						+ "-"
						+ (userAgent.substring(userAgent.indexOf("Version"))
								.split(" ")[0]).split("/")[1];
			else if (user.contains("opr"))
				browser = ((userAgent.substring(userAgent.indexOf("OPR"))
						.split(" ")[0]).replace("/", "-")).replace("OPR",
						"Opera");
		} else if (user.contains("chrome")) {
			browser = (userAgent.substring(userAgent.indexOf("Chrome")).split(
					" ")[0]).replace("/", "-");
		} else if ((user.indexOf("mozilla/7.0") > -1)
				|| (user.indexOf("netscape6") != -1)
				|| (user.indexOf("mozilla/4.7") != -1)
				|| (user.indexOf("mozilla/4.78") != -1)
				|| (user.indexOf("mozilla/4.08") != -1)
				|| (user.indexOf("mozilla/3") != -1)) {
			// browser=(userAgent.substring(userAgent.indexOf("MSIE")).split(" ")[0]).replace("/",
			// "-");
			browser = "Netscape-?";

		} else if (user.contains("firefox")) {
			browser = (userAgent.substring(userAgent.indexOf("Firefox")).split(
					" ")[0]).replace("/", "-");
		} else if (user.contains("rv")) {
			browser = "IE";
		} else {
			browser = "UnKnown, More-Info: " + userAgent;
		}
		
		
		analytics.setOS(os);
		analytics.setBrowser(browser);
		analytics.setURL(((HttpServletRequest)request).getRequestURL().toString());
		
		System.out.println("User Agent: " + ip + " \nOS: " + analytics.getOS() + " \nBrowser: " + analytics.getBrowser());
		System.out.println("-----------------------------------------------");
		
		Gson gson = new Gson();
		
		ProcessUtil.writeToFile(Config.URL_FILE_ANALYTICS, gson.toJson(analytics) + "\n");

		return true;
	}
}
