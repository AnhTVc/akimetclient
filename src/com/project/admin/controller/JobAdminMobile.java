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

/**
 * Sử lý nghiệp vụ của quản trị nhà hàng trên mobile
 * @author VietAnh
 *
 */
@WebServlet("/jobadminmobile")
public class JobAdminMobile extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public static final Logger LOGGER = Logger.getLogger(JobAdminMobile.class);
    public JobAdminMobile() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	/**
	 * Thực hiện các chức năng của nhà hàng
	 * Hiện tại chỉ có chức năng: xác nhận <=> hủy xác nhận, hủy đơn hàng <=> không hủy đơn hàng
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String idReservation = (String) request.getParameter("idReservation");
		System.out.printf("==========>" +  request.getParameter("idReservation")+request.getAttribute("status"));
		int status = Integer.parseInt((String) request.getParameter("status"));
		
		HttpSession httpSession = request.getSession();

		String idBoss = (String) httpSession.getAttribute("idBoss");
		JsonObject data = new JsonObject();
		if(idBoss != null){
			// Session exist

			
			data.addProperty("authen", "true");
			if(RestaurantDAO.updateStatusReservation(idReservation, status)){
				data.addProperty("job", "success");
			}else{
				data.addProperty("job", "error");
			}
			
		}else{
			//Người dùng chưa login
			data.addProperty("authen", "false");
		}
		
		response.setContentType("application/json");
		request.setCharacterEncoding("utf-8");
		response.getWriter().write(new Gson().toJson(data));
	}

}
