package user.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Properties;

import user.model.vo.surveyList;

import java.sql.*;
/*import java.sql.ResultSet;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Connection;
*/
import static common.JDBCTemplate.*;

import user.model.vo.UserInfo;
import survey.model.vo.Survey;

public class UserDao {
	private Properties prop = new Properties(); 

	public UserDao() {
		// 기본생성자는 항상 member-query.properties 값을 불러올 수 있도록
		// 기본 생성자 안에서 properties 파일을 불러오는 작업을 하자
		String fileName = UserDao.class.getResource("/sql/user/user-query.properties").getPath();

		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

	// SDB 로그인
	public UserInfo loginUser(Connection conn, UserInfo user) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		UserInfo loginUser = null;

		String query = prop.getProperty("loginMember");

		try {
			pstmt = conn.prepareStatement("SELECT * FROM USER_INFO WHERE USERID=? AND USERPWD=? AND STATUS='N'");

			pstmt.setString(1, user.getUserId());
//			pstmt.setString(2, user.getUserPwd());

//			pstmt.setString(1, "admin");
			pstmt.setString(2, "1234");

			System.out.println("암호화 처리되서 넘어감 : 수동입력");
			System.out.println("1 : " + user.getUserId());
			System.out.println("2 : " + user.getUserPwd());

			rs = pstmt.executeQuery();

			// resultSet의 결과가 있으면 ...
			if (rs.next()) {
				loginUser = new UserInfo(rs.getString("USERID"),
										rs.getString("USERPWD"),
										rs.getString("USERNAME"),
										rs.getInt("AGE"),
										rs.getString("GENDER"),
										rs.getString("EMAIL"),
										rs.getString("PHONE"),
										rs.getString("ADDRESS"),
										rs.getString("RECOMMEND_ID"),
										rs.getInt("SURVEYCOUNT"),
										rs.getInt("VISITCOUNT"),
										rs.getInt("USERTYPE"),
										rs.getString("STATUS"),
										rs.getString("FINAL_EDUCATION"),
										rs.getString("JOB"),
										rs.getString("INCOME"),
										rs.getString("LIVING_TYPE"),
										rs.getString("HOUSE_TYPE"),
										rs.getString("RELIGION"),
										rs.getString("MARITAL_STATUS"),
										rs.getString("LIVING_WITH"),
										rs.getString("ARMY_GO"),
										rs.getString("INTEREST"),
										rs.getDate("PWDDATE"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}

		return loginUser; // loginUser : vo객체 리턴
		// 다시 Service로 가자!!
	}

	public UserInfo selectUser(Connection conn, String userId) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		UserInfo user = null;

		try {

			pstmt = conn.prepareStatement("SELECT * FROM USER_INFO WHERE USERID=?");
			pstmt.setString(1, userId);
//			pstmt.setString(1, "admin");

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

	public int registerUser(Connection conn, UserInfo userInfo) {
		PreparedStatement pst = null;
		int result = 0;
		try {
			pst = conn.prepareStatement(
					"INSERT INTO USER_INFO VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, DEFAULT, DEFAULT, DEFAULT, DEFAULT, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, SYSDATE)");

			pst.setString(1, userInfo.getUserId());
			pst.setString(2, userInfo.getUserPwd());
			pst.setString(3, userInfo.getUserName());
			pst.setInt(4, userInfo.getAge());
			pst.setString(5, userInfo.getGender());
			pst.setString(6, userInfo.getEmail());
			pst.setString(7, userInfo.getPhone());
			pst.setString(8, userInfo.getAddress());
			pst.setString(9, userInfo.getRecommendId());
			pst.setString(10, userInfo.getFinalEducation());
			pst.setString(11, userInfo.getJob());
			pst.setString(12, userInfo.getIncome());
			pst.setString(13, userInfo.getLivingType());
			pst.setString(14, userInfo.getHouseType());
			pst.setString(15, userInfo.getReligion());
			pst.setString(16, userInfo.getMaritalStatus());
			pst.setString(17, userInfo.getLivingWith());
			pst.setString(18, userInfo.getArmyGo());
			pst.setString(19, userInfo.getInterest());

			result = pst.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pst);
		}
		return result;
	}

	public int idCheck(Connection conn, String userId) {
		PreparedStatement pst = null;
		ResultSet rs = null;

		int result = 0;

		try {
			pst = conn.prepareStatement("SELECT COUNT(*) FROM USER_INFO WHERE USERID=?");
			pst.setString(1, userId);
			rs = pst.executeQuery();

			if (rs.next()) {
				result = rs.getInt(1);
			}
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			close(rs);
			close(pst);
		}
		System.out.println("dao 검사" + result);
		return result;
	}

// 메인화면에 설문가능한 List 출력
	public ArrayList<Survey> selectReplyList(Connection conn, String userId) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		ArrayList<Survey> rlist = null;
		
		String query = prop.getProperty("selectReplyList");	// board-query.properties에 만들자
		
		
		
		try {
//			pstmt = conn.prepareStatement(query);
			
			// 추후에 쿼리 변경해야함
			pstmt = conn.prepareStatement("SELECT * FROM SURVEY");
			// 값안넘기고 그냥 테이블에 내용 조회되는지 TEST
			//pstmt.setString(1, userId);
			
			rs=pstmt.executeQuery();
			
			rlist = new ArrayList<Survey>();
			
			while(rs.next()) {
				rlist.add(new Survey(rs.getInt("snum"), rs.getString("stype"), rs.getString("stitle"),
						rs.getDate("sstartdt"), rs.getDate("senddt"), rs.getInt("scount"), rs.getInt("spoint"),
						rs.getInt("qCount"), rs.getInt("acount"), rs.getString("sstatus"), rs.getString("starget"),
						rs.getDate("screatedt"), rs.getString("suserId")	
						
						));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
	
		
		return rlist;
	}
	//출석체크 USER_INFO
	public int attendanceCheck(Connection conn, String userId) {
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement("UPDATE USER_INFO SET POINT = POINT+10 WHERE USERID=?");
			pstmt.setString(1, userId);
			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	//출석체크 POINT
	public int attendanceCheck2(Connection conn, String userId) {
		PreparedStatement pstmt = null;
		int result2 = 0;
		try {
			pstmt = conn.prepareStatement("UPDATE POINT SET POINT = POINT+10, PCONTENT = '출석' WHERE USERID=?");
			pstmt.setString(1, userId);
			result2 = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result2;
	}
	//출석체크 ATTENDANCE
	public int attendanceCheck3(Connection conn, String userId) {
		PreparedStatement pstmt = null;
		int result2 = 0;
		try {
			pstmt = conn.prepareStatement("UPDATE ATTENDANCE SET ATTPOINT=ATTPOINT+10, ATTCOUNT=ATTCOUNT+1, ATTDATE = SYSDATE WHERE USERID = ?");
			pstmt.setString(1, userId);
			result2 = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result2;
	}	
	
	// 오늘 출석했는지 체크
	public int loginAtCheck(Connection conn, String userId) {
		PreparedStatement pst = null;
		ResultSet rs = null;

		int result = 0;
 
		try {
			pst = conn.prepareStatement("SELECT * FROM ATTENDANCE WHERE USERID=? and TO_CHAR(ATTDATE,'YYYYMMDD')=TO_CHAR(SYSDATE,'YYYYMMDD')");
			pst.setString(1, userId);
			rs = pst.executeQuery();

			if (rs.next()) {
				result = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pst);
		}
		return result;
	}
	
	
}
