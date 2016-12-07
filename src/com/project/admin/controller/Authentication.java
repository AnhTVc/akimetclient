package com.project.admin.controller;

import java.io.IOException;

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
import com.project.POJO.Boss;
import com.project.util.SecurityUtil;


@WebServlet("/Authentication/mobile")
public class Authentication extends HttpServlet {
	public static final Logger LOGGER = Logger.getLogger(Authentication.class);
	private static final long serialVersionUID = 1L;

	public Authentication() {
		super();
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		HttpSession httpSession = request.getSession();
		httpSession.setAttribute("sessionid", httpSession.getId());
		System.out.print("====================>"
				+ httpSession.getAttribute("abc"));
		httpSession.setAttribute("abc", "xyz");
		response.setContentType("application/json");
		request.setCharacterEncoding("utf-8");

		response.getWriter().write(new Gson().toJson(null));

	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// App nha hang dang nhap

		String username = request.getParameter("username");
		String password = request.getParameter("password");

		LOGGER.info(username + " login");

		HttpSession httpSession = request.getSession();
		System.out.print("====================>"
				+ httpSession.getAttribute("idBoss") + username);
		JsonObject data = new JsonObject();
		Boss boss = (Boss) PeopleDAO.loginBoss(username,
				SecurityUtil.getMD5(SecurityUtil.getMD5(password)), true);

		if (boss != null && boss.getIdBoss() != null) {
			// Login success full
			// Save session
			// Return idBoss
			httpSession.setAttribute("idBoss", boss.getIdBoss());

			data.addProperty("username", request.getParameter("username"));
			data.addProperty("authen", "true");

		} else {
			// Login false
			data.addProperty("authen", "false");
		}
		response.setContentType("application/json");
		request.setCharacterEncoding("utf-8");
		response.getWriter().write(new Gson().toJson(data));
	}

}
