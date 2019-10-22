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
import survey.model.vo.Chart;
import survey.model.vo.DoSurvey;
import survey.model.vo.Question;
import survey.model.vo.Survey;
import survey.model.vo.SurveyTarget;

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
					"INSERT INTO SURVEY VALUES(SEQ_SURVEY.NEXTVAL, ?, ?, SYSDATE, NULL, ?, ?, ?, 0, 'H', ?, SYSDATE, ?)");
			pstmt.setString(1, s.getsType());
			pstmt.setString(2, s.getsTitle());
			pstmt.setInt(3, s.getsCount());
			pstmt.setInt(4, s.getsPoint());
			pstmt.setInt(5, s.getqCount());
			pstmt.setString(6, s.getsTarget());
			pstmt.setString(7, s.getsUserId());
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
		ArrayList<Answer> aList = null;

		for (int i = 0; i < qList.size(); i++) {
			try {

				pstmt = conn.prepareStatement("SELECT * FROM ANSWER WHERE QNUM=?");
				pstmt.setInt(1, qList.get(i).getqNum());
				rs = pstmt.executeQuery();
				aList = new ArrayList<Answer>();
				Question q = new Question(qList.get(i).getqNum(), s.getsNum(), qList.get(i).getqType(),
						qList.get(i).getqTitle());
				int aCount = 0;
				while (rs.next()) {
					Answer a = new Answer(rs.getInt("anum"), qList.get(i).getqNum(), rs.getString("acontent"));
					aList.add(a);
					aCount++;
				}
				dsList.add(new DoSurvey(s, q, aList, aCount));
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

	public int makeSurveyTarget(Connection conn, SurveyTarget st) {
		PreparedStatement pstmt = null;
		int stResult = 0;
		String targetDetail = "";
		for (int i = 0; i < st.getTargetType().length; i++) {
			for (int j = 0; j < st.getTargetDetail().get(i).length; j++) {
				if (j == st.getTargetDetail().get(i).length - 1) {
					targetDetail += st.getTargetDetail().get(i)[j];
				} else {
					targetDetail += st.getTargetDetail().get(i)[j] + ",";
				}
			}

			try {
				pstmt = conn.prepareStatement("INSERT INTO SURVEY_TARGET VALUES(SEQ_SERVEY.CURRVAL, ?, ?)");
				pstmt.setString(1, st.getTargetType()[i]);
				pstmt.setString(2, targetDetail);
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
		}
		System.out.println("타겟 잘 들어가는가,,,?" + stResult);
		return stResult;
	}

	public ArrayList<Answer> getAnswer(Connection conn, ArrayList<Question> qList) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		ArrayList<Answer> aList = null;

		for (int i = 0; i < qList.size(); i++) {
			try {
				aList = new ArrayList<Answer>();
				pstmt = conn.prepareStatement("SELECT * FROM ANSWER WHERE QNUM=?");
				pstmt.setInt(1, qList.get(i).getqNum());
				while (rs.next()) {
					aList.add(new Answer(rs.getInt("anum"), qList.get(i).getqNum(), rs.getString("acontent")));
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return aList;
	}

	public ArrayList<Chart> chartServey(Connection conn, Survey s, ArrayList<Question> qList,
			ArrayList<DoSurvey> dsList) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		ArrayList<Chart> cList = new ArrayList<Chart>();

		int aCount = 0;

		try {
			for (int i = 0; i < qList.size(); i++) {
				for(int j = 0; j< dsList.get(i).getA().size(); j++) {
					pstmt = conn.prepareStatement("SELECT count(*) FROM RESULT WHERE QNUM = ? AND ANUM =?");
					pstmt.setInt(1, qList.get(i).getqNum());
					pstmt.setInt(2, dsList.get(i).getA().get(j).getaNum());
					
					rs = pstmt.executeQuery();
					
					while(rs.next()) {
						Chart c = new Chart(s.getsNum(), s.getsTitle(), s.getsTarget(), s.getsStartDate(), s.getsEndDate(),qList.get(i).getqNum(), qList.get(i).getqTitle(),
										dsList.get(i).getA().get(j).getaContent(), rs.getInt(1));
						System.out.println(c);
						cList.add(c);
					}
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cList;
	}

	public ArrayList<int[]> checkAnum(Connection conn, ArrayList<Question> qList, ArrayList<Integer> aCount) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<int[]> aList = null;
		try {
			for (int i = 0; i < qList.size(); i++) {
				pstmt = conn.prepareStatement("SELECT DISTINCT * FROM RESULT WHERE QNUM =?");
				pstmt.setInt(1, qList.get(i).getqNum());
				int a = 0;
				while (rs.next()) {
					int[] arr = new int[aCount.size()];
					arr[a] = rs.getInt("anum");
					a++;
					aList.add(arr);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		return aList;
	}

	public ArrayList<Integer> checkaCount(Connection conn, ArrayList<Question> qList) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		ArrayList<Integer> aCount = new ArrayList<Integer>();
		for (int i = 0; i < qList.size(); i++) {
			try {
				pstmt = conn.prepareStatement("SELECT DISTINCT COUNT(*) FROM RESULT WHERE QNUM = ?");
				pstmt.setInt(1, qList.get(i).getqNum());
				rs = pstmt.executeQuery();

				while (rs.next()) {
					int a = rs.getInt(1);
					aCount.add(a);
				}
			} catch (SQLException e) {

				e.printStackTrace();
			}
		}

		return aCount;
	}

	public ArrayList<DoSurvey> checkDS(Connection conn, Survey s, ArrayList<Question> qList) {
		return null;
	}
}
