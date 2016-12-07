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
import com.project.POJO.Restaurant;
import com.project.POJO.Sale;
import com.project.util.ProcessUtil;

@WebServlet("/UpdateSale")
public class UpdateSale extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public static final Logger logger = Logger.getLogger(UpdateSale.class);
	public UpdateSale() {
		super();
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession ses = request.getSession(true);

		String idBoss = (String) ses.getAttribute("idBoss");
		String idRestaurant = (String) ses.getAttribute("idRestaurant");

		if (idBoss != null && idRestaurant != null) {
			// Xử lý ở đây
			logger.info("Restaurant: " + idRestaurant + " update sale!");
			Restaurant restaurant = new Restaurant();
			restaurant.setIdRestaurant(idRestaurant);
			Sale sale = new Sale();
			
			String timefromfirst = request.getParameter("timefromfirst");
			String timetofirst = request.getParameter("timetofirst");

			String timefromtwo = request.getParameter("timefromtwo");
			String timetotwo = request.getParameter("timetotwo");
			String timefromthree = request.getParameter("timefromthree");
			String timetothree = request.getParameter("timetothree");
			String timefromfour = request.getParameter("timefromfour");
			String timetofour = request.getParameter("timetofour");
			/**
			 * Một nhà hàng chỉ có 1 sale
			 */
			String time = "";
			// Lấy dữ liệu sale
			if (timefromfirst != null) {
				time = time
						+ ProcessUtil.convertToTime(timefromfirst, timetofirst);
			}

			if (timefromtwo != null) {
				time = time + ProcessUtil.convertToTime(timefromtwo, timetotwo);
			}

			if (timefromthree != null) {
				time = time
						+ ProcessUtil.convertToTime(timefromthree, timetothree);
			}

			if (timefromfour != null) {
				time = time
						+ ProcessUtil.convertToTime(timefromfour, timetofour);
			}
			
			// Lấy thông tin ngày giảm giá , detaile giảm giá
			String fromdate = request.getParameter("fromdate");
			String todate = request.getParameter("todate");
			String detailsale = request.getParameter("detailsale");

			logger.info("Time sale: " + time);
			logger.info("Fromdate: " + fromdate);
			logger.info("To date: " + todate);
			logger.info("Detail: " + detailsale);
			if (fromdate != null && todate != null & detailsale != null) {
				sale.setTime(time);
				sale.setFromDate(fromdate);
				sale.setToDate(todate);
				sale.setSaleOff(detailsale);
			}
			
			restaurant.setSale(sale);
			//Excute return data
			JsonObject data = new JsonObject();
			if(RestaurantDAO.updateInfoRestaurant(restaurant, null)){
				//Update thành công
				data.addProperty("result", "true");
				ses.removeAttribute("message");
				ses.setAttribute("message", "Update sale restaurant success. Thank you!");
				//response.sendRedirect("/AdminRestaurant");
			}else{
				//Không thành công
				data.addProperty("result", "false");
				ses.removeAttribute("message");
				ses.setAttribute("message", "Update sale restaurant error. Sorry, please try it again!");
				//response.sendRedirect("/AdminRestaurant");
			}
			
			response.setContentType("application/json");
			request.setCharacterEncoding("utf-8");
			response.getWriter().write(new Gson().toJson(data));
		} else {
			// Mất session
			logger.error("Lost session");
			ses.removeAttribute("message");
			ses.setAttribute("message", "Lost session, please login try it again. Sorry!");
			RequestDispatcher dispatcher = getServletContext()
					.getRequestDispatcher("/business");
			dispatcher.forward(request, response);
		}

	}

}
