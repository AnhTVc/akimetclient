package com.project.controller.feedback;

import java.io.IOException;
import java.util.LinkedHashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

import com.google.gson.Gson;
import com.project.DAO.FeedbackMongoDBDAO;
import com.project.POJO.Customer;
import com.project.POJO.Feedback;
import com.project.POJO.Rate;


@WebServlet("/RatingController")
public class RatingController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public static final Logger logger = Logger.getLogger(RatingController.class);
    public RatingController() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	/**
	 * Rating
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		logger.info("Client rating");
		HttpSession httpSession = request.getSession();
		String idRestaurant = request.getParameter("idRestaurant");
		String rating = request.getParameter("rating");
		
		String idCustommer = (String) httpSession.getAttribute("id_custommer");
		String nameCustomer = (String) httpSession.getAttribute("name_customer");
		logger.info("Client: " + idCustommer + " is rating: " + rating);
		if(idCustommer != null){
			logger.info("Client: " + idCustommer);
			Rate rate = new Rate();
			Customer customer = new Customer();
			customer.setIdCustomer(idCustommer);
			customer.setName(nameCustomer);
			
			rate.setCustomer(customer);
			rate.setIdRestaurant(idRestaurant);
			rate.setRating(rating);
			Map<String, String> options = new LinkedHashMap<>();
			if(FeedbackMongoDBDAO.insertRatingByIdRestaurant(rate)){
				options.put("result", "success");
			}else{
				options.put("result", "error");
			}
		    
		    String json = new Gson().toJson(options);
			response.setContentType("application/json");
		    response.setCharacterEncoding("UTF-8");
		    response.getWriter().write(json);
		}else{
			response.sendRedirect("/login");
		}
		
		
	}

}
