package com.project.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

import com.google.gson.Gson;
import com.project.POJO.REST.SaleResult;
import com.project.REST.RestAPI;
import com.project.util.AnalyticsUtil;
import com.project.util.constant.Config;
@WebServlet("/restaurant")
public class Restaurant extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public static final Logger logger = Logger.getLogger(Restaurant.class);
	private static String URL_RESTAPI_HOME = Config.URL_SERVERAPI
			+ "/nha-hang?id_sale=";
	HttpSession httpSession;
	com.project.POJO.REST.Restaurant restDaya;
	Gson gson;

	public Restaurant() {
		super();
	}

	/**
	 * Do get data
	 */
	protected void doGet(HttpServletRequest request,
		HttpServletResponse response) throws ServletException, IOException {
		AnalyticsUtil.receiveResquest(request);
		String idSale = request.getParameter("id_sale");
		if (idSale != null) {
			logger.info("Client: " + request.getLocalAddr()+ " find sale: " + idSale);
			httpSession = request.getSession();

			String resultAPI = RestAPI.asyncResponseGET(URL_RESTAPI_HOME
					+ idSale);
			
			String resultRecommendAPI = RestAPI.asyncResponseGET(Config.URL_SERVERAPI + "/recommend");
			
			
			restDaya = new com.project.POJO.REST.Restaurant();
			gson = new Gson();

			if (resultAPI != null) {
				try {
					restDaya = gson.fromJson(resultAPI,
							com.project.POJO.REST.Restaurant.class);
					httpSession.removeAttribute("restData");
					httpSession.setAttribute("restData", restDaya);
				} catch (Exception e) {
					e.printStackTrace();
				}

			} else {
				// Không có dữ liệu ==> server lỗi
			}
			
			if(resultRecommendAPI != null){
				try {
					SaleResult saleResult = gson.fromJson(resultRecommendAPI, SaleResult.class);
					
					httpSession.removeAttribute("recommend_sale");
					httpSession.setAttribute("recommend_sale", saleResult);
				} catch (Exception e) {
					// TODO: handle exception
					logger.error(e);
				}
			}
			
			try {
				RequestDispatcher dispatcher = getServletContext()
						.getRequestDispatcher("/url/restaurant.jsp");
				dispatcher.forward(request, response);
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			
		}
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
	}

}
