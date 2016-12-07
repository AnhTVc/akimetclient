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

import com.google.gson.Gson;
import com.project.POJO.REST.SaleResult;
import com.project.REST.RestAPI;
import com.project.util.AnalyticsUtil;
import com.project.util.constant.Config;
import com.project.util.constant.Define;

/**
 * Servlet implementation class TagController
 * URL: /tim-kiem
 * parameter: type restaurant
 * 		Ẩm thực
 * 		Đồ uống
 * 		Giải trí
 * 		Sức khỏe - làm đẹp
 * 
 * Create by Anh Tran
 */
@WebServlet("/tim-kiem")
public class TagController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    HttpSession httpSession;
    public static final Logger logger = Logger.getLogger(TagController.class);
    public TagController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AnalyticsUtil.receiveResquest(request);
		httpSession = request.getSession();
		String typeRestaurant = request.getParameter("type");
		if(typeRestaurant != null){
			int typeInt = Integer.parseInt(typeRestaurant);
			String url = "";
			if(typeInt == Define.RESTAURANT_TYPE_CULINARY){
				//	Ẩm thực
				url = Config.URL_SERVERAPI  + Define.URL_CULINARY + Define.URL_ALL;
				
			}else if (typeInt == Define.RESTAURANT_TYPE_DRINK){
				//	Đồ uống
				url = Config.URL_SERVERAPI  + Define.URL_DRINK + Define.URL_ALL;
			}else if (typeInt == Define.RESTAURANT_TYPE_ENTERTAINMENT){
				//	Giải trí
				url = Config.URL_SERVERAPI  + Define.URL_ENTERTAIMENT + Define.URL_ALL;
			}else if (typeInt == Define.RESTAURANT_TYPE_HEALTH){
				//	Sức khỏe - làm đẹp
				url = Config.URL_SERVERAPI  + Define.URL_HEALTH + Define.URL_ALL;
			}else if (typeInt == Define.RESTAURANT_TYPE_TRAVEL){
				//	Du lịch
				url = Config.URL_SERVERAPI  + Define.URL_TRAVEL + Define.URL_ALL;
			}
			logger.info(url);
			String resultAPI = RestAPI.asyncResponseGET(url);
			
			if (resultAPI != null) {
				Gson gson = new Gson();
				SaleResult findresult = gson.fromJson(resultAPI,
						SaleResult.class);
				
				if (findresult != null) {
					
					httpSession.removeAttribute("findresult");
					httpSession.setAttribute("findresult", findresult);
					
					RequestDispatcher dispatcher = getServletContext()
							.getRequestDispatcher("/element/find.jsp");
					dispatcher.forward(request, response);
				}

			}
			
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
