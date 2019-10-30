package common.model.dao;

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

import board.model.vo.Board;
import survey.model.vo.Survey;
import qna.model.vo.QnA;

public class MainSerachDao {
	private Properties prop = new Properties(); 

	public MainSerachDao() {
		// 기본생성자는 항상 member-query.properties 값을 불러올 수 있도록
		// 기본 생성자 안에서 properties 파일을 불러오는 작업을 하자
		String fileName = MainSerachDao.class.getResource("/sql/user/user-query.properties").getPath();

		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

	// 공지사항 조회
	public ArrayList<Board> allSearchBoard(Connection conn, String serachText) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Board> allMenuBoard = null;
		
		String query = "SELECT ROWNUM, bnum, bwriter, bwname, btitle, bcontent, bcreatedt, DECODE(btype, 'n', '공지사항', 'e', '이벤트') btype, bstatus, bcount "
				+ "FROM BOARD WHERE (BTITLE LIKE '%'||?||'%' OR BCONTENT LIKE '%'||?||'%') AND BSTATUS = 'N'";
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, serachText);
			pstmt.setString(2, serachText);  
System.out.println("DAO : " + serachText);

			rs = pstmt.executeQuery();
			allMenuBoard = new ArrayList<Board>();
			
			// resultSet의 결과가 있으면 ...
			while (rs.next()) {
				Board b = new Board(rs.getInt("bnum"),
						rs.getString("bwriter"),
						rs.getString("bwname"),
						rs.getString("btitle"),
						rs.getString("bcontent"),
						rs.getDate("bcreatedt"),
						rs.getString("btype"),
						rs.getString("bstatus"),
						rs.getInt("bcount"));
				
				allMenuBoard.add(b);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}

		return allMenuBoard;
	}
	
	public ArrayList<QnA> allSearchQna(Connection conn, String serachText) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		ArrayList<QnA> allMenuQna = null;
		
		String query = "SELECT * FROM QNA WHERE (QNATITLE LIKE '%'||?||'%' OR QNACONTENT LIKE '%'||?||'%')";

		try {
			pstmt = conn.prepareStatement(query);

			pstmt.setString(1, serachText);
			pstmt.setString(2, serachText);

System.out.println("DAO : " + serachText);

			rs = pstmt.executeQuery();
			allMenuQna = new ArrayList<QnA>();
			
			while (rs.next()) {
				QnA q = new QnA(rs.getInt("QNANUM"),
						 rs.getString("USERID"),
						 rs.getString("QNATITLE"),
						 rs.getString("QNACONTENT"),
						 rs.getString("QNATYPE"),
						 rs.getString("ACONTENT"),
						 rs.getString("ANSWERYN"),
						 rs.getString("ADMINID"),
						 rs.getDate("QNADATE")
						);
				
				
				
				allMenuQna.add(q);
				 
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}

		return allMenuQna;
	}
	
	public ArrayList<Survey> allSearchSurvey(Connection conn, String serachText) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		ArrayList<Survey> allMenuSurvey = null;
		
		String query = "SELECT * FROM SURVEY WHERE STITLE LIKE '%'||?||'%'";

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, serachText);

System.out.println("DAO : " + serachText);

			rs = pstmt.executeQuery();
			allMenuSurvey = new ArrayList<Survey>();
			
			// resultSet의 결과가 있으면 ...
			while (rs.next()) {
				Survey s= new Survey(
						rs.getInt("snum"), rs.getString("stype"), rs.getString("stitle"),
						rs.getDate("sstartdt"), rs.getDate("senddt"), rs.getInt("scount"), rs.getInt("spoint"),
						rs.getInt("qCount"), rs.getInt("acount"), rs.getString("sstatus"), rs.getString("starget"),
						rs.getDate("screatedt"), rs.getString("suserId")
						);
				
				allMenuSurvey.add(s);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}

		return allMenuSurvey;
	}

}
