package com.project.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.project.util.AnalyticsUtil;

@WebServlet("/Logout")
public class Logout extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Logout() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AnalyticsUtil.receiveResquest(request);
		HttpSession httpSession = request.getSession();
		 System.out.print("Have client Logout");
		httpSession.invalidate();
		
		response.sendRedirect("/");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String status = request.getParameter("logout");
		AnalyticsUtil.receiveResquest(request);
		if(status.equals("true")){
			HttpSession httpSession = request.getSession();
			httpSession.invalidate();
			JsonObject data = new JsonObject();
		    data.addProperty("data", "true");
		    
			response.setContentType("application/json");
			request.setCharacterEncoding("utf-8");
			response.getWriter().write(new Gson().toJson(data));
			//Đăng nhập thành công
		}
	}

}
