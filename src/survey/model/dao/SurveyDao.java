package survey.model.dao;

import java.beans.Statement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import static common.JDBCTemplate.*;

import survey.model.vo.Answer;
import survey.model.vo.DoSurvey;
import survey.model.vo.Question;
import survey.model.vo.Survey;

public class SurveyDao {

	public ArrayList<Survey> selectHoldSurvey(Connection conn, String userId) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		ArrayList<Survey> sList = null;
		System.out.println(userId);
		try {
			pstmt = conn.prepareStatement("SELECT * FROM SURVEY WHERE SUSERID =? AND SSTATUS ='H'");
			pstmt.setString(1, userId);

			rs = pstmt.executeQuery();
			sList = new ArrayList<Survey>();
			while (rs.next()) {
				Survey s = new Survey(rs.getInt("snum"), rs.getString("stype"), rs.getString("stitle"),
						rs.getDate("sstartdt"), rs.getDate("senddt"), rs.getInt("scount"), rs.getInt("spoint"),
						rs.getInt("qCount"), rs.getInt("acount"), rs.getString("sstatus"), rs.getString("starget"),
						rs.getDate("screatedt"), rs.getString("suserId"));

				sList.add(s);
			}

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
			while (rs.next()) {
				Survey s = new Survey(rs.getInt("snum"), rs.getString("stype"), rs.getString("stitle"),
						rs.getDate("sstartdt"), rs.getDate("senddt"), rs.getInt("scount"), rs.getInt("spoint"),
						rs.getInt("qCount"), rs.getInt("acount"), rs.getString("sstatus"), rs.getString("starget"),
						rs.getDate("screatedt"), rs.getString("suserId"));

				sList.add(s);
			}
			;

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}

		return sList;
	}

	public ArrayList<Survey> selectIngSurvey(Connection conn, String userId) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		ArrayList<Survey> sList = null;
		try {
			pstmt = conn.prepareStatement("SELECT * FROM SURVEY WHERE SUSERID =? AND SSTATUS ='I'");
			pstmt.setString(1, userId);

			rs = pstmt.executeQuery();
			sList = new ArrayList<Survey>();
			while (rs.next()) {
				Survey s = new Survey(rs.getInt("snum"), rs.getString("stype"), rs.getString("stitle"),
						rs.getDate("sstartdt"), rs.getDate("senddt"), rs.getInt("scount"), rs.getInt("spoint"),
						rs.getInt("qCount"), rs.getInt("acount"), rs.getString("sstatus"), rs.getString("starget"),
						rs.getDate("screatedt"), rs.getString("suserId"));

				sList.add(s);
			}
			;

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
			pstmt = conn.prepareStatement("UPDATE SURVEY SET SSTATUS = 'H' WHERE SNUM = ?");
			pstmt.setInt(1, sNum);

			result = pstmt.executeUpdate();

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		System.out.println(result);
		return result;
	}

	public ArrayList<Survey> selectFinishedSurvey(Connection conn, String userId) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		ArrayList<Survey> sList = null;
		try {
			pstmt = conn.prepareStatement("SELECT * FROM SURVEY WHERE SUSERID =? AND SSTATUS ='C'");
			pstmt.setString(1, userId);

			rs = pstmt.executeQuery();
			sList = new ArrayList<Survey>();
			while (rs.next()) {
				Survey s = new Survey(rs.getInt("snum"), rs.getString("stype"), rs.getString("stitle"),
						rs.getDate("sstartdt"), rs.getDate("senddt"), rs.getInt("scount"), rs.getInt("spoint"),
						rs.getInt("qCount"), rs.getInt("acount"), rs.getString("sstatus"), rs.getString("starget"),
						rs.getDate("screatedt"), rs.getString("suserId"));

				sList.add(s);
			}
			;

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}

		return sList;
	}

	public ArrayList<Survey> selectPurchaseSurvey(Connection conn, String userId) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		ArrayList<Survey> sList = null;
		try {
			pstmt = conn.prepareStatement("SELECT * FROM SURVEY WHERE SUSERID =? AND SSTATUS ='H'");
			pstmt.setString(1, userId);

			rs = pstmt.executeQuery();
			sList = new ArrayList<Survey>();
			while (rs.next()) {
				Survey s = new Survey(rs.getInt("snum"), rs.getString("stype"), rs.getString("stitle"),
						rs.getDate("sstartdt"), rs.getDate("senddt"), rs.getInt("scount"), rs.getInt("spoint"),
						rs.getInt("qCount"), rs.getInt("acount"), rs.getString("sstatus"), rs.getString("starget"),
						rs.getDate("screatedt"), rs.getString("suserId"));

				sList.add(s);
			}
			;

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}

		return sList;
	}

	public int checkSNum(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		int sNum = 0;
		try {
			pstmt = conn.prepareStatement("SELECT SEQ_SURVEY.NEXTVAL FROM DUAL");
			rs = pstmt.executeQuery();

			while (rs.next()) {
				sNum = rs.getInt(1);
			}

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}

		return sNum;
	}

	public int makeSurvey(Connection conn, Survey s) {
		PreparedStatement pstmt = null;
		int sResult = 0;
		try {
			pstmt = conn.prepareStatement(
					"INSERT INTO SURVEY VALUES(SEQ_SURVEY.NEXTVAL, '1', ?, SYSDATE, NULL, ?, ?, ?, 0, 'H', ?, SYSDATE, ?)");
			pstmt.setString(1, s.getsTitle());
			pstmt.setInt(2, s.getsCount());
			pstmt.setInt(3, s.getsPoint());
			pstmt.setInt(4, s.getqCount());
			pstmt.setString(5, s.getsTarget());
			pstmt.setString(6, s.getsUserId());
			sResult = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return sResult;
	}

	public int makeQuestion(Connection conn, String[] qNum, String[] qType, String[] qTitle,
			ArrayList<String[]> answer) {
		PreparedStatement pstmt = null;
		int qResult = 0;
		int aResult = 0;
		String[] ans = new String[answer.size()];
		try {
			for (int i = 0; i < qNum.length; i++) {
				pstmt = conn.prepareStatement(
						"INSERT INTO QUESTION VALUES(SEQ_QUESTION.NEXTVAL, SEQ_SURVEY.CURRVAL, ?, ?)");
				pstmt.setString(1, qType[i]);
				pstmt.setString(2, qTitle[i]);
				qResult = pstmt.executeUpdate();
				ans = answer.get(i);
				for (int j = 0; j < ans.length; j++) {
					pstmt = conn
							.prepareStatement("INSERT INTO ANSWER VALUES(SEQ_ANSWER.NEXTVAL, SEQ_QUESTION.CURRVAL, ?)");
					pstmt.setString(1, ans[j]);
					aResult = pstmt.executeUpdate();
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return qResult;
	}

	public ArrayList<Survey> selectSurveys(Connection conn, String userId) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		ArrayList<Survey> sList = null;
		try {
			pstmt = conn.prepareStatement("SELECT * FROM SURVEY WHERE SSTATUS = 'H'and NOT SUSERID = ?");
			pstmt.setString(1, userId);
			sList = new ArrayList<Survey>();
			rs = pstmt.executeQuery();

			while (rs.next()) {
				Survey s = new Survey(rs.getInt("snum"), rs.getString("stype"), rs.getString("stitle"),
						rs.getDate("sstartdt"), rs.getDate("senddt"), rs.getInt("scount"), rs.getInt("spoint"),
						rs.getInt("qCount"), rs.getInt("acount"), rs.getString("sstatus"), rs.getString("starget"),
						rs.getDate("screatedt"), rs.getString("suserId"));
				sList.add(s);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return sList;
	}

	public ArrayList<Question> doServeyQ(Connection conn, int sNum) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Question> qList = null;
		try {
			pstmt = conn.prepareStatement("SELECT * FROM QUESTION WHERE SNUM = ?");
			pstmt.setInt(1, sNum);

			rs = pstmt.executeQuery();
			qList = new ArrayList();
			while (rs.next()) {
				Question q = new Question(rs.getInt("qnum"), rs.getInt("snum"), rs.getString("qtype"),
						rs.getString("qtitle"));
				qList.add(q);

			}
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);

		}
		return qList;
	}

	public ArrayList<DoSurvey> doServeyA(Connection conn, Survey s, ArrayList<Question> qList) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<DoSurvey> dsList = new ArrayList();
		DoSurvey ds = null;
		ArrayList<Answer> aList= new ArrayList<Answer>();
		
		for (int i = 0; i < qList.size(); i++) {
			try {
				
				pstmt = conn.prepareStatement("SELECT * FROM ANSWER WHERE QNUM=?");
				pstmt.setInt(1, qList.get(i).getqNum());
				rs = pstmt.executeQuery();
				Question q = new Question(qList.get(i).getqNum(),s.getsNum(), qList.get(i).getqType(), qList.get(i).getqTitle());
				
				while (rs.next()) {
					Answer a= new Answer(rs.getInt("anum"), qList.get(i).getqNum(), rs.getString("acontent"));
					aList.add(a);
				}
				dsList.add(new DoSurvey(s, q, aList));
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
				close(rs);
			}
		}
		return dsList;
	}

	public Survey doServeyS(Connection conn, int sNum) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Survey s = new Survey();

		try {
			pstmt = conn.prepareStatement("SELECT * FROM SURVEY WHERE SNUM = ?");
			pstmt.setInt(1, sNum);

			rs = pstmt.executeQuery();
			while (rs.next()) {
				s.setsNum(sNum);
				s.setsTitle(rs.getString("stitle"));

			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return s;
	}

}
