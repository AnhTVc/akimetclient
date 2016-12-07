package com.project.admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.project.DAO.RestaurantDAO;
import com.project.POJO.GSON.OverviewRestaurant;

/**
 * Hiển thị thông tin của nhà hàng
 * Đang áp dụng cho mobile
 * @author VietAnh
 *
 */
@WebServlet("/restaurant/info")
public class RestaurantInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public static final Logger LOGGER = Logger.getLogger(RestaurantInfo.class);
    public RestaurantInfo() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	/**
	 * Do post
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession httpSession = request.getSession();
		String idBoss = (String)httpSession.getAttribute("idBoss");
		
		JsonObject data = new JsonObject();
		
		if(idBoss != null){
			// Authention successfull
			data.addProperty("authen", "true");
			OverviewRestaurant overviewRestaurant = RestaurantDAO.finOverviewRestaurantByIdboss(idBoss);
			Gson gson = new Gson();
			LOGGER.info("===========>  " + gson.toJson(overviewRestaurant));
			data.addProperty("data",gson.toJson(overviewRestaurant));
			
		}else{
			//Lost Cookie
			data.addProperty("authen", "false");	
		}
		
		//Write data to response
		response.setContentType("application/json");
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.getWriter().write(new Gson().toJson(data));
	}

}
