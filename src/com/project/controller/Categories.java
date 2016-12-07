package com.project.controller;

import java.io.IOException;
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
import com.project.POJO.REST.Campaign;
import com.project.POJO.REST.SaleResult;
import com.project.REST.RestAPI;
import com.project.util.AnalyticsUtil;
import com.project.util.constant.Config;


@WebServlet("/tim-kiem-theo-chu-de")
public class Categories extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public static final Logger logger = Logger.getLogger(Categories.class);
	ArrayList<Campaign> campaigns;
    public Categories() {
        super();
    }
    
    /**
     * Tim kiem: url server: /tim-kiem-theo-chu-de?keyword=adasd&limit=&offset=
     */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String keyword = request.getParameter("keyword");
		HttpSession session = request.getSession();
		AnalyticsUtil.receiveResquest(request);
		if(keyword != null && !keyword.isEmpty()){
			String url = Config.URL_SERVERAPI
					+ "/tim-kiem-theo-chu-de?type=" + keyword
					+"&limit=12&offset=0";
			logger.info(url);
			String resultAPI = RestAPI.asyncResponseGET(url);
			if (resultAPI != null) {
				Gson gson = new Gson();
				SaleResult saleAddtion = gson.fromJson(resultAPI,
						SaleResult.class);
				
				if (saleAddtion != null) {
					session.removeAttribute("saleAddtion");
					session.setAttribute("saleAddtion", saleAddtion);
					
					RequestDispatcher dispatcher = getServletContext()
							.getRequestDispatcher("/url/categories.jsp");
					dispatcher.forward(request, response);
				}

			}
		}
		
		
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
