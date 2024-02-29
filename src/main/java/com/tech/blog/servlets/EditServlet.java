package com.tech.blog.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import com.mysql.cj.conf.ConnectionPropertiesTransform;
import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.Message;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;
import com.tech.blog.helper.Helper;

@MultipartConfig
public class EditServlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
//		fetch all data
		String userEmail = request.getParameter("user_email");
		String userName = request.getParameter("user_name");
		String userPassword = request.getParameter("user_password");
		String userAbout = request.getParameter("user_about");
		Part part = request.getPart("image");
		String imageName = part.getSubmittedFileName();
		
//		get the user from the session
		HttpSession s = request.getSession();
		User user = (User) s.getAttribute("currentUser");
		user.setEmail(userEmail);
		user.setName(userName);
		user.setPassword(userPassword);
		user.setAbout(userAbout);
		String oldFile = user.getProfile();
		user.setProfile(imageName);	
		
//		update databases.
		UserDao userDao = new UserDao(ConnectionProvider.getConnection());
		boolean ans = userDao.updateUser(user);
		if (ans) {
			String path = getServletContext().getRealPath("/") + "pics" + File.separator + user.getProfile();
			
//			delete code.
			String pathOldFile = getServletContext().getRealPath("/") + "pics" + File.separator + oldFile;
			
			if (!oldFile.equals("default.png")) {
				Helper.deleteFile(pathOldFile);
			}
						
				if(Helper.saveFile(part.getInputStream(), path)) {
					out.println("Profile Updated.");
					Message msg = new Message("Profile details Updated.", "success" , "alert-success");
					s.setAttribute("msg", msg);
				}else {
					out.println("File is not save SuccessFully");
					Message msg = new Message("Something went wrong..", "error" , "alert-danger");
					s.setAttribute("msg", msg);
				}
			
		}else {
			out.println("not updated...");
			Message msg = new Message("Something went wrong..", "error" , "alert-danger");
			s.setAttribute("msg", msg);
		}
		response.sendRedirect("profile.jsp");
		
	}	

}
