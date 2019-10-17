package mypage.model.service;


import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;

import mypage.model.dao.MemberDao;
import mypage.model.vo.Member;

public class MemberService {

	//로그인 처리를 위한 상수 선언
	public static int LOGIN_OK = 1;
	public static int WRONG_PASSWORD = 0;
	public static int ID_NOT_EXIST = -1;
	
	//기본생성자
	public MemberService() {}
	
	/*
	 * 1. 로그인용 서비스 메소드
	 */
	public Member loginMember(Member member) {
		Connection conn = getConnection();
		Member loginUser = new MemberDao().loginMember(conn,member);
		
		close(conn);
		
		return loginUser;
		//memberSErvlet으로 이동
	}

	public int insertMember(Member member) {
		Connection conn = getConnection();
		int result = new MemberDao().insertMember(conn, member);
		
		if(result>0)
			commit(conn);
		else
			rollback(conn);
		
		close(conn);
		
		return result;
		//memberSErvlet으로 이동
	}

	public Member selectMember(String userId) {
		Connection conn = getConnection();
		
		Member member = new MemberDao().selectMember(conn,userId);
		
		close(conn);
		return member;
	}

	public int updateMember(Member member) {
		Connection conn = getConnection();
		
		int result = new MemberDao().updateMember(conn, member);
		
		if(result>0)
			commit(conn);
		else
			rollback(conn);
		
		close(conn);
		
		return result;
	}

	public int deleteMember(String userId) {
	Connection conn = getConnection();
		
		int result = new MemberDao().deleteMember(conn, userId);
		
		if(result>0)
			commit(conn);
		else
			rollback(conn);
		
		close(conn);
		
		return result;
	}


	
}
