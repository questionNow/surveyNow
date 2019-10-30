package point.model.dao;
import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import point.model.vo.Point;

public class PointDao {
	
	public int getListCount(Connection conn) {
		Statement stmt = null;
		ResultSet rs = null;
		
		int listCount = 0;
		
		String query = "SELECT COUNT(*) FROM (SELECT userid FROM point GROUP BY userid)";
		
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(query);
			
			if(rs.next()) {
				listCount=rs.getInt(1);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(stmt);
			close(rs);
		}
		return listCount;
	}

	public ArrayList<Point> selectPointList(Connection conn, int currentPage, int limit) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		ArrayList<Point>list = null;
		
		String query = "SELECT rownum, userid, point FROM user_info  WHERE rownum BETWEEN ? AND ?";
		
		int startRow = (currentPage-1)*limit +1;	
		int endRow = startRow + limit -1;
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rs=pstmt.executeQuery();
			
			list = new ArrayList<Point>();
			
			while(rs.next()) {
				Point p = new Point(rs.getString("userid"),
									rs.getInt("point"));
				list.add(p);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}

	public ArrayList<Point> selectList(Connection conn, int currentPage, int limit) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		ArrayList<Point>list = null;
		
		String query = "SELECT ROWNUM, pnum, userid, point, pdate, pcontent FROM point WHERE ROWNUM BETWEEN ? AND ? ORDER BY 1 DESC";
		
		int startRow = (currentPage-1)*limit +1;	
		int endRow = startRow + limit -1;
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rs=pstmt.executeQuery();
			
			list = new ArrayList<Point>();
			
			while(rs.next()) {
				Point p = new Point(rs.getInt("pnum"),
									rs.getString("userid"),
									rs.getInt("point"),
									rs.getDate("pdate"),
									rs.getString("pcontent"));
				list.add(p);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}
	
	public int selectPoint(String userId) {
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String query = "SELECT point FROM user_info WHERE userid=?";
		
		int num = 0;
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userId);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				num = rs.getInt("point");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		
		close(conn);
		
		return num;
	}
	
	public int pointInsert(Connection conn, Point p) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = "INSERT INTO point VALUES(SEQ_point.nextval, ?, ?, SYSDATE, ?)";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, p.getUserId());
			pstmt.setInt(2, p.getPoint());
			pstmt.setString(3, p.getpContent());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	public int plusPointUser(Connection conn, Point p) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = "UPDATE user_info SET point = ? WHERE userid = ?";
		
		String userId = p.getUserId();
		int point = p.getPoint();
		int num = selectPoint(userId);
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, (point+num));
			pstmt.setString(2, userId);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public int minusPointUser(Connection conn, Point p) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = "UPDATE user_info SET point = ? WHERE userid = ?";
		
		String userId = p.getUserId();
		int point = p.getPoint();
		int num = selectPoint(userId);
		System.out.println((-point) - (-num));
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, (-point) - (-num));
			pstmt.setString(2, userId);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

}
