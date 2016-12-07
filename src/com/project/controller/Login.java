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
import com.google.gson.JsonObject;
import com.project.DAO.PeopleDAO;
import com.project.POJO.Customer;
import com.project.util.AnalyticsUtil;
import com.project.util.SecurityUtil;
import com.project.util.constant.Constant;

@WebServlet("/login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public static final Logger logger = Logger.getLogger(Login.class);
	
	PeopleDAO peopleDAO = new PeopleDAO();

	public Login() {
		super();
	
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		AnalyticsUtil.receiveResquest(request);
		
		RequestDispatcher dispatcher = getServletContext()
				.getRequestDispatcher("/url/login.jsp");
		dispatcher.forward(request, response);
	}

	@SuppressWarnings("deprecation")
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// Người dùng đăng nhập hoặc đăng ký
		AnalyticsUtil.receiveResquest(request);
		String status = request.getParameter("phonenumber");
		Customer customer = new Customer();
		Customer customResponse = null;
		if (status == null) {
			// Người dùng đăng nhập
			String statusLogin = request.getParameter("status");
			if (statusLogin == null) {
				// Người dùng đăng nhập dưới chế độ bình thường
				String email = request.getParameter("email_login");
				String password = request.getParameter("password_login");
				if (!email.equals(null) && !password.equals(null)) {
					customer.setEmail(email);
					customer.setPassword(SecurityUtil.getMD5(SecurityUtil.getMD5(password)));

					customResponse = loginCustomer(customer,
							Constant.LOGIN_NORMAL);
					HttpSession httpSession = request.getSession(true);
					if(customResponse != null){
						//TODO chua check sai username or password
						httpSession.setAttribute("name_customer",
								customResponse.getName());
						httpSession.setAttribute("id_custommer",
								customResponse.getIdCustomer());
						response.sendRedirect("/");
					}else{
						String message = "Sai username hoặc password, vui lòng thực hiện đăng nhập lại!";
						httpSession.removeAttribute("message");
						
						httpSession.setAttribute("message", message);
						response.sendRedirect("/login");
					}
					
				}
			} else if (statusLogin.equals(Constant.LOGIN_FACEBOOK)) {
				// Login với fb
				String name = request.getParameter("name");
				String userId = request.getParameter("userId");
				if (userId != null) {
					customer.setUserId(userId);
					customer.setName(name);

					customResponse = loginCustomer(customer, statusLogin);
					if (customResponse != null) {
						HttpSession httpSession = request.getSession(true);
						httpSession.putValue("name_customer",
								customer.getName());
						httpSession.putValue("id_custommer",
								customResponse.getIdCustomer());

						JsonObject data = new JsonObject();
						data.addProperty("authen", "true");

						response.setContentType("application/json");
						request.setCharacterEncoding("utf-8");
						response.getWriter().write(new Gson().toJson(data));
						// Đăng nhập thành công
					} else {
						// Đăng nhập không thành công
						JsonObject data = new JsonObject();
						data.addProperty("authen", "false");

						response.setContentType("application/json");
						request.setCharacterEncoding("utf-8");
						response.getWriter().write(new Gson().toJson(data));
					}
				} else {
					response.getWriter().write("Error");
				}
			} else if (statusLogin.equals(Constant.LOGIN_GOOGLE)) {
				// Login với g+
				String name = request.getParameter("name");
				String email = request.getParameter("email");

				if (email != null) {
					customer.setEmail(email);
					customer.setName(name);

					customResponse = loginCustomer(customer, statusLogin);
					if (customResponse != null) {
						HttpSession httpSession = request.getSession(true);
						//httpSession.setMaxInactiveInterval(20*60);
						httpSession.putValue("name_customer",
								customer.getName());
						httpSession.putValue("id_custommer",
								customResponse.getIdCustomer());

						response.sendRedirect("/");
						return;
					} else {
						// Đăng nhập không thành công
						JsonObject data = new JsonObject();
						data.addProperty("authen", "false");
						
						response.setContentType("application/json");
						request.setCharacterEncoding("utf-8");
						response.getWriter().write(new Gson().toJson(data));
					}
					
					
				} else {
					response.getWriter().write("Error");
				}
			} else {
				// Chưa xác định
			}

		} else {
			// Người dùng đăng ký
			String email = request.getParameter("email_register");
			String password = request.getParameter("password_register");
			String phonenumber = request.getParameter("phonenumber");

			peopleDAO = new PeopleDAO();
			if (request.getParameterValues("checkbox_register") == null) {
				System.out.print("Client register: " + email);
				customer.setEmail(email);
				customer.setPassword(password);
				customer.setPhoneNumber(phonenumber);

				Customer temp = registerCustomer(customer);
				if (temp != null) {
					HttpSession httpSession = request.getSession(true);
					httpSession.setMaxInactiveInterval(20*60);
					
					httpSession.putValue("name_customer", temp.getName());
					httpSession.putValue("id_custommer",
							temp.getIdCustomer());

					response.sendRedirect("/");
				}else{
					String message = "Đăng ký không thành công. Có thể hệ thống đang bảo trì, bạn hãy thử đăng nhập bằng google hoặc facebook. \n "
							+ "Akimeet xin lỗi về sự bất tiện này!";
					HttpSession httpSession = request.getSession();
					httpSession.removeAttribute("message");
					httpSession.setAttribute("message", message);
					
					response.sendRedirect("/login");
				}
			}
		}
	}



	private Customer registerCustomer(Customer customer) {
		return peopleDAO.registerCustomer(customer);
	}

	private Customer loginCustomer(Customer customer, String status) {
		return peopleDAO.loginCustomer(customer, status);
	}

}
