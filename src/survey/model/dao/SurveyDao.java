package survey.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import static common.JDBCTemplate.*;

import survey.model.vo.Survey;

public class SurveyDao {

	public ArrayList<Survey> selectHoldSurvey(Connection conn, String userId) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		ArrayList<Survey> sList = null;
		try {
			pstmt = conn.prepareStatement("SELECT * FROM SURVEY WHERE SUSERID =? AND SSTATUS ='H'");
			pstmt.setString(1, userId);
			
			rs = pstmt.executeQuery();
			sList = new ArrayList<Survey>();
			while(rs.next()) {
				Survey s = new Survey(rs.getInt("snum"),
										rs.getString("stype"),
										rs.getString("stitle"),
										rs.getDate("sstartdt"),
										rs.getDate("senddt"),
										rs.getInt("scount"),
										rs.getInt("spoint"),
										rs.getInt("acount"),
										rs.getString("sstatus"),
										rs.getString("starget"),
										rs.getDate("screatedt"));
				
				sList.add(s);
			};
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		
		return sList;
	}

	public ArrayList<Survey> selectDeletedSurvey(Connection conn, String userId) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		ArrayList<Survey> sList = null;
		try {
			pstmt = conn.prepareStatement("SELECT * FROM SURVEY WHERE SUSERID =? AND SSTATUS ='D'");
			pstmt.setString(1, userId);
			
			rs = pstmt.executeQuery();
			sList = new ArrayList<Survey>();
			while(rs.next()) {
				Survey s = new Survey(rs.getInt("snum"),
										rs.getString("stype"),
										rs.getString("stitle"),
										rs.getDate("sstartdt"),
										rs.getDate("senddt"),
										rs.getInt("scount"),
										rs.getInt("spoint"),
										rs.getInt("acount"),
										rs.getString("sstatus"),
										rs.getString("starget"),
										rs.getDate("screatedt"));
				
				sList.add(s);
			};
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		
		return sList;
	}

	public int reviveSurvey(Connection conn, int sNum) {
		PreparedStatement pstmt = null;
		int result = 0;
	
		try {
			pstmt = conn.prepareStatement("UPDATE SURVEY SET SSTATUS = 'H' WHERE SNUM =?");
			pstmt.setInt(1, sNum);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}



}
