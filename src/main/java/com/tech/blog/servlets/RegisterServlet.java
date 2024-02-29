package com.tech.blog.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

import com.mysql.cj.conf.ConnectionPropertiesTransform;
import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;

@MultipartConfig
public class RegisterServlet extends HttpServlet {
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
//		fetch all data from form..
		String check = request.getParameter("check");
		if (check == null) {
			out.println("Box not Checked!");
		}else {
			String name = request.getParameter("user_name");
			String email = request.getParameter("user_email");
			String password = request.getParameter("user_password");
			String gender = request.getParameter("gender");
			String about = request.getParameter("about");
			
//			create User object and set all data to that Object.
			User user = new User(name,email,password,gender,about);
			
//			create UserDao Object for code reusability.
			UserDao  dao = new UserDao(ConnectionProvider.getConnection());
			if(dao.saveUser(user)) {
//				save
				out.println("done");
			}else {
				out.println("error");
			}
		}
		
		
	}

	
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
//		fetch all data from form..
		String check = request.getParameter("check");
		if (check == null) {
			out.println("Box not Checked!");
		}else {
			String name = request.getParameter("user_name");
			String email = request.getParameter("user_email");
			String password = request.getParameter("user_password");
			String gender = request.getParameter("gender");
			String about = request.getParameter("about");
			
//			create User object and set all data to that Object.
			User user = new User(name,email,password,gender,about);
			
//			create UserDao Object for code reusability.
			UserDao  dao = new UserDao(ConnectionProvider.getConnection());
			if(dao.saveUser(user)) {
//				save
				out.println("done");
			}else {
				out.println("error");
			}
		}
		
		
	}

}
