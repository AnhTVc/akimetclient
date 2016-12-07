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
 * Servlet implementation class AccountSecurity
 * Bảo mật và mật khẩu
 */

@WebServlet("/Credit/AccountSecurity")
public class AccountSecurity extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public AccountSecurity() {
        super();
    }

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
						.getRequestDispatcher("/guest/security.jsp");
				dispatcher.forward(request, response);
			}
			
			
		}else{
			//Nguoi dung chua login
			response.sendRedirect("../login");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AnalyticsUtil.receiveResquest(request);
		HttpSession httpSession = request.getSession();
		String idCustomer = (String) httpSession.getAttribute("id_custommer");
		
		
		if(idCustomer != null){
			GuestDAO guestDAO = new GuestDAO();
			JsonObject data = new JsonObject();
			
			String passold = (String)request.getParameter("passold");
			String passnew = (String)request.getParameter("passnew");
			
			if(passold != null){
				if(guestDAO.changePWD(passold, passnew, idCustomer)){
					
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
				String email = (String)request.getParameter("email");
				if(email != null){
					//Update email
					if(guestDAO.changeEmail(idCustomer, email)){
						data.addProperty("result", "true");
						data.addProperty("message", "Cập nhật thông tin thành công!");
					}else{
						data.addProperty("result", "false");
						data.addProperty("message", "Cập nhật thông tin không thành công!");
					}
					
					
				}else{
					//Update phone
					String phone = (String)request.getParameter("phone");
					if(guestDAO.changePhone(idCustomer, phone)){
						data.addProperty("result", "true");
						data.addProperty("message", "Cập nhật thông tin thành công!");
					}else{
						data.addProperty("result", "false");
						data.addProperty("message", "Cập nhật thông tin không thành công!");
					}
				}
			}
			
		}else{
			//Nguoi dung chua login
			response.sendRedirect("../login");
		}
	}

}
