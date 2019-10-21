package mypage.model.dao;

/*import java.sql.ResultSet;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Connection;
*/
import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import user.model.vo.Point;
import user.model.vo.UserInfo;



public class MyPageDao {
	

	public MyPageDao() {}

	
	// 마이페이지 !
	public UserInfo selectUser(Connection conn, String userId) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		UserInfo user = null;

		try {

			pstmt = conn.prepareStatement("SELECT * FROM USER_INFO WHERE USERID=?");
			pstmt.setString(1, userId);

			rs = pstmt.executeQuery();

			// resultSet의 결과가 있으면 ...
			if (rs.next()) {
				user = new UserInfo(rs.getString("USERID"), rs.getString("USERPWD"), rs.getString("USERNAME"),
						rs.getInt("AGE"), rs.getString("GENDER"), rs.getString("EMAIL"), rs.getString("PHONE"),
						rs.getString("ADDRESS"), rs.getString("RECOMMEND_ID"), rs.getInt("SURVEYCOUNT"),
						rs.getInt("VISITCOUNT"), rs.getInt("USERTYPE"), rs.getString("STATUS"),
						rs.getString("FINAL_EDUCATION"), rs.getString("JOB"), rs.getString("INCOME"),
						rs.getString("LIVING_TYPE"), rs.getString("HOUSE_TYPE"), rs.getString("RELIGION"),
						rs.getString("MARITAL_STATUS"), rs.getString("LIVING_WITH"), rs.getString("ARMY_GO"),
						rs.getString("INTEREST"), rs.getDate("PWDDATE"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}

		return user;
	}

	// 마이페이지 정보 수정 
	public UserInfo MyInfoUser(Connection conn, String userId) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		UserInfo user = null;

		try {

			pstmt = conn.prepareStatement("SELECT * FROM USER_INFO WHERE USERID=?");
			pstmt.setString(1, userId);

			rs = pstmt.executeQuery();

			// resultSet의 결과가 있으면 ...
			if (rs.next()) {
				user = new UserInfo(rs.getString("USERID"), rs.getString("USERPWD"), rs.getString("USERNAME"),
						rs.getInt("AGE"), rs.getString("GENDER"), rs.getString("EMAIL"), rs.getString("PHONE"),
						rs.getString("ADDRESS"), rs.getString("RECOMMEND_ID"), rs.getInt("SURVEYCOUNT"),
						rs.getInt("VISITCOUNT"), rs.getInt("USERTYPE"), rs.getString("STATUS"),
						rs.getString("FINAL_EDUCATION"), rs.getString("JOB"), rs.getString("INCOME"),
						rs.getString("LIVING_TYPE"), rs.getString("HOUSE_TYPE"), rs.getString("RELIGION"),
						rs.getString("MARITAL_STATUS"), rs.getString("LIVING_WITH"), rs.getString("ARMY_GO"),
						rs.getString("INTEREST"), rs.getDate("PWDDATE"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}

		return user;
	}

	// 마이페이지  포인트게시판 리스트 갯수 구하기
	/*
	 * public int getPointListCount(Connection conn) { PreparedStatement pstmt =
	 * null; ResultSet rs = null;
	 * 
	 * int listCount = 0;
	 * 
	 * String query="SELECT COUNT(*) FROM POINT";
	 * 
	 * try { pstmt = conn.prepareStatement(query);
	 * 
	 * 
	 * rs = pstmt.executeQuery();
	 * 
	 * if(rs.next()) { // 쿼리에서의 resultSet 컬럼 값(count(*))을 뽑아내서 int listCount에 담음
	 * listCount= rs.getInt(1); }
	 * 
	 * } catch (SQLException e) { e.printStackTrace(); }finally { close(pstmt);
	 * close(rs); } return listCount; }
	 */


	/*
	 * public ArrayList<Point> selectPointList(Connection conn, int currentPage, int
	 * limit) { PreparedStatement pstmt = null; ResultSet rs =null;
	 * 
	 * ArrayList<Point>pointlist =null;
	 * 
	 * String query ="SELECT * FROM POINT WHERE PNUM BETWEEN ? AND ?";
	 * 
	 * int startRow = (currentPage-1) * limit +1; int endRow = startRow + limit -1;
	 * 
	 * try { pstmt = conn.prepareStatement(query); pstmt.setInt(1, startRow);
	 * pstmt.setInt(2, endRow);
	 * 
	 * rs = pstmt.executeQuery();
	 * 
	 * pointlist = new ArrayList<Point>();
	 * 
	 * while(rs.next()) { Point p = new Point(rs.getInt("pNum"),
	 * rs.getString("userId"), rs.getInt("point"), rs.getDate("pDate"),
	 * rs.getString("pContent"));
	 * 
	 * pointlist.add(p); }
	 * 
	 * 
	 * 
	 * } catch (SQLException e) { e.printStackTrace(); }finally { close(rs);
	 * close(pstmt); }
	 * 
	 * 
	 * return pointlist; }
	 */

	public ArrayList<Point> selectPointList(Connection conn, int currentPage, int limit, int listCount) {
		PreparedStatement pstmt = null;
		ResultSet rs =null;
		
		ArrayList<Point>pointlist =null;
		
		String query ="SELECT * FROM POINT WHERE PNUM BETWEEN ? AND ? AND PNUM = ?";
		
		int startRow = (currentPage-1) * limit +1;
		int endRow = startRow + limit -1;
		int pNum = 0;
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1,  startRow);
			pstmt.setInt(2, endRow);
			pstmt.setInt(3, pNum);
			
			rs = pstmt.executeQuery();
			
			pointlist = new ArrayList<Point>();
			
			while(rs.next()) {
				Point p = new Point(rs.getInt("pNum"),
									rs.getString("userId"),
									rs.getInt("point"),
									rs.getDate("pDate"),
									rs.getString("pContent"));
				
				pointlist.add(p);
	}
		} catch (SQLException e) {
		e.printStackTrace(); 
		}finally { 
		close(rs);
		 close(pstmt); 
		 }

		 return pointlist; 
		 }
	

	public int InfoChange(Connection conn, UserInfo userInfo) {
		PreparedStatement pstm = null;
		int result = 0;
		
		String query ="UPDATE USER_INFO SET USERNAME=?, AGE=?, EMAIL=?, PHONE=?, ADDRESS=?, FINAL_EDUCATION=?, JOB=?, INCOME=?, LIVING_TYPE=?, HOUSE_TYPE=?, "
				+ "RELIGION=?, MARITAL_STATUS=?, LIVING_WITH=?, ARMY_GO=?, INTEREST=? WHERE USERID=?";
		try {
			pstm = conn.prepareStatement(query);
	
			
			
			pstm.setString(1, userInfo.getUserName());
			pstm.setInt(2, userInfo.getAge());
			pstm.setString(3, userInfo.getEmail());
			pstm.setString(4, userInfo.getPhone());
			pstm.setString(5, userInfo.getAddress());
			pstm.setString(6, userInfo.getFinalEducation());
			pstm.setString(7, userInfo.getJob());
			pstm.setString(8, userInfo.getIncome());
			pstm.setString(9, userInfo.getLivingType());
			pstm.setString(10, userInfo.getHouseType());
			pstm.setString(11, userInfo.getReligion());
			pstm.setString(12, userInfo.getMaritalStatus());
			pstm.setString(13, userInfo.getLivingWith());
			pstm.setString(14, userInfo.getArmyGo());
			pstm.setString(15, userInfo.getInterest());
			pstm.setString(16, userInfo.getUserId());
			result = pstm.executeUpdate();
			
			System.out.println(result);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstm);
		}
		return result;
	}


	public int getPointListCount(Connection conn) {
		// TODO Auto-generated method stub
		return 0;
	}


	public int getListCount(Connection conn) {
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			int listCount = 0;
			
			String query ="SELECT COUNT(*) FROM QNA WHERE USER=?";
			
			try {
				pstmt = conn.prepareStatement(query);
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					listCount=rs.getInt(1);	// 쿼리에서의 resultSet 컬럼 값(count(*))을 뽑아내서 int listCount에 담음
				}

			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				close(pstmt);
				close(rs);
			}
			return listCount;
	}


		}