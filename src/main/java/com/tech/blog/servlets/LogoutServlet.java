package com.tech.blog.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;

import com.tech.blog.entities.Message;

public class LogoutServlet extends HttpServlet {
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");;
		PrintWriter out = response.getWriter();
		
		HttpSession s = request.getSession();
		s.removeAttribute("currentUser"); 
		Message m = new Message("Logout Successfully", "success", "alert-success");
		s.setAttribute("msg", m);
		response.sendRedirect("login_page.jsp");
	}
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");;
		PrintWriter out = response.getWriter();
		
		HttpSession s = request.getSession();
		s.removeAttribute("currentUser"); 
		Message m = new Message("Logout Successfully", "success", "alert-success");
		s.setAttribute("msg", m);
		response.sendRedirect("login_page.jsp");
	}
}
