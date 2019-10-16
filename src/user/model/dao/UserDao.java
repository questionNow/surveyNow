package user.model.dao;

import user.model.vo.UserInfo1;

import static common.JDBCTemplate.*;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;


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
	
	//SDB 로그인
	public UserInfo1 loginUser(Connection conn, UserInfo1 user) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		UserInfo1 loginUser = null;
		
		String query = prop.getProperty("loginMember");
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, user.getUserId());
//			pstmt.setString(2, user.getUserPwd());
			
//			pstmt.setString(1, "admin");
			pstmt.setString(2, "1234");
			
System.out.println("암호화 처리되서 넘어감 : 수동입력");
System.out.println("1 : " + user.getUserId());
System.out.println("2 : " + user.getUserPwd());
			
			rs = pstmt.executeQuery();
			
			// resultSet의 결과가 있으면 ...
			if(rs.next()) {
				loginUser = new UserInfo1(rs.getString("USER_ID"),
						               rs.getString("USER_PWD"),
						               rs.getString("USER_NAME"),
						               rs.getInt("AGE"),
						               rs.getString("ADDRESS"),
						               rs.getInt("PHONE"),
						               rs.getString("EMAIL"),
						               rs.getInt("USER_TYPE"),
						               rs.getString("STATUS")
									   );
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return loginUser;	// loginUser : vo객체 리턴
		//다시 Service로 가자!!
	}
	
	public UserInfo1 selectUser(Connection conn, String userId) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		UserInfo1 user = null;
		
		String query = prop.getProperty("selectMember");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userId);
//			pstmt.setString(1, "admin");
			
			
			rs = pstmt.executeQuery();
			
			// resultSet의 결과가 있으면 ...
			if(rs.next()) {
				user = new UserInfo1(rs.getString("USER_ID"),
			               rs.getString("USER_PWD"),
			               rs.getString("USER_NAME"),
			               rs.getInt("AGE"),
			               rs.getString("ADDRESS"),
			               rs.getInt("PHONE"),
			               rs.getString("EMAIL"),
			               rs.getInt("USER_TYPE"),
			               rs.getString("STATUS")
						   );
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		
		return user;
	}
	
}
