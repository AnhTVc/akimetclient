package com.project.controller.guest;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.project.DAO.GuestDAO;
import com.project.POJO.Customer;
import com.project.util.AnalyticsUtil;

/**
 * Servlet implementation class GeneralInfo
 */

@WebServlet("/Credit/GeneralInfo")
public class GeneralInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GeneralInfo() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AnalyticsUtil.receiveResquest(request);
		HttpSession httpSession = request.getSession();
		String idCustomer = (String) httpSession.getAttribute("id_custommer");
		
		if(idCustomer != null){
			GuestDAO guestDAO = new GuestDAO();
			Customer customer = guestDAO.findCustomer(idCustomer);
			if(customer != null){
				httpSession.setAttribute("customer", customer);
				
				//request.setAttribute("reservations", guestData.getReservations());
				RequestDispatcher dispatcher = getServletContext()
						.getRequestDispatcher("/guest/dashboard.jsp");
				dispatcher.forward(request, response);
			}
			
			
		}else{
			//Nguoi dung chua login
			response.sendRedirect("../login");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 * Cap nhat thong tin
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AnalyticsUtil.receiveResquest(request);
		HttpSession httpSession = request.getSession();
		String idCustomer = (String) httpSession.getAttribute("id_custommer");
		
		if(idCustomer != null){
			GuestDAO guestDAO = new GuestDAO();
			Customer customer = new Customer();
			
			String email = (String)request.getParameter("email");
			String name = (String)request.getParameter("name");
			String phone = (String)request.getParameter("phonenumber");
			customer.setEmail(email);
			customer.setName(name);
			customer.setPhoneNumber(phone);
			customer.setIdCustomer(idCustomer);
			JsonObject data = new JsonObject();
			
			if(guestDAO.updateInfoCustomer(customer)){
				
				data.addProperty("result", "true");
				data.addProperty("message", "Cập nhật thông tin thành công!");
			}else{
				data.addProperty("result", "false");
				data.addProperty("message", "Cập nhật thông tin không thành công!");
			}
			
			response.setContentType("application/json");
			request.setCharacterEncoding("utf-8");
			response.getWriter().write(new Gson().toJson(data));
		}else{
			//Nguoi dung chua login
			response.sendRedirect("../login");
		}
		
		
	}

}
