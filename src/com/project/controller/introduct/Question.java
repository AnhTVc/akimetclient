package com.project.controller.introduct;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.util.AnalyticsUtil;

@WebServlet("/introduct/question")
public class Question extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public Question() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AnalyticsUtil.receiveResquest(request);
		RequestDispatcher dispatcher = getServletContext()
				.getRequestDispatcher("/introduct/question.jsp");
		dispatcher.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
