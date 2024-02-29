package com.tech.blog.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

import com.tech.blog.dao.LikeDao;
import com.tech.blog.helper.ConnectionProvider;

public class LikeServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();

		String operation = request.getParameter("operation");
		int uid = Integer.parseInt(request.getParameter("uid"));
		int pid = Integer.parseInt(request.getParameter("pid"));

		/*
		 * out.println("data from server"); out.println(operation); out.println(uid);
		 * out.println(pid);
		 */
		LikeDao ldao = new LikeDao(ConnectionProvider.getConnection());
		if (operation.equals("like")) {
			Boolean f = ldao.insertLike(pid, uid);
			out.println(f);
			
		}

	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();

		String operation = request.getParameter("operation");
		int uid = Integer.parseInt(request.getParameter("uid"));
		int pid = Integer.parseInt(request.getParameter("pid"));

		LikeDao ldao = new LikeDao(ConnectionProvider.getConnection());
		if (operation.equals("like")) {
			Boolean f = ldao.insertLike(pid, uid);
			out.println(f);
			
		}

	}

}
