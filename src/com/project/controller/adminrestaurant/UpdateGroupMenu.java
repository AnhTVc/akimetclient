package com.project.controller.adminrestaurant;

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
import com.google.gson.JsonObject;
import com.project.DAO.RestaurantDAO;
import com.project.POJO.GroupMenu;
import com.project.POJO.Restaurant;
import com.project.POJO.GSON.GroupMenuJSON;
import com.project.POJO.GSON.GroupMenusJSON;
import com.project.POJO.GSON.GroupMenusNewJSON;

@WebServlet("/UpdateGroupMenu")
public class UpdateGroupMenu extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private GroupMenu groupMenu;
	public static final Logger logger = Logger.getLogger(UpdateGroupMenu.class);
	
	public UpdateGroupMenu() {
		super();

	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

	}

	/**
	 * Cập nhật nhóm món ăn cho nhà hàng
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession ses = request.getSession(true);
		JsonObject data = new JsonObject();
		String idBoss = (String) ses.getAttribute("idBoss");
		String idRestaurant = (String) ses.getAttribute("idRestaurant");
		
		if (idBoss != null && idRestaurant != null) {
			// Xử lý ở đây
			String groupmenuold = request.getParameter("groupmenuold");
			String groupmenunew = request.getParameter("groupmenunew");
			
			logger.info("Restaurant: " + idRestaurant + " update group menu!");
			Gson gson = new Gson();

			// Đọc dữ liệu
			// groupmenunew: dữ liệu mới <=> tạo mới nhóm món ăn
			// groupmenuold: dữ liệu cũ <=> update nhóm món ăn
			Restaurant restaurant = new Restaurant();
			ArrayList<GroupMenu> groupMenus = new ArrayList<GroupMenu>();
			groupMenu = null;
			try {
				if (groupmenuold != null && !groupmenuold.trim().isEmpty()) {
					groupmenuold = "{\"groupMenus\":["
							+ groupmenuold.substring(0,
									groupmenuold.length() - 1) + "]}";
					GroupMenusJSON groupMenusJSON = gson.fromJson(groupmenuold,
							GroupMenusJSON.class);
					GroupMenuJSON groupMenuJSON = null;
					for (int i = 0; i < groupMenusJSON.getGroupMenus().size(); i++) {
						groupMenu = new GroupMenu();
						groupMenuJSON = groupMenusJSON.getGroupMenus().get(i);
						groupMenu.setIdGroupMenu(groupMenuJSON.getId());
						groupMenu.setName(groupMenuJSON.getName());

						groupMenus.add(groupMenu);
					}
				}
				if (groupmenunew != null && !groupmenunew.isEmpty()) {
					groupmenunew = "{\"groupMenuNew\":[" + groupmenunew + "]}";
					GroupMenusNewJSON groupMenusNewJSON = gson.fromJson(
							groupmenunew, GroupMenusNewJSON.class);

					for (int i = 0; i < groupMenusNewJSON.getGroupMenuNew()
							.size(); i++) {
						groupMenu = new GroupMenu();
						groupMenu.setName(groupMenusNewJSON.getGroupMenuNew()
								.get(i));

						groupMenus.add(groupMenu);
					}

				}
			} catch (Exception e) {
				e.printStackTrace();
			}

			restaurant.setGroupMenus(groupMenus);
			restaurant.setIdRestaurant(idRestaurant);

			if (RestaurantDAO.updateInfoRestaurant(restaurant, null)) {
				// Update thành công	
			    data.addProperty("result", "true");
			    ses.removeAttribute("message");
				ses.setAttribute("message", "Update info restaurant success. Thank you!");
				//response.sendRedirect("/AdminRestaurant");
			} else {
				// Update không thành công
				data.addProperty("result", "true");
				ses.removeAttribute("message");
				ses.setAttribute("message", "Create info restaurant error. Sorry, please try it again!");
				//response.sendRedirect("/AdminRestaurant");
			}

			response.setContentType("application/json");
			request.setCharacterEncoding("utf-8");
			response.getWriter().write(new Gson().toJson(data));
		}else {
			//Mất session
			logger.error("Lost session");
			ses.removeAttribute("message");
			ses.setAttribute("message", "Lost session, please login try it again. Sorry!");
			RequestDispatcher dispatcher = getServletContext()
					.getRequestDispatcher("/business");
			dispatcher.forward(request, response);
		}
		
	}
}
