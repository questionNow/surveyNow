package qna.model.dao;

import static common.JDBCTemplate.close;

import java.sql.*;
import java.util.*;

import qna.model.vo.QnA;

public class QnADao {
	
	public ArrayList<QnA> selectList(Connection conn, String userId) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		ArrayList<QnA>list = null;
		
		
		  /* String query ="SELECT ROWNUM, QNANUM, USERID, QNATITLE, QNACONTENT, t.TYPENAME QNATYPE, ACONTENT, DECODE(ANSWERYN, 'N', '미등록', 'Y', '등록') ANSWERYN, QNADT, ADMINID FROM QNA q "
		  + "INNER JOIN QNATYPE t ON q.QNATYPE = t.QNATYPE WHERE USERID=? ORDER BY 1 DESC"; */
		 
		
		String query = "SELECT * FROM QNA WHERE USERID=? ORDER BY 1 DESC";
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, userId);
			
			rs=pstmt.executeQuery();
			
			list = new ArrayList<QnA>();
			
			while(rs.next()) {
				QnA b = new QnA(rs.getInt("qnanum"),
								rs.getString("qnatitle"),
								rs.getString("qnacontent"),
								rs.getString("qnatype"),
								rs.getString("acontent"),
								rs.getString("answeryn"),
								rs.getString("adminid"),
								rs.getDate("qnadt"),
								rs.getString("userid"));
				
				list.add(b);
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		System.out.println("list44 : " + list);
		return list;
	}
	
	
	
	public int insertAnswer(Connection conn, String answer) {
		Statement stmt = null;
		int result = 0;
		
		String query = "INSERT INTO qna(acontent) VALUES("+answer+")";
		
		try {
			stmt = conn.createStatement();
			result = stmt.executeUpdate(query);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
		}
		
		return result;
	}

	public QnA selectQnA(Connection conn, int qnanum) {
		Statement stmt = null;
		ResultSet rs = null;
		
		QnA q = null;
		
		String query = "SELECT qnanum, u.username userid, qnatitle, qnacontent, t.typename qnatype, acontent, answeryn, a.username adminid,qnadt FROM qna q \r\n" + 
				"LEFT OUTER JOIN qnatype t ON q.qnatype = t.qnatype\r\n" + 
				"LEFT OUTER JOIN user_info u ON q.userid = u.userid \r\n" + 
				"LEFT OUTER JOIN user_info a ON q.adminid = a.userid\r\n" + 
				"WHERE qnanum = " + qnanum;

		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(query);
			
			while(rs.next()) {
				q = new QnA(rs.getInt("qnanum"),
							rs.getString("userid"),
							rs.getString("qnatitle"),
							rs.getString("qnacontent"),
							rs.getString("qnatype"),
							rs.getString("acontent"),
							rs.getString("answeryn"),
							rs.getString("adminid"),
							rs.getDate("qnadt"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(stmt);
			close(rs);
		}
		return q;
	}

//	public QnA selectAnswer(Connection conn, int qnaNum) {
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//		
//		String query = "SELECT u.username adminid, acontent FROM qna q " + 
//				"LEFT OUTER JOIN user_info u ON q.adminid = u.userid " + 
//				"WHERE qnanum = ?";
//		
//		QnA a = null;
//		
//		try {
//			pstmt = conn.prepareStatement(query);
//			pstmt.setInt(1, qnaNum);
//			
//			rs = pstmt.executeQuery();
//			
//			while(rs.next()) {
//				a = new QnA(rs.getString("adminid"),
//							rs.getString("acontent"));
//			}
//			
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}finally {
//			close(pstmt);
//			close(rs);
//		}
//		return a;
//	}

	public int answerInsert(Connection conn, int qnaNum, String adminId, String acontent) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = "UPDATE qna SET acontent = ?, adminid = ?,answeryn = 'Y' WHERE qnanum = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, acontent);
			pstmt.setString(2, adminId);
			pstmt.setInt(3, qnaNum);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}


	public ArrayList<QnA> MyQnASearch(Connection conn, int qnaNum, String qnaType, String qnaTitle) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		ArrayList<QnA>list = null;
		
		
		  /* String query ="SELECT ROWNUM, QNANUM, USERID, QNATITLE, QNACONTENT, t.TYPENAME QNATYPE, ACONTENT, DECODE(ANSWERYN, 'N', '미등록', 'Y', '등록') ANSWERYN, QNADT, ADMINID FROM QNA q "
		  + "INNER JOIN QNATYPE t ON q.QNATYPE = t.QNATYPE WHERE USERID=? ORDER BY 1 DESC"; */
		 
		
		String query = "SELECT * FROM QNA WHERE (QNANUM LIKE '%'|| ? ||'%' QNATYPE LIKE '%'|| ? ||'%' QNATITLE LIKE '%'|| ? ||'%')";
		
		
		try {
			pstmt = conn.prepareStatement(query);
		
			pstmt.setInt(1, qnaNum);
			pstmt.setString(2, qnaType);
			pstmt.setString(3, qnaTitle);
			rs=pstmt.executeQuery();
			
			list = new ArrayList<QnA>();
			
			while(rs.next()) {
				QnA b = new QnA(rs.getInt("qnanum"),
								rs.getString("qnatitle"),
								rs.getString("qnacontent"),
								rs.getString("qnatype"),
								rs.getString("acontent"),
								rs.getString("answeryn"),
								rs.getString("adminid"),
								rs.getDate("qnadt"),
								rs.getString("userid"));
				
				list.add(b);
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}

}
