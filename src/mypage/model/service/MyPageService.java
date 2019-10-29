package mypage.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import mypage.model.dao.MyPageDao;
import mypage.model.vo.attendence;
import qna.model.vo.QnA;
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

	  // 포인트
	public ArrayList<Point> selectPointList(String userId) {
		Connection conn = getConnection();
		
		ArrayList<Point> pointlist = new MyPageDao().selectPointList(conn, userId);
		
		close(conn);
		
		return pointlist;
	}
	
	// 개인 정보 수정
	public int InfoChange(UserInfo userInfo) {
		
			Connection conn = getConnection();
			int result = new MyPageDao().InfoChange(conn, userInfo);
		
			if(result > 0) 	{			
				commit(conn);
			}else {
				rollback(conn);
			}
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
	
	
	
	// 1대1 문의 
	public int getQnAListCount() {
		Connection conn = getConnection();
		  
		 int listCount = new MyPageDao().getQnAListCount(conn);
		  
		  close(conn);
		 
		  return listCount;
	}

	// 1대1 문의 작성
	public int insertMyQnA(QnA qna) {
		Connection conn = getConnection();
		
		int result = new MyPageDao().insertMyQnA(conn, qna);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}

	public int Userdelete(String userId) {
Connection conn = getConnection();
		
		int result = new MyPageDao().Userdelete(conn, userId);
		
		if(result>0)
			commit(conn);
		else
			rollback(conn);
		
		close(conn);
		
		return result;
	}

	/*
	 * public UserInfo UserDeleteForm(String userId) { Connection conn =
	 * getConnection();
	 * 
	 * UserInfo user = new MyPageDao().UserDeleteForm(conn,userId);
	 * 
	 * close(conn); return user; }
	 */

	public ArrayList<attendence> calendarSave(String userId) {
	Connection conn = getConnection();
	
	ArrayList<attendence> at = null;
	
		int result = new MyPageDao().calendarSave(conn, userId);
		
		if(result > 0) {
			
System.out.println("result222222 : " + result);			
			
			commit(conn);
			
System.out.println("userId : " + userId);	
			
 	at = new MyPageDao().calendarSelect(conn, userId);
 		System.out.println("at1111 : " + at);			 
	 
		}else {
			rollback(conn);
		}
		close(conn);
		
		return at;
	}

	public UserInfo UserDeleteForm(String userId) {
		Connection conn = getConnection();
		UserInfo result = new MyPageDao().UserDeleteForm(conn, userId);
	
		close(conn);
		
		return result;
	}

	public UserInfo MyQnASearch(String userId) {
		// TODO Auto-generated method stub
		return null;
	}



	


	


}
