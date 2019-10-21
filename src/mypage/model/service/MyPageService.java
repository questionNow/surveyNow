package mypage.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import mypage.model.dao.MyPageDao;
import user.model.vo.Point;
import user.model.vo.UserInfo;

  
public class MyPageService {

	
	public MyPageService() {}
	
		// 마이 페이지
		public UserInfo selectMember(String userId) {
			Connection conn = getConnection();
			
			UserInfo user = new MyPageDao().selectUser(conn,userId);
			
			close(conn);
			
			return user;
		}

		
	

	
	  public int getPointListCount() {
		  Connection conn = getConnection();
	  
	 int listCount = new MyPageDao().getPointListCount(conn);
	  
	  close(conn);
	 
	  return listCount;
	  }
	



	public ArrayList<Point> selectPointList(int currentPage, int limit, int listCount) {
		Connection conn = getConnection();
		
		ArrayList<Point> pointlist = new MyPageDao().selectPointList(conn, currentPage, limit, listCount);
		
		close(conn);
		
		return pointlist;
	}
	
	// 개인 정보 수정
	public int InfoChange(UserInfo userInfo) {
		
			Connection conn = getConnection();
			int result = new MyPageDao().InfoChange(conn, userInfo);
		
			if(result > 0) 				
				commit(conn);
			else
				rollback(conn);
		
				close(conn);
				System.out.println(result);
				return result;
	}

	public UserInfo MyInfoUser(String userId) {
		Connection conn = getConnection();
		UserInfo user = new MyPageDao().MyInfoUser(conn, userId);
		
		close(conn);
		
		return user;
	}

	public int getListCount() {
		  Connection conn = getConnection();
		  
			 int listCount = new MyPageDao().getListCount(conn);
			  
			  close(conn);
			 
			  return listCount;
	}


	


}
