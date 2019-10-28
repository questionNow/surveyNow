package survey.model.dao;

import java.beans.Statement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import oracle.net.aso.s;

import static common.JDBCTemplate.*;

import survey.model.vo.Answer;
import survey.model.vo.DoSurvey;
import survey.model.vo.Question;
import survey.model.vo.Survey;
import survey.model.vo.SurveyTarget;
import user.model.vo.UserInfo;

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
					"INSERT INTO SURVEY VALUES(SEQ_SURVEY.NEXTVAL, ?, ?, SYSDATE, NULL, ?, ?, ?, 0, 'H', ?, SYSDATE, ?, NULL)");
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
					pstmt = conn.prepareStatement(
							"INSERT INTO ANSWER VALUES(SEQ_ANSWER.NEXTVAL, SEQ_QUESTION.CURRVAL, ?, DEFAULT)");
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
			pstmt = conn.prepareStatement(
					"SELECT * FROM SURVEY WHERE SSTATUS = 'I' AND NOT SUSERID = ? AND (SANSWERID NOT LIKE ? OR SANSWERID IS NULL)");
			pstmt.setString(1, userId);
			pstmt.setString(2, "%" + userId + "%");
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

	public ArrayList<Question> doServeyQ(Connection conn, Survey s) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Question> qList = null;
		try {
			pstmt = conn.prepareStatement("SELECT * FROM QUESTION WHERE SNUM = ?");
			pstmt.setInt(1, s.getsNum());

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
					Answer a = new Answer(rs.getInt("anum"), qList.get(i).getqNum(), rs.getString("acontent"),
							rs.getInt("answercount"));
					;
					a.setaNum(rs.getInt("anum"));

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
			pstmt = conn.prepareStatement("SELECT * FROM SURVEY WHERE SNUM = ? AND SSTATUS = 'I'");
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

		for (int i = 0; i < st.getTargetType().length; i++) {
			String targetDetail = "";
			for (int j = 0; j < st.getTargetDetail().get(i).length; j++) {
				if (j == st.getTargetDetail().get(i).length - 1) {
					targetDetail += st.getTargetDetail().get(i)[j];
				} else {
					targetDetail += st.getTargetDetail().get(i)[j] + ",";
				}
			}
			try {
				pstmt = conn.prepareStatement(
						"INSERT INTO SURVEY_TARGET VALUES(SEQ_SURVEY_TARGET.NEXTVAL, SEQ_SURVEY.CURRVAL, ?, ?)");
				pstmt.setString(1, st.getTargetType()[i]);
				pstmt.setString(2, targetDetail);

				stResult = pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
		}
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
					aList.add(new Answer(rs.getInt("anum"), qList.get(i).getqNum(), rs.getString("acontent"),
							rs.getInt("answercount")));
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return aList;
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

	public int[] recordAnswer(Connection conn, String userId, int sNum, int[] qNum, int[] aNum, String[] aContent) {
		PreparedStatement pstmt = null;
		int[] result = new int[qNum.length];

		try {
			for (int i = 0; i < qNum.length; i++) {
				pstmt = conn.prepareStatement("INSERT INTO RESULT VALUES(SEQ_RESULT.NEXTVAL, ?, ?, ?, ?, SYSDATE)");
				pstmt.setInt(1, aNum[i]);
				pstmt.setInt(2, qNum[i]);
				pstmt.setString(3, userId);
				pstmt.setString(4, aContent[i]);

				result[i] = pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int addAnswerCount(Connection conn, int aNum) {
		PreparedStatement pstmt = null;
		int result = 0;

		try {
			pstmt = conn.prepareStatement("UPDATE ANSWER SET ANSWERCOUNT = (ANSWERCOUNT+1) WHERE ANUM =?");
			pstmt.setInt(1, aNum);

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public void checkTarget(Connection conn, ArrayList<Survey> sList) {

	}

	public int addSurveyCount(Connection conn, int sNum) {
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement("UPDATE SURVEY SET ACOUNT = ACOUNT+1 WHERE SNUM = ?");
			pstmt.setInt(1, sNum);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int checkSurveyCount(Connection conn, int sNum) {
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement("UPDATE SURVEY SET SSTATUS = 'C' WHERE ACOUNT = SCOUNT");
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return result;
	}

	public int recordPoint(Connection conn, Survey survey, String userId) {
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement("INSERT INTO POINT VALUES(SEQ_POINT.NEXTVAL, ?, ?, SYSDATE, ?)");
			pstmt.setString(1, userId);
			pstmt.setInt(2, survey.getsPoint());
			pstmt.setString(3, "설문 참여보상 : \"" + survey.getsTitle() + "\"");
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public Survey selectSurveys(Connection conn, int sNum) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		Survey survey = new Survey();
		try {
			pstmt = conn.prepareStatement("SELECT SPOINT, STITLE FROM SURVEY WHERE SNUM = ?");
			pstmt.setInt(1, sNum);

			rs = pstmt.executeQuery();
			while (rs.next()) {
				survey.setsNum(sNum);
				survey.setsPoint(rs.getInt("spoint"));
				survey.setsTitle(rs.getString("stitle"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		return survey;
	}

	public int addPoint(Connection conn, Survey survey, String userId) {
		PreparedStatement pstmt = null;
		int result = 0;

		try {
			pstmt = conn.prepareStatement("UPDATE USER_INFO SET POINT = POINT+? WHERE USERID=?");
			pstmt.setInt(1, survey.getsPoint());
			pstmt.setString(2, userId);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	public int addAnswerUser(Connection conn, Survey survey, String userId) {
		PreparedStatement pstmt = null;
		int result = 0;

		try {
			pstmt = conn.prepareStatement("UPDATE SURVEY SET SANSWERID = SANSWERID ||' '|| ? where snum =?");
			pstmt.setString(1, userId);
			pstmt.setInt(2, survey.getsNum());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	public int deleteSurvey(Connection conn, int sNum) {
		PreparedStatement pstmt = null;
		int result = 0;

		try {
			pstmt = conn.prepareStatement("UPDATE SURVEY SET SSTATUS = 'D' WHERE SNUM = ?");
			pstmt.setInt(1, sNum);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	public int powerDeleteSurvey(Connection conn, int sNum) {
		PreparedStatement pstmt = null;
		int result = 0;

		try {
			pstmt = conn.prepareStatement("DELETE FROM SURVEY WHERE SNUM =?");
			pstmt.setInt(1, sNum);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	public Survey doServeyS2(Connection conn, int sNum) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Survey s = new Survey();
		try {
			pstmt = conn.prepareStatement("SELECT * FROM SURVEY WHERE SNUM = ? AND NOT SSTATUS = 'D'");
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

	public Survey selectSurvey(Connection conn, int sNum) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		Survey s = null;

		try {
			pstmt = conn.prepareStatement("SELECT * FROM SURVEY WHERE SNUM = ?");
			pstmt.setInt(1, sNum);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				s = new Survey(rs.getInt("snum"), rs.getString("stype"), rs.getString("stitle"), rs.getDate("sstartdt"),
						rs.getDate("senddt"), rs.getInt("scount"), rs.getInt("spoint"), rs.getInt("qCount"),
						rs.getInt("acount"), rs.getString("sstatus"), rs.getString("starget"), rs.getDate("screatedt"),
						rs.getString("suserId"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return s;
	}

	public ArrayList<Question> selectQuestion(Connection conn, Survey s) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		ArrayList<Question> qList = null;

		try {
			pstmt = conn.prepareStatement("SELECT * FROM QUESTION WHERE SNUM = ?");
			pstmt.setInt(1, s.getsNum());
			rs = pstmt.executeQuery();
			qList = new ArrayList<Question>();
			while (rs.next()) {
				qList.add(new Question(rs.getInt("qnum"), s.getsNum(), rs.getString("qtype"), rs.getString("qtitle")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return qList;
	}

	public ArrayList<DoSurvey> modifySurvey(Connection conn, Survey s, ArrayList<Question> qList) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		ArrayList<DoSurvey> dsList = new ArrayList();

		for (int i = 0; i < qList.size(); i++) {
			try {
				pstmt = conn.prepareStatement("SELECT * FROM ANSWER WHERE QNUM = ?");
				pstmt.setInt(1, qList.get(i).getqNum());
				rs = pstmt.executeQuery();
				ArrayList<Answer> aList = new ArrayList<Answer>();
				Question q = new Question(qList.get(i).getqNum(), qList.get(i).getsNum(), qList.get(i).getqType(),
						qList.get(i).getqTitle());
				int aCount = 0;
				while (rs.next()) {
					Answer a = new Answer(rs.getInt("anum"), rs.getInt("qnum"), rs.getString("acontent"),
							rs.getInt("answercount"));
					aCount = rs.getInt("answercount");
					aList.add(a);
				}
				DoSurvey ds = new DoSurvey(s, q, aList, aCount);
				dsList.add(ds);

			} catch (SQLException e) {
				e.printStackTrace();
			}

		}

		return dsList;
	}

	public SurveyTarget selectSurveyTarget(Connection conn, Survey s) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String[] targetType = s.getsTarget().split(",");
		ArrayList<String[]> targetDetail = null;
		SurveyTarget st = new SurveyTarget();
		try {
			pstmt = conn.prepareStatement("SELECT * FROM SURVEY_TARGET WHERE SNUM = ?");
			pstmt.setInt(1, s.getsNum());
			rs = pstmt.executeQuery();
			targetDetail = new ArrayList<String[]>();
			int svNum = 0;
			while(rs.next()) {
				svNum = rs.getInt("svnum");
				String[] targetD = rs.getString("targetdetail").split(",");
				targetDetail.add(targetD);
			}
			st = new SurveyTarget(svNum, s.getsNum(), targetType, targetDetail);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}		
		return st;
	}

	public ArrayList<DoSurvey> modifySurveyTarget(Connection conn, Survey s, ArrayList<Question> qList, SurveyTarget st) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		ArrayList<DoSurvey> dsList = new ArrayList();

		for (int i = 0; i < qList.size(); i++) {
			try {
				pstmt = conn.prepareStatement("SELECT * FROM ANSWER WHERE QNUM = ?");
				pstmt.setInt(1, qList.get(i).getqNum());
				rs = pstmt.executeQuery();
				ArrayList<Answer> aList = new ArrayList<Answer>();
				Question q = new Question(qList.get(i).getqNum(), qList.get(i).getsNum(), qList.get(i).getqType(),
						qList.get(i).getqTitle());
				int aCount = 0;
				while (rs.next()) {
					Answer a = new Answer(rs.getInt("anum"), rs.getInt("qnum"), rs.getString("acontent"),
							rs.getInt("answercount"));
					aCount = rs.getInt("answercount");
					aList.add(a);
				}
				DoSurvey ds = new DoSurvey(s, q, aList, aCount, st);
				dsList.add(ds);

			} catch (SQLException e) {
				e.printStackTrace();
			}

		}

		return dsList;
	}

	public int deleteModifiedAnswer(Connection conn, String[] delQnum) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		try {
			for(int i = 0 ; i< delQnum.length ; i++) {
			pstmt = conn.prepareStatement("DELETE FROM ANSWER WHERE QNUM=?");
			pstmt.setInt(1, Integer.valueOf(delQnum[i]));
			result += pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int deleteModifiedQuestion(Connection conn, String[] delSnum) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement("DELETE FROM QUESTION WHERE SNUM= ?");
			pstmt.setInt(1, Integer.valueOf(delSnum[0]));
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int deleteModifiedSurvey(Connection conn, String[] delSnum) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement("DELETE FROM SURVEY WHERE SNUM= ?");
			pstmt.setInt(1, Integer.valueOf(delSnum[0]));
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public void sortChart(Connection conn, String aContent, int qNum) {
		PreparedStatement pstmt = null;
		
		
	}

	public int purchaseSurvey(Connection conn, String sNums) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String[] sNum = sNums.split(","); 
		System.out.println("길이 : " + sNum.length);
		try {
			for(int i = 0 ; i < sNum.length ; i ++) {
				System.out.println(sNum[i]);
				pstmt = conn.prepareStatement("UPDATE SURVEY SET SSTATUS = 'I' WHERE SNUM =?");
				pstmt.setInt(1,  Integer.valueOf(sNum[i]));
				result = pstmt.executeUpdate();
				
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
	
		return result;
	}

}
