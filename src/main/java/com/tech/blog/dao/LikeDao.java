package com.tech.blog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class LikeDao {
	Connection con;

	public LikeDao(Connection con) {
		this.con = con;
	}

	public boolean insertLike(int pid, int uid) {
		boolean f = false;
		String q = "insert into liked(pid, uid) values(?,?)";
		try {
			PreparedStatement pstmt = con.prepareStatement(q);

//			values set
			pstmt.setInt(1, pid);
			pstmt.setInt(2, uid);
			pstmt.executeUpdate();
			f = true;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return f;
	}

	public int countLikeOnPost(int pid) {
		int count = 0;
		String q = "select count(*) from liked where pid=?";

		try {
			PreparedStatement pstmt = this.con.prepareStatement(q);
			pstmt.setInt(1, pid);

			ResultSet set = pstmt.executeQuery();
			if (set.next()) {
				count = set.getInt("count(*)");
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return count;
	}

	public boolean isLikedByUser(int pid, int uid) {
		boolean f = false;
			String q = "select * from liked where pid=? and uid=?";
			try {
				PreparedStatement pstmt = this.con.prepareStatement(q);
				pstmt.setInt(1, pid);
				pstmt.setInt(2, uid);
				
				ResultSet set = pstmt.executeQuery();
				if (set.next()) {
					f = true;
				}
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		
		return f;
	}

	public boolean deleteLike(int pid, int uid) {
		boolean f = false;
		
		try {
			PreparedStatement pstmt = this.con.prepareStatement("delete from liked where pid=? and uid=?");
			pstmt.setInt(1, pid );
			pstmt.setInt(2, uid);
			pstmt.executeUpdate();
			f = true; 
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return f;
	}
}
