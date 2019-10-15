package user.model.service;

import static common.JDBCTemplate.*;

import java.sql.*;

import user.model.dao.UserDao;
import user.model.vo.UserInfo;

public class UserService {

	public static int LOGIN_OK = 1;
	public static int WRONG_PASSWORD = 0;
	public static int ID_NOT_EXIST = -1;

	public UserService() {}
	
	public int registerUser(UserInfo userInfo) {
		
		Connection conn = getConnection();
		int result = new UserDao().registerUser(conn, userInfo);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

}
