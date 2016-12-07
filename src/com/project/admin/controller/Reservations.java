package com.project.admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.project.DAO.ReservationDAO;

/**
 * Liệt kê danh sách các đặt bàn của nhà hàng
 * Hiện đang chỉ áp dụng cho mobile
 * Trả về json rest API
 * @author VietAnh
 *
 */
@WebServlet("/listReservation")
public class Reservations extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Reservations() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession httpSession = request.getSession();
		String idBoss = (String)httpSession.getAttribute("idBoss");
		
		JsonObject data = new JsonObject();
		
		if(idBoss != null){
			//Session exist
			
			data.addProperty("authen", "true");
			
			Gson gson = new Gson();
			data.addProperty("data", gson.toJson(ReservationDAO.listReservation(idBoss)));
			
		}else{
			//Lost session
			data.addProperty("authen", "false");
		}
		
		response.setContentType("application/json");
		request.setCharacterEncoding("utf-8");
		response.getWriter().write(new Gson().toJson(data));
	}

}
