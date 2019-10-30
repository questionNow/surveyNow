package common.model.service;

import static common.JDBCTemplate.*;

import java.sql.*;

import common.model.dao.MainSerachDao;
import common.model.vo.MainSerachVo;


import user.model.vo.UserInfo;
import user.model.vo.surveyList;

import java.sql.Connection;
import java.util.ArrayList;

import board.model.vo.Board;
import survey.model.vo.Survey;
import qna.model.vo.QnA;

  
public class MainSerachService { 
	
	// 로그인 처리를 위한 상수 선언
	public static int LOGIN_OK = 1;
	public static int WRONG_PASSWORD = 0;
	public static int ID_NOT_EXIST = -1;
	
	public MainSerachService() {}
	
	 
	
	//SDB 로그인 
	/*
	 * public UserInfo loginUser(UserInfo user) { Connection conn = getConnection();
	 * 
	 * UserInfo loginUser = new UserDao().loginUser(conn,user);
	 * 
	 * close(conn);
	 * 
	 * return loginUser; }
	 * 
	 * // SDB -TEST_정보수정 되는지 확인용 public UserInfo selectMember(String userId) {
	 * Connection conn = getConnection();
	 * 
	 * UserInfo user = new UserDao().selectUser(conn,userId);
	 * 
	 * close(conn);
	 * 
	 * return user; }
	 * 
	 * 
	 * public int registerUser(UserInfo userInfo) { Connection conn =
	 * getConnection(); int result = new UserDao().registerUser(conn, userInfo);
	 * 
	 * if(result > 0) { commit(conn); } else { rollback(conn); } close(conn); return
	 * result; }
	 * 
	 * public int idCheck(String userId) { Connection conn = getConnection(); int
	 * result = new UserDao().idCheck(conn, userId); System.out.println("Service 검사"
	 * + result); close(conn); return result; }
	 * 
	 * 
	 * 
	 * public ArrayList<Survey> selectSurveyList(String userId) { // SELECT 는 처음에
	 * Connection conn = getConnection(); 생성함 Connection conn = getConnection();
	 * 
	 * ArrayList<Survey> rlist = new UserDao().selectReplyList(conn,userId);
	 * 
	 * close(conn);
	 * 
	 * return rlist; }
	 * 
	 * 
	 * 
	 * public static int userType(String userId) { // TODO Auto-generated method
	 * stub return 0; }
	 */



	public ArrayList<Board> allSearchBoard(String serachText) {
		Connection conn = getConnection();
		
		ArrayList<Board> allMenuBoard = new MainSerachDao().allSearchBoard(conn,serachText);
		
		close(conn);
		
		return allMenuBoard;
	}
	public ArrayList<QnA> allSearchQna(String serachText) {
		Connection conn = getConnection();
		
		ArrayList<QnA> allMenuQna = new MainSerachDao().allSearchQna(conn,serachText);
		
		close(conn);
		
		return allMenuQna;
	}
	public ArrayList<Survey> allSearchSurvey(String serachText) {
		Connection conn = getConnection();
		
		ArrayList<Survey> allMenuSurvey = new MainSerachDao().allSearchSurvey(conn,serachText);
		
		close(conn);
		
		return allMenuSurvey;
	}

}
