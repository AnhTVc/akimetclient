package com.project.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.project.DAO.PeopleDAO;
import com.project.DAO.ReservationDAO;
import com.project.POJO.Customer;
import com.project.POJO.Reservation;
import com.project.util.AnalyticsUtil;

/**
 * Thực hiện chức năng người dùng đặt chỗ
 */

@WebServlet("/ReservationsComtroller")
public class ReservationsComtroller extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ReservationsComtroller() {
		super();
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * javax.servlet.http.HttpServlet#doPost(javax.servlet.http.HttpServletRequest
	 * , javax.servlet.http.HttpServletResponse)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		AnalyticsUtil.receiveResquest(request);
		request.setCharacterEncoding("utf-8");
		HttpSession httpSession = request.getSession();
		JsonObject data = new JsonObject();
		String idCustomer = (String) httpSession.getAttribute("id_custommer");

		if (idCustomer != null) {
			//Xu ly o day
			String nameCustomer = (String) httpSession
					.getAttribute("name_customer");
			String idRestaurant = (String) request
					.getParameter("id_restaurant");
			String idSale = (String) request.getParameter("id_sale");
			String date = (String) request.getParameter("date");
			String time = (String) request.getParameter("time");
			String countPeople = (String) request.getParameter("count_people");
			
			String saleOff = (String) request.getParameter("sale_off");
			
			PeopleDAO peopleDAO = new PeopleDAO();
			
			Customer customer = peopleDAO.findCustomerById(idCustomer);

			Reservation reservation = new Reservation();
			reservation.setIdCustomer(idCustomer);
			reservation.setIdSale(idSale);
			reservation.setIdRestaurant(idRestaurant);
			reservation.setContactCustomer(customer.getContact());
			reservation.setCountPeople(Integer.parseInt(countPeople));
			reservation.setNameCustomer(nameCustomer);
			reservation.setPhoneCustomer(customer.getPhoneNumber());
			reservation.setSaleOff(saleOff);
			reservation.setTime(time);
			reservation.setDate(date);
			
			ReservationDAO reservationDAO = new ReservationDAO();
			if(reservationDAO.createReservation(reservation))
			{
				data.addProperty("result", "true");
				data.addProperty("message", "Bạn đã thực hiện đặt chỗ thành công!");
				//Update thong tin thanh cong
			}else{
				//Update thong tin khong thanh cong
				data.addProperty("result", "false");
				data.addProperty("message", "Thực hiện đặt chỗ không thành công, liên hệ akimeet để được hỗ trợ!");
			}
			
			response.setContentType("application/json");
			response.setCharacterEncoding("utf-8");
			response.getWriter().write(new Gson().toJson(data));
		} else {
			// derect to login
			response.sendRedirect("Login");

		}

	}

}
