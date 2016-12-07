package com.project.controller.filter;

import java.io.IOException;
import java.util.Date;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

/**
 * Filter
 * @author VietAnh
 *
 */

public class LogFilter implements Filter {
	
	public void init(FilterConfig filterConfig) throws ServletException {
	}

	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		// Get the IP address of client machine.   
	      String ipAddress = request.getRemoteAddr();

	      // Log the IP address and current timestamp.
	      System.out.println("IP "+ ipAddress + ", Time "
	                                       + new Date().toString());

	      // Pass request back down the filter chain
	      chain.doFilter(request,response);
	}

	public void destroy() {
		// TODO Auto-generated method stub
		
	}

}
