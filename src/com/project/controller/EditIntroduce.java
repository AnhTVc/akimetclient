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

import com.project.DAO.RestaurantDAO;
import com.project.POJO.Restaurant;
import com.project.util.AnalyticsUtil;


/**
 * Servlet implementation class EditIntroduce
 */

@WebServlet("/EditIntroduce")
public class EditIntroduce extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public static final Logger logger = Logger.getLogger(EditIntroduce.class);
    public EditIntroduce() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	/**
	 * Cập nhật thông tin giơi thiệu cho nhà hàng
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession ses = request.getSession(true);
		AnalyticsUtil.receiveResquest(request);
		String idBoss = (String) ses.getAttribute("idBoss");
		String idRestaurant = (String) ses.getAttribute("idRestaurant");

		if (idBoss != null && idRestaurant != null) {
			// Thực hiện ở đây
			logger.info("Restaurant: " + idRestaurant + " update introduction basic");
			String introduce = (String) request
					.getParameter("edit_introduce_restaurant");
			
			

			Restaurant restaurant = new Restaurant();
			restaurant.setIntroduce(introduce);
			restaurant.setIdRestaurant(idRestaurant);
			
			if(RestaurantDAO.updateInfoRestaurant(restaurant, null)){
				ses.removeAttribute("message");
				ses.setAttribute("message", "Update info restaurant success. Thank you!");
				response.sendRedirect("/AdminRestaurant");
			}else{
				ses.removeAttribute("message");
				ses.setAttribute("message", "Update info restaurant error. Sorry, please try it again!");
				response.sendRedirect("/AdminRestaurant");
			}
		}else{
			logger.error("Lost session");
			ses.removeAttribute("message");
			ses.setAttribute("message", "Lost session, please login try it again. Sorry!");
			RequestDispatcher dispatcher = getServletContext()
					.getRequestDispatcher("/business");
			dispatcher.forward(request, response);
		}
		
	}

}
