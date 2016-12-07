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

import com.project.DAO.RestaurantDAO;
import com.project.POJO.Menu;
import com.project.POJO.Restaurant;
import com.project.POJO.GroupMenu;

/**
 * Servlet thêm món ăn
 * @author VietAnh
 *
 */
@WebServlet("/CreateMenu")
public class CreateMenu extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public static final Logger logger = Logger.getLogger(CreateMenu.class);
	
    public CreateMenu() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession ses = request.getSession(true);

		String idBoss = (String) ses.getAttribute("idBoss");
		String idRestaurant = (String) ses.getAttribute("idRestaurant");
		
		//Xử lý ở đây
		if (idBoss != null && idRestaurant != null) {
			String idGroupMenu = request.getParameter("add_menu_in_group_memu");
			logger.info("Restaurant: " + idRestaurant + " create menu!");
			
			if(idGroupMenu != null){
				//Lấy nhóm món ăn thành công
				logger.info("Id group menu: " + idGroupMenu);
				String nameMenu = request.getParameter("add_name_menu");
				String priceMenu = request.getParameter("add_price_menu");
				String describeMenu = request.getParameter("add_describe_menu");
				String image = "/images/default/no-image.png";
				String idClassify = request.getParameter("add_menu_in_classify");
				
				logger.info("Name menu: " + nameMenu);
				logger.info("Price: " + priceMenu);
				logger.info("Describe: "+ describeMenu);
				logger.info("Classify: " + idClassify);
				logger.info("URL image: " + image);
				
				if(nameMenu != null && priceMenu != null && describeMenu != null && idClassify != null){
					//Người dùng nhập đủ thông tin
					Restaurant restaurant = new Restaurant();
					restaurant.setIdRestaurant(idRestaurant);
					
					GroupMenu groupMenu = new GroupMenu();
					groupMenu.setIdGroupMenu(idGroupMenu);
					
					Menu menu = new Menu(nameMenu,priceMenu, image, describeMenu);
					
					ArrayList<Menu> menus = new ArrayList<Menu>();
					menus.add(menu);
					
					groupMenu.setMenus(menus);
					ArrayList<GroupMenu> groupMenus = new ArrayList<GroupMenu>();
					groupMenus.add(groupMenu);
					
					restaurant.setGroupMenus(groupMenus);
					
					Restaurant restaurantResult = RestaurantDAO.updateInfoRestaurantReturnRestaurant(restaurant, idClassify);
					if(restaurantResult != null){
						/**
						 * Truyền session idMenu;
						 */
						String idMenu = restaurantResult.getGroupMenus().get(0).getMenus().get(0).getIdMenu();
						ses.removeAttribute("id_menu_current");
						ses.setAttribute("id_menu_current", idMenu);
						System.out.print("Cập nhật món ăn thành công có id là: " + ses.getAttribute("id_menu_current"));
						
						ses.removeAttribute("message");
						ses.setAttribute("message", "Create pabulum restaurant success. Thank you!");
						response.sendRedirect("/AdminRestaurant");
					}else{
						logger.error("Create pabulum restaurant error, Client input wrong");
						ses.removeAttribute("message");
						ses.setAttribute("message", "Create pabulum restaurant error. Sorry, please try it again!");
						response.sendRedirect("/AdminRestaurant");
					}
					
					
				}else{
					//Người dùng nhập thiếu thông tin
					logger.error("Create pabulum restaurant error, Client input wrong");
					ses.removeAttribute("message");
					ses.setAttribute("message", "Create pabulum restaurant error. Please, try check data input again!");
					response.sendRedirect("/AdminRestaurant");
				}
				
			}else{
				//Không lấy được nhóm món ăn
				logger.error("Create pabulum restaurant error, Client input wrong");
				ses.removeAttribute("message");
				ses.setAttribute("message", "Create pabulum restaurant error. Please, try check data input again!");
				response.sendRedirect("/AdminRestaurant");
			}
		}else{
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
