package com.project.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.project.POJO.REST.SaleResult;
import com.project.REST.RestAPI;
import com.project.util.AnalyticsUtil;
import com.project.util.constant.Config;
import com.project.util.constant.Constant;


@WebServlet("/Collection")
public class Collection extends HttpServlet {
	private static final long serialVersionUID = 1L;
	//private static int limit = 12;
	//private static int offset = 10;// Nhảy cóc

	public Collection() {
		super();
	}

	/**
	 * Lấy thêm thông tin tim kiem uu dai
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String tag = request.getParameter("type");
		HttpSession session = request.getSession();
		AnalyticsUtil.receiveResquest(request);
		if (tag.equals(Constant.TAG_Special_Sale)) {
			//	Tìm kiếm ưu đãi đặc biệt
			String url = Config.URL_SERVERAPI + "/addtion"
					+ "/special_sale?limit=12&offset=0";
			System.out.printf(url);
			String resultAPI = RestAPI.asyncResponseGET(url);
			if (resultAPI != null) {
				Gson gson = new Gson();
				SaleResult saleResult = gson.fromJson(resultAPI,
						SaleResult.class);
				if (saleResult != null) {
					session.removeAttribute("sale_addtion");
					session.setAttribute("sale_addtion", saleResult);
					
					RequestDispatcher dispatcher = getServletContext()
							.getRequestDispatcher("/url/collection.jsp");
					dispatcher.forward(request, response);
				}

			}
		} else if (tag.equals(Constant.TAG_Last_Sale)) {
			//Tìm kiếm ưu đãi đặc biệt
			String url = Config.URL_SERVERAPI + "/addtion"
					+ "/last_sale?limit=12&offset=0";
			System.out.printf(url);
			String resultAPI = RestAPI.asyncResponseGET(url);
			if (resultAPI != null) {
				Gson gson = new Gson();
				SaleResult saleResult = gson.fromJson(resultAPI,
						SaleResult.class);
				if (saleResult != null) {
					session.removeAttribute("sale_addtion");
					session.setAttribute("sale_addtion", saleResult);
					
					RequestDispatcher dispatcher = getServletContext()
							.getRequestDispatcher("/url/collection.jsp");
					dispatcher.forward(request, response);
				}

			}
		} else if (tag.equals(Constant.TAG_Care_Sale)) {
			// Quan tâm nhất
			String url = Config.URL_SERVERAPI + "/addtion"
					+ "/care_sale?limit=12&offset=0";
			System.out.printf(url);
			String resultAPI = RestAPI.asyncResponseGET(url);
			if (resultAPI != null) {
				Gson gson = new Gson();
				SaleResult saleResult = gson.fromJson(resultAPI,
						SaleResult.class);
				if (saleResult != null) {
					session.removeAttribute("sale_addtion");
					session.setAttribute("sale_addtion", saleResult);
					
					RequestDispatcher dispatcher = getServletContext()
							.getRequestDispatcher("/url/collection.jsp");
					dispatcher.forward(request, response);
				}

			}
		} else {
			// Sai URL
		}

	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
	}

}
