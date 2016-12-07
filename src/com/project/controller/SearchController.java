package com.project.controller;

import java.io.IOException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.ArrayList;

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
import com.project.POJO.REST.SaleResult;
import com.project.REST.RestAPI;
import com.project.util.AnalyticsUtil;
import com.project.util.constant.Config;

/**
 * /tim-kiem-uu-dai-khi-dat-ban Tìm kiếm từ keyword Tìm kiếm theo ngôn ngữ tự
 * nhiên trên Service API URL: http://54.70.59.85:8686/find?keyword=
 * 
 */

@WebServlet("/tim-kiem-uu-dai-khi-dat-ban")
public class SearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public static final Logger logger = Logger.getLogger(SearchController.class);
	public SearchController() {
		super();
	}

	@SuppressWarnings("deprecation")
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		AnalyticsUtil.receiveResquest(request);
		HttpSession httpSession = request.getSession();
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String keyword = URLDecoder.decode((String) request.getParameter("keyword"), "UTF-8");
		
		
		if (keyword != null) {
			logger.info("Từ khóa tìm kiếm là: " + keyword);
			StringBuilder stringBuilder = new StringBuilder();
			stringBuilder.append(Config.URL_SERVERAPI);
			stringBuilder.append("/find?keyword=");
			stringBuilder.append(URLEncoder.encode(keyword));
			//
			String resultAPI = RestAPI.asyncResponseGET(stringBuilder
					.toString());
			
			logger.info(stringBuilder
					.toString());
			if (resultAPI != null) {
				Gson gson = new Gson();
				SaleResult saleResult = gson.fromJson(resultAPI,
						SaleResult.class);

				if (saleResult != null) {
					httpSession.removeAttribute("sale_result_search");
					httpSession.setAttribute("sale_result_search", saleResult);
					request.setAttribute("keyword", keyword);
				}
			}
			RequestDispatcher dispatcher = getServletContext()
					.getRequestDispatcher("/url/search.jsp");
			dispatcher.forward(request, response);
		} else {
			// Không có từ khóa tìm kiếm
			String type = request.getParameter("type");
			logger.info(type);
			if (type != null && type.equals("filter")) {
				// Lọc thông tin

				// Tach thong tin
				String address = request.getParameter("A");
				String topics = request.getParameter("T");
				String C = request.getParameter("C");

				ArrayList<String> poistion = new ArrayList<String>();
				String[] temp = address.split(",");
				for (int i = 0; i < temp.length; i++) {
					if (temp[i] != null && !temp[i].isEmpty())
						poistion.add(temp[i]);
				}

				ArrayList<String> collections = new ArrayList<String>();

				temp = null;
				temp = topics.split(",");
				for (int i = 0; i < temp.length; i++) {
					if (temp[i] != null && !temp[i].isEmpty())
						collections.add(temp[i]);
				}

				temp = null;
				temp = C.split(",");
				for (int i = 0; i < temp.length; i++) {
					if (temp[i] != null && !temp[i].isEmpty())
						collections.add(temp[i]);
				}

				// Loc thong tin
				SaleResult saleResult = (SaleResult) httpSession
						.getAttribute("sale_result_search");
				httpSession.removeAttribute("sale_result_search");
				//ArrayList<Campaign> campaigns = saleResult.getCampaigns();
				
				
				//TODO đang lỗi
				/*ArrayList<Restaurant> restaurants = saleResult.getRestaurants();
				for (Restaurant restaurant : restaurants) {
					if (poistion.size() > 0) {
						// Co tim kiem theo dia chi
						for (int j = 0; j < poistion.size(); j++) {
							if (poistion.get(j).equals(restaurant.getPoistion().getDistrict())) {
								if (collections.size() > 0) {
									// Co tim kiem theo chu de or mon an
									for (int h = 0; h < collections.size(); h++) {
										ArrayList<Collection> collectionsResult = restaurant
												.getCollections();
										for (int k = 0; k < collectionsResult
												.size(); k++) {
											if(collections.get(h).equals(collectionsResult.get(k))){
												campaign.setRestaurant(restaurant);
											}
												
										}
									}
								}
							}else{
								campaign.setRestaurant(restaurant);
							}
						}
					} else {
						//Khong tim kiem theo dia chi
						if (collections.size() > 0) {
							// Co tim kiem theo chu de or mon an
							for (int h = 0; h < collections.size(); h++) {
								ArrayList<Collection> collectionsResult = restaurant
										.getCollections();

								for (int k = 0; k < collectionsResult
										.size(); k++) {
									if(collections.get(h).equals(collectionsResult.get(k))){
										campaign.setRestaurant(restaurant);
										campaignResult.add(campaign);
									}
										
								}
							}
						}else{
							//Khong co tim kiem theo chu de
							campaign.setRestaurant(restaurant);
							campaignResult.add(campaign);
						}
					}
				}
				
				ArrayList<Campaign> campaignResult = new ArrayList<Campaign>();
				restaurant = null;
				Campaign campaign;
				for (int i = 0; i < campaigns.size(); i++) {
					restaurant = campaigns.get(i).getRestaurant();
					campaign = new Campaign();
					
				}
				
				saleResult.setCampaigns(campaignResult);*/
				httpSession.removeAttribute("sale_result_search");
				httpSession.setAttribute("sale_result_search", saleResult);
				/*RequestDispatcher dispatcher = getServletContext()
						.getRequestDispatcher("/url/search.jsp");
				dispatcher.forward(request, response);*/
				
				JsonObject data = new JsonObject();
				data.addProperty("result", "true");
				
				response.setContentType("application/json");
				response.setCharacterEncoding("utf-8");
				response.getWriter().write(new Gson().toJson(data));
			}
		}

	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
	}

}
