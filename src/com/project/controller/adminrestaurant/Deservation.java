package com.project.controller.adminrestaurant;

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
import com.google.gson.JsonObject;
import com.project.DAO.RestaurantDAO;

@WebServlet("/Deservation")
public class Deservation extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public static final Logger logger = Logger.getLogger(Deservation.class);
    public Deservation() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	/**
	 * URL: thong-tin-dat-ban
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//Hiển thị thông tin đặt bàn
		HttpSession ses = request.getSession(true);
		
		String idBoss = (String) ses.getAttribute("idBoss");
		String idRestaurant = (String) ses.getAttribute("idRestaurant");
		String idReservation = (String) request.getParameter("id_deservation");
		JsonObject data = new JsonObject();
		//Xử lý ở đây
		if (idBoss != null && idRestaurant != null) {
			logger.info("Boss: " + idBoss + " find info reservation: " + idReservation + "update status");
			
			String confirm = request.getParameter("confirm");
			String cancel = request.getParameter("cancel");
			
			if(confirm == null && cancel == null){
				//tìm kiếm thông tin
				logger.info("Find info ...");
				com.project.POJO.Reservation deservation = RestaurantDAO.findReservationById(idReservation);
				
				
				if(deservation != null){
					data.addProperty("result", "true");
					//Setdata
					
					data.addProperty("idCustomer", deservation.getIdCustomer());
					data.addProperty("idDeservation", idReservation);
					data.addProperty("date", deservation.getDate());
					data.addProperty("time", deservation.getTime());
					data.addProperty("countPeople", deservation.getCountPeople());
					data.addProperty("status", deservation.getStatus());
					data.addProperty("nameCustomer", deservation.getNameCustomer());
					data.addProperty("contactCustomer", deservation.getContactCustomer());
					data.addProperty("phone", deservation.getPhoneCustomer());
				}else{
					data.addProperty("result", "false");
					ses.removeAttribute("message");
					ses.setAttribute("message", "Find info error!");
				}
				
			}else{
				//Huy đơn hoặc xác nhận đơn
				if(confirm.equals("true")){
					logger.info("Comfirm or Cancel Comfirm");
					//Xác nhận hoặc hủy xác nhận
					if(RestaurantDAO.changeConfirmDeservation(idReservation)){
						data.addProperty("result", "true");
						data.addProperty("message", "Cập nhật thông tin thành công");
					}else{
						data.addProperty("result", "false");
						ses.removeAttribute("message");
						ses.setAttribute("message", "Find info error!");
					}
				}else{
					//Hủy đơn hàng
					logger.info("Cancel!");
					if(RestaurantDAO.cancelDeservation(idReservation)){
						data.addProperty("result", "true");
						data.addProperty("message", "Cập nhật thông tin thành công");
						
					}else{
						data.addProperty("result", "false");
						ses.removeAttribute("message");
						ses.setAttribute("message", "Find info error!");
					}
				}
				
			}
			
			response.setContentType("application/json");
			request.setCharacterEncoding("utf-8");
			response.getWriter().write(new Gson().toJson(data));
			
		}else{
			//Mất session
			logger.error("Lost session");
			ses.removeAttribute("message");
			ses.setAttribute("message", "Lost session, please login try it again. Sorry!");
			RequestDispatcher dispatcher = getServletContext()
					.getRequestDispatcher("/business");
			dispatcher.forward(request, response);
		}
		
		
		
	}

}
