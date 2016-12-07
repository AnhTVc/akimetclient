package com.project.controller.guest;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.project.DAO.GuestDAO;
import com.project.POJO.Reservation;
import com.project.util.AnalyticsUtil;

/**
 * Servlet implementation class OrderHistory
 * Lịch sử đặt chỗ

 */
@WebServlet("/Credit/OrderHistory")
public class OrderHistory extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderHistory() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AnalyticsUtil.receiveResquest(request);
		HttpSession httpSession = request.getSession();
		String idCustomer = (String) httpSession.getAttribute("id_custommer");
		
		if(idCustomer != null){
			GuestDAO guestDAO = new GuestDAO();
			ArrayList<Reservation> reservations = guestDAO.listReservationByGuest(idCustomer);
			
			GuestData guestData = new GuestData();
			guestData.setReservations(reservations);
			
			request.setAttribute("reservationsList", guestData.getReservations());
			
			RequestDispatcher dispatcher = request
					.getRequestDispatcher("/guest/orderhistory.jsp");
			dispatcher.forward(request, response);
		}else{
			//Nguoi dung chua login
			response.sendRedirect("../login");
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
