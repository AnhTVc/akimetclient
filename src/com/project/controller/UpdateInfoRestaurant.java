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
import com.project.util.AnalyticsUtil;
import com.project.util.constant.Config;
import com.project.util.constant.Constant;

@WebServlet("/UpdateInfoRestaurant")
public class UpdateInfoRestaurant extends HttpServlet {

	private static final long serialVersionUID = 1L;
	public static final Logger logger = Logger.getLogger(UpdateInfoRestaurant.class);
	public UpdateInfoRestaurant() {
		super();
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
	}

	/**
	 * Boss update info
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		AnalyticsUtil.receiveResquest(request);
		request.setCharacterEncoding("UTF-8");
		String name = request.getParameter("name_restaurant");
		logger.info("Client update info restaurant: " + name);
		
		if (name != null) {
			// Nhà hàng cập nhập thông tin
			String city = request.getParameter("city");
			if (city.equals("Hà Nội")) {
				city = Constant.CITY_HANOI;

			} else if (city.equals("Thành Phố HCM")) {
				city = Constant.CITY_HCM;
			} else {
				// Chua xac dinh
				
			}
			String district = request.getParameter("district");
			String detail = request.getParameter("detail_address");
			String contact = request.getParameter("contact_restaurant");
			
			if (city != null && district != null && detail != null
					&& contact != null) {
				HttpSession httpSession = request.getSession(true);
				String idRestaurant = (String) httpSession
						.getAttribute("idRestaurant");
				logger.info("Update info restaurant: " + idRestaurant + " with: " + district + city + contact);
				if (idRestaurant != null) {
					// Cập nhật thông tin nhà hàng
					Address address = new Address();
					com.project.POJO.Restaurant restaurant = new com.project.POJO.Restaurant();

					address.setCity(city);
					address.setDetail(detail);
					address.setDistrict(district);

					restaurant.setAddress(address);
					restaurant.setName(name);
					restaurant.setContact(contact);
					restaurant.setIdRestaurant(idRestaurant);
					restaurant.setAvatar(Config.URL_IMAGES + "/default/image-not-found.png ");
					
					if(RestaurantDAO.updateInfoRestaurant(restaurant, null)){
						httpSession.setAttribute("access", "true");
						response.sendRedirect("/AdminRestaurant");
					}
					else{
						RequestDispatcher dispatcher = getServletContext()
								.getRequestDispatcher("/element/errorbussniss.jsp");
						dispatcher.forward(request, response);
					}
						
				} else {
					// KHông lấy được session
					RequestDispatcher dispatcher = getServletContext()
							.getRequestDispatcher("/element/error.jsp");
					dispatcher.forward(request, response);
				}

			} else {
				// Người dùng nhập chưa đầy đủ thông tin
				RequestDispatcher dispatcher = getServletContext()
						.getRequestDispatcher("/element/error.jsp");
				dispatcher.forward(request, response);
			}
		} else {
			//Redirect from register bussniss
			RequestDispatcher dispatcher = getServletContext()
					.getRequestDispatcher("/url/updateInfoRestaurant.jsp");
			dispatcher.forward(request, response);
		}
	}

}
