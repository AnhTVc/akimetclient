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
import com.project.POJO.Address;
import com.project.POJO.Restaurant;
import com.project.util.AnalyticsUtil;

@WebServlet("/UpdateBasic")
public class UpdateBasic extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public static final Logger logger = Logger.getLogger(UpdateBasic.class);
	
	public UpdateBasic() {
		super();
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		AnalyticsUtil.receiveResquest(request);
		request.setCharacterEncoding("UTF-8");
		HttpSession ses = request.getSession(true);

		String idBoss = (String) ses.getAttribute("idBoss");
		String idRestaurant = (String) ses.getAttribute("idRestaurant");

		if (idBoss != null && idRestaurant != null) {
			// Thực hiện ở đây
			logger.info("Restaurant: " + idRestaurant + " update info basic");
			String nameRestaurant = (String) request
					.getParameter("name_restaurant_update");
			
			String city = (String) request.getAttribute("city");
			String district = (String) request.getAttribute("district");
			String detailRestaurant = (String) request
					.getParameter("detail_address_update");
			String conectRestaurant = (String) request
					.getParameter("contact_restaurant_update");
			String introduce = request.getParameter("introduce_restaurant_update");
			
			Restaurant restaurant = new Restaurant();
			Address address = new Address();
			address.setCity(city);
			address.setDetail(detailRestaurant);
			address.setDistrict(district);

			restaurant.setIntroduce(introduce);
			restaurant.setAddress(address);
			restaurant.setName(nameRestaurant);
			restaurant.setContact(conectRestaurant);
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
