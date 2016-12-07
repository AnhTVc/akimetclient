package com.project.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.project.POJO.REST.Drink;
import com.project.POJO.REST.Entertainment;
import com.project.REST.RestAPI;
import com.project.util.AnalyticsUtil;
import com.project.util.constant.Config;
import com.project.util.constant.Define;

@WebServlet(urlPatterns = {"/index.html"})
public class Home extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static String URL_RESTAPI_HOME = Config.URL_SERVERAPI;
	com.project.POJO.REST.Home homeData;
	
	public Home() {
		super();
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {		
	    AnalyticsUtil.receiveResquest(request);
	    // Xử lý ở đây
		HttpSession httpSession = request.getSession();

		String resultAPI = RestAPI.asyncResponseGET(URL_RESTAPI_HOME);
		homeData = new com.project.POJO.REST.Home();
		Gson gson = new Gson();

		String resultEntertainment = RestAPI.asyncResponseGET(URL_RESTAPI_HOME + Define.URL_ENTERTAIMENT);
		String resultDink = RestAPI.asyncResponseGET(URL_RESTAPI_HOME + Define.URL_DRINK);
		

		
		if (resultAPI != null) {
			// Đã lấy được dữ liệu
			try {
				// Trả lại dữ liệu
				Entertainment entertainment = gson.fromJson(resultEntertainment, Entertainment.class);
				Drink drink = gson.fromJson(resultDink, Drink.class);
				homeData = gson.fromJson(resultAPI, com.project.POJO.REST.Home.class);
				httpSession.setAttribute("home_data", homeData);
				httpSession.setAttribute("entertainment", entertainment);
				httpSession.setAttribute("drink", drink);
				
				RequestDispatcher dispatcher = getServletContext()
						.getRequestDispatcher("/index.jsp");
				dispatcher.forward(request, response);
			} catch (Exception e) {
				e.printStackTrace();
				// TODO dữ liệu đểu ==> web site đang tạm ngừng dịch vụ
			}
		} else {
			// Không có dữ liệu
		}

	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		HttpSession httpSession = request.getSession();

		String resultAPI = RestAPI.asyncResponseGET(URL_RESTAPI_HOME);
		homeData = new com.project.POJO.REST.Home();
		Gson gson = new Gson();

		if (resultAPI != null) {
			// Đã lấy được dữ liệu
			try {
				// Trả lại dữ liệu
				homeData = gson.fromJson(resultAPI, com.project.POJO.REST.Home.class);
				httpSession.setAttribute("home_data", homeData);

				RequestDispatcher dispatcher = getServletContext()
						.getRequestDispatcher("/index.jsp");
				dispatcher.forward(request, response);
			} catch (Exception e) {
				e.printStackTrace();
				// TODO dữ liệu đểu ==> web site đang tạm ngừng dịch vụ
			}

		} else {
			// Không có dữ liệu
		}
	}

}
