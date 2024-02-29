package com.tech.blog.dao;

import java.sql.*;
import com.tech.blog.entities.User;

public class UserDao {
	private Connection con;

	public UserDao(Connection con) {
		this.con = con;
	}

//	method to insert user to data base:
	public boolean saveUser(User user) {
		// Make sure to call getConnection to initialize the connection
		    PreparedStatement pstmt = null;
		boolean f = false;
		try {
//			user ---> database
			String query = "insert into user(name,email,password,gender,about) values(?,?,?,?,?)";

			pstmt = this.con.prepareStatement(query);
			pstmt.setString(1, user.getName());
			pstmt.setString(2, user.getEmail());
			pstmt.setString(3, user.getPassword());
			pstmt.setString(4, user.getGender());
			pstmt.setString(5, user.getAbout());

			pstmt.executeUpdate();
			f = true;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return f;
	}

//	get User by useremail and userpassword.
	public User getUserByEmailAndPassword(String email, String password) {
		User user = null;

		try {
			String query = "select * from user where email=? and password=?";
			PreparedStatement pstmt = this.con.prepareStatement(query);
			pstmt.setString(1, email);
			pstmt.setString(2, password);

			ResultSet set = pstmt.executeQuery();

			if (set.next()) {
				user = new User();

//				data from db
				String name = set.getString("name");
//				set to user Object
				user.setName(name);
				user.setId(set.getInt("id"));
				user.setEmail(set.getString("email"));
				user.setPassword(set.getString("password"));
				user.setGender(set.getString("gender"));
				user.setAbout(set.getString("about"));
				user.setRdate(set.getTimestamp("rdate"));
				user.setProfile(set.getString("profile"));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return user;
	}

	public boolean updateUser(User user) {
		boolean f = false;
		try {
			String query = "update user set name=?, email=?, password=?, gender=?, about=?, profile=? where id=?";
			PreparedStatement pstmt = this.con.prepareStatement(query);
			pstmt.setString(1, user.getName());
			pstmt.setString(2, user.getEmail());
			pstmt.setString(3, user.getPassword());
			pstmt.setString(4, user.getGender());
			pstmt.setString(5, user.getAbout());
			pstmt.setString(6, user.getProfile());
			pstmt.setInt(7, user.getId());

			pstmt.executeUpdate();
			f = true;

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return f;
	}

	public User getUserByUserId(int userId) {
		User user = null;
		String q = "select * from user where id=?";
		try {
			PreparedStatement pstmt = this.con.prepareStatement(q);
			pstmt.setInt(1, userId);
			ResultSet set = pstmt.executeQuery();
			if (set.next()) {
				user = new User();

//				data from db
				String name = set.getString("name");
//				set to user Object
				user.setName(name);
				user.setId(set.getInt("id"));
				user.setEmail(set.getString("email"));
				user.setPassword(set.getString("password"));
				user.setGender(set.getString("gender"));
				user.setAbout(set.getString("about"));
				user.setRdate(set.getTimestamp("rdate"));
				user.setProfile(set.getString("profile"));
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return user;
	}
}
