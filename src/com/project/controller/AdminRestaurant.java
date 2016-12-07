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



import com.project.DAO.RestaurantDAO;
import com.project.POJO.Boss;
import com.project.POJO.GroupMenu;
import com.project.POJO.Restaurant;
import com.project.util.AnalyticsUtil;

@WebServlet("/AdminRestaurant")
public class AdminRestaurant extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public static final Logger logger = Logger.getLogger(AdminRestaurant.class);
	public AdminRestaurant() {
		super();
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		AnalyticsUtil.receiveResquest(request);
		HttpSession ses = request.getSession(true);
		String access = (String) ses.getAttribute("access");
		logger.info("Export do get  Adminretaurant called  " + access);
		if(access != null && access.equals("true")){
			String idBoss = (String) ses.getAttribute("idBoss");
			String idRestaurant = (String) ses.getAttribute("idRestaurant");
			logger.info("Access with: Id Boss: " + idBoss + " , id restaurant: " + idRestaurant);
			if (idRestaurant != null && idBoss != null) {
				// Xử lý ở đây
				String nameBoss = (String) ses.getAttribute("nameBoss");
				Boss boss = new Boss();
				boss.setIdBoss(idBoss);
				boss.setFullName(nameBoss);

				Restaurant restaurant = RestaurantDAO
						.findRestaurantById(idRestaurant);
				boss.setRestaurant(restaurant);
				
				ses.removeAttribute("boss_current");
				ses.setAttribute("boss_current", boss);
				
				// Status = 1: thêm groups menu
				String status = request.getParameter("status");
				if (status != null) {
					if (status.equals("1")) {
						// Thêm groups menu
						String tempStr = request
								.getParameter("name_group_menu_one");

						ArrayList<GroupMenu> groupMenus = new ArrayList<GroupMenu>();
						GroupMenu groupMenu = new GroupMenu();

						if (tempStr != null) {
							groupMenu.setName(tempStr);
							groupMenus.add(groupMenu);
							tempStr = null;
						}

						tempStr = request.getParameter("name_group_menu_two");
						if (tempStr != null) {
							groupMenu.setName(tempStr);
							groupMenus.add(groupMenu);
							tempStr = null;
						}

						tempStr = request.getParameter("name_group_menu_three");
						if (tempStr != null) {
							groupMenu.setName(tempStr);
							groupMenus.add(groupMenu);
							tempStr = null;
						}

						tempStr = request.getParameter("name_group_menu_four");
						if (tempStr != null) {
							groupMenu.setName(tempStr);
							groupMenus.add(groupMenu);
							tempStr = null;
						}

						tempStr = request.getParameter("name_group_menu_five");
						if (tempStr != null) {
							groupMenu.setName(tempStr);
							groupMenus.add(groupMenu);
							tempStr = null;
						}

						tempStr = request.getParameter("name_group_menu_six");
						if (tempStr != null) {
							groupMenu.setName(tempStr);
							groupMenus.add(groupMenu);
							tempStr = null;
						}

						tempStr = request.getParameter("name_group_menu_seven");
						if (tempStr != null) {
							groupMenu.setName(tempStr);
							groupMenus.add(groupMenu);
							tempStr = null;
						}

						tempStr = request.getParameter("name_group_menu_eight");
						if (tempStr != null) {
							groupMenu.setName(tempStr);
							groupMenus.add(groupMenu);
							tempStr = null;
						}

						tempStr = request.getParameter("name_group_menu_nine");
						if (tempStr != null) {
							groupMenu.setName(tempStr);
							groupMenus.add(groupMenu);
							tempStr = null;
						}

						tempStr = request.getParameter("name_group_menu_ten");
						if (tempStr != null) {
							groupMenu.setName(tempStr);
							groupMenus.add(groupMenu);
							tempStr = null;
						}

						// Có danh sách groups menu
						restaurant.setIdRestaurant(idRestaurant);

						restaurant.setGroupMenus(groupMenus);

						if (updateRestaurant(restaurant)) {
							// Cập nhật dữ liệu lên server thành công
						} else {
							// Cập nhập dữ liệu không thành công
						}
					}
				}

				RequestDispatcher dispatcher = getServletContext()
						.getRequestDispatcher("/url/adminrestaurant.jsp");
				dispatcher.forward(request, response);
				return;
			} else {
				// Khong get dc session
				RequestDispatcher dispatcher = getServletContext()
						.getRequestDispatcher("/element/errorbussniss.jsp");
				dispatcher.forward(request, response);
				return;
			}
		}else{
			RequestDispatcher dispatcher = getServletContext()
					.getRequestDispatcher("/element/errorbussniss.jsp");
			dispatcher.forward(request, response);
			return;
		}
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("Export dopost called");
		// TODO trang chưa có dữ liệu
		RequestDispatcher dispatcher = getServletContext()
				.getRequestDispatcher("/element/errorbussniss.jsp");
		dispatcher.forward(request, response);
		return;
	}

	private boolean updateRestaurant(Restaurant restaurant) {
		return RestaurantDAO.updateInfoRestaurant(restaurant, null);
	}

}
