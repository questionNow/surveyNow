package user.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.*;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;

import user.model.vo.UserInfo;

import static common.JDBCTemplate.*;
public class UserDao {

	private Properties prop = new Properties();
	
	public UserDao() {}
	
	public int registerUser(Connection conn, UserInfo userInfo) {
		PreparedStatement pst = null;
		int result = 0;
		System.out.println(userInfo);
		try {
			pst = conn.prepareStatement("INSERT INTO USER_INFO VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, DEFAULT, DEFAULT, DEFAULT, DEFAULT, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, SYSDATE)");
			
			
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
			
			if(rs.next()) {
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

}
