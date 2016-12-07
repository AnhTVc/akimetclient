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

import com.project.DAO.PeopleDAO;
import com.project.DAO.RestaurantDAO;
import com.project.POJO.Boss;
import com.project.POJO.People;
import com.project.util.AnalyticsUtil;
import com.project.util.SecurityUtil;

/**
 * Servlet implementation class Business
 */

@WebServlet("/business")
public class Business extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public static final Logger logger = Logger.getLogger(Business.class);
	
	PeopleDAO peopleDAO = null;
	Boss boss = null;

	public Business() {
		super();
		peopleDAO = new PeopleDAO();
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		AnalyticsUtil.receiveResquest(request);
		RequestDispatcher dispatcher = getServletContext()
				.getRequestDispatcher("/url/business.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * Quy trinh
	 * 1. Nhà hàng đăng ký. Sử lý yêu cầu gửi đến trang Update info
	 * 2. Nhà hàng đăng nhập. Kiểm tra trạng thái active. Nếu active = 1 ==> cho phép nhà hàng vào trang quản trị
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession httpSession = request.getSession(true);
		logger.info("Action retaurant");
		String nameBoss = request.getParameter("name_boss");
		boss = new Boss();
		
		if (nameBoss == null) {
			//Nhà hàng đăng nhập
			String email = request.getParameter("email_login");
			String password = request.getParameter("password_login");
			
			boss = (Boss) loginBoss(email, SecurityUtil.getMD5(SecurityUtil.getMD5(password)), true);
			if (boss != null) {
				if (boss.getIdBoss() != null) {
					
					logger.info("Restaurant login with id restaurant: " + boss.getRestaurant().getIdRestaurant());

					// Kiểm tra xem đang ở trạng thái thứ mấy?. Nếu là 0
					// thì
					// load đến UpdateInfoRestaurant
					com.project.POJO.Restaurant restaurant = RestaurantDAO
							.findRestaurantById(boss.getRestaurant()
									.getIdRestaurant());

					httpSession.setAttribute("idBoss", boss.getIdBoss());
					httpSession.setAttribute("nameBoss", boss.getFullName());
					httpSession.setAttribute("idRestaurant", boss.getRestaurant()
							.getIdRestaurant());
					// Sẽ ko có TH null vì khi tạo nhà hàng mặc định sẽ
					// phải
					
					if(restaurant.getActive() == 0){
						//Nhà hàng chưa được duyệt yêu cầu
						httpSession.removeAttribute("message");
						httpSession.setAttribute("message", "Hệ thống đang kiểm tra nhà hàng của bạn! AkiMeet sẽ liên hệ với bạn ngay khi hoàn thành!");
						response.sendRedirect("/business");
					}else{
						//Nhà hàng đã được duyệt yêu cầu
						if (restaurant.getStatusUpdate().equals("0")) {
							logger.info("Info restaurant have null: update info");
							// Nhà hàng mới chưa có thông tin
							RequestDispatcher dispatcher = getServletContext()
									.getRequestDispatcher("/UpdateInfoRestaurant");
							dispatcher.forward(request, response);
							return;
						} else {
							//Nhà hàng đã có thông tin. Kiểm tra xem nhà hàng đã được cập nhập dữ liệu ko
							httpSession.setAttribute("access", "true");
							response.sendRedirect("/AdminRestaurant");
						}
					}
					
					
				}
			} else {
				// Login không thành công
				httpSession.removeAttribute("message");
				httpSession.setAttribute("message", "Đăng nhập không thành công, vui lòng đăng nhập lại");
				response.sendRedirect("/business");
			}

		} else {
			// Nhà hàng đăng ký
			String email_register = request.getParameter("email_register");
			String password_register = request
					.getParameter("password_register");
			String phonenumber = request.getParameter("phonenumber");

			logger.info("Restaunrant register: " + nameBoss + email_register + phonenumber);
			if (email_register != null && password_register != null
					&& phonenumber != null && nameBoss != null) {
				// Nhà hàng đăng ký
				boss.setEmail(email_register);
				boss.setPassword(SecurityUtil.getMD5(SecurityUtil.getMD5(password_register)));
				boss.setPhoneNumber(phonenumber);
				boss.setFullName(nameBoss);

				// Thực hiện
				Boss temp = registerBoss(boss);
				if (temp != null) {
			
					// Put session
					httpSession.setAttribute("idBoss", temp.getIdBoss());
					httpSession.setAttribute("nameBoss", temp.getFullName());
					httpSession.setAttribute("idRestaurant", temp.getRestaurant()
							.getIdRestaurant());

					// forward to url update
					/*RequestDispatcher dispatcher = getServletContext()
							.getRequestDispatcher("/UpdateInfoRestaurant");
					dispatcher.forward(request, response);*/
					
					httpSession.removeAttribute("message");
					httpSession.setAttribute("message", "Cảm ơn bạn đã sử dụng dịch vụ của AkiMeet, AkiMeet sẽ liên hệ với bạn ngay khi hoàn thành!");
					response.sendRedirect("/business");
				}else{
					//Đăng ký lỗi
					httpSession.removeAttribute("message");
					httpSession.setAttribute("message", "Đăng ký không thành công, vui lòng quay lại sau 5 - 10 phút. ");
					response.sendRedirect("/business");
				}
			} else {
				// Form input bị lỗi không gửi dc lên sevlet
				httpSession.removeAttribute("message");
				httpSession.setAttribute("message", "Đăng ký không thành công, vui lòng quay lại sau 5 - 10 phút. ");
				response.sendRedirect("/business");
			}
		}

	}

	private People loginBoss(String email, String password, boolean isBoss) {

		return PeopleDAO.loginBoss(email, password, isBoss);
	}

	private Boss registerBoss(Boss boss) {
		return peopleDAO.registerBoss(boss);
	}

}
