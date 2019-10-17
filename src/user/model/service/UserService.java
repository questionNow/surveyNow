package user.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;

import user.model.dao.UserDao;
import user.model.vo.UserInfo1;
  
public class UserService {
	
	// 로그인 처리를 위한 상수 선언
	public static int LOGIN_OK = 1;
	public static int WRONG_PASSWORD = 0;
	public static int ID_NOT_EXIST = -1;
	
	public UserService() {}
	
	 
	
	//SDB 로그인 
	public UserInfo1 loginUser(UserInfo1 user) {
		Connection conn = getConnection();

		UserInfo1 loginUser = new UserDao().loginUser(conn,user);
		
		close(conn);
		
		return loginUser;
	}
	
	
	public UserInfo1 selectMember(String userId) {
		Connection conn = getConnection();
		
		UserInfo1 user = new UserDao().selectUser(conn,userId);
		
		close(conn);
		
		return user;
	}
	
}
