package survey.model.dao;

import static common.JDBCTemplate.close;

import java.sql.Statement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import survey.model.vo.Answer;
import survey.model.vo.DoSurvey;
import survey.model.vo.Question;
import survey.model.vo.SortByType;
import survey.model.vo.Survey;
import survey.model.vo.SurveyTarget;
import survey.model.vo.userType;

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
			System.out.println("살려낸다");
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
		try {
			for (int i = 0; i < qNum.length; i++) {

				pstmt = conn.prepareStatement(
						"INSERT INTO QUESTION VALUES(SEQ_QUESTION.NEXTVAL, SEQ_SURVEY.CURRVAL, ?, ?)");
				pstmt.setString(1, qType[i]);
				pstmt.setString(2, qTitle[i]);
				qResult = pstmt.executeUpdate();
				String[] ans = new String[answer.get(i).length];
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
			String targetDetail = "";
			for (int j = 0; j < st.getTargetDetail().get(0).length; j++) {
				if (j == st.getTargetDetail().get(0).length - 1) {
					targetDetail += st.getTargetDetail().get(0)[j];
				} else {
					targetDetail += st.getTargetDetail().get(0)[j] + ",";
				}
			}
			try {
				pstmt = conn.prepareStatement(
						"INSERT INTO SURVEY_TARGET VALUES(SEQ_SURVEY_TARGET.NEXTVAL, SEQ_SURVEY.CURRVAL, ?, ?)");
				pstmt.setString(1, st.getTargetType()[0]);
				pstmt.setString(2, targetDetail);

				stResult = pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
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

	public ArrayList<SurveyTarget> selectSurveyTarget(Connection conn, Survey s) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		if (s.getsTarget() != null) {
			String[] targetType = s.getsTarget().split(",");
			ArrayList<String[]> targetDetail = null;
			SurveyTarget st = new SurveyTarget();
			ArrayList<SurveyTarget> stList = new ArrayList<SurveyTarget>();
			try {
				pstmt = conn.prepareStatement("SELECT * FROM SURVEY_TARGET WHERE SNUM = ?");
				pstmt.setInt(1, s.getsNum());
				rs = pstmt.executeQuery();
				targetDetail = new ArrayList<String[]>();
				int svNum = 0;
				while (rs.next()) {
					svNum = rs.getInt("svnum");
					String[] targetD = rs.getString("targetdetail").split(",");
					targetDetail.add(targetD);
					stList.add(new SurveyTarget(svNum, s.getsNum(), targetType, targetDetail));
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
				close(rs);
			}
			return stList;
		}
		return null;
	}

	public ArrayList<DoSurvey> modifySurveyTarget(Connection conn, Survey s, ArrayList<Question> qList,
			ArrayList<SurveyTarget> stList) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		ArrayList<DoSurvey> dsList = new ArrayList();

			try {
				for (int i = 0; i < qList.size(); i++) {
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
				DoSurvey ds = new DoSurvey(s, q, aList, aCount, stList.get(0));
				dsList.add(ds);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}

		return dsList;
	}

	public int deleteModifiedAnswer(Connection conn, String[] delQnum) {
		PreparedStatement pstmt = null;
		int result = 0;

		try {
			for (int i = 0; i < delQnum.length; i++) {
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
			for (int i = 0; i < sNum.length; i++) {
				System.out.println(sNum[i]);
				pstmt = conn.prepareStatement("UPDATE SURVEY SET SSTATUS = 'P' WHERE SNUM =?");
				pstmt.setInt(1, Integer.valueOf(sNum[i]));
				result = pstmt.executeUpdate();

			}
		} catch (SQLException e) {

			e.printStackTrace();
		}

		return result;
	}

	public Survey targetCheck(Connection conn, int sNum) {
		PreparedStatement pstmt = null;

		return null;
	}

	public ArrayList<Survey> checkSurveys(Connection conn, ArrayList<Survey> sList, String userId) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Survey> stList = new ArrayList<Survey>();

		System.out.println(sList);
		try {
			for (int i = 0; i < sList.size(); i++) {
				if (sList.get(i).getsTarget() == null) {
					stList.add(sList.get(i));
					continue;
				} else {
					String[] targetNames = sList.get(i).getsTarget().split(",");
					for (int j = 0; j < sList.get(i).getsTarget().split(",").length; j++) {
						String query = "SELECT " + sList.get(i).getsTarget().split(",")[j]
								+ " FROM USER_INFO WHERE USERID =" + userId.toLowerCase();
						String targetName = targetNames[j];
						pstmt = conn.prepareStatement("SELECT " + sList.get(i).getsTarget().split(",")[j]
								+ " FROM USER_INFO WHERE USERID = ? ");
						pstmt.setString(1, userId);
						rs = pstmt.executeQuery();

						while (rs.next()) {
							if ((sList.get(i).getsTarget()).contains(rs.getString(targetName))) {
								stList.add(sList.get(i));
							}
						}
					}
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return stList;
	}

	public ArrayList<Survey> checkSurveys2(Connection conn, ArrayList<Survey> sList, String userId) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Survey> stList = new ArrayList<Survey>();
		System.out.println("dao = " + sList);
		try {
			for (int i = 0; i < sList.size(); i++) {
				System.out.println("survey 넘버 : " + sList.get(i).getsNum());
				boolean check = false;
				ArrayList<SurveyTarget> sTarget = new SurveyDao().selectSurveyTarget(conn, sList.get(i));
				if (sTarget != null) {
					for (int k = 0; k < sTarget.size(); k++) {
						if (sList.get(i).getsTarget() == null) {
							System.out.println("Null일 경우");
							stList.add(sList.get(i));
						} else {
							String[] targetNames = sList.get(i).getsTarget().split(",");
							for (int j = 0; j < sTarget.get(k).getTargetDetail().size(); j++) {
								String userDetail = "";
								pstmt = conn.prepareStatement("SELECT " + sTarget.get(k).getTargetType()[j]
										+ " FROM USER_INFO WHERE USERID = ? ");
								pstmt.setString(1, userId);
								rs = pstmt.executeQuery();
								while (rs.next()) {
									userDetail = rs.getString(targetNames[j]);
									System.out.println("유저 디테일 : " + userDetail);
								}
								for (int n = 0; n < sTarget.get(k).getTargetDetail().get(j).length; n++) {
									System.out.println("디테일 값 : " + sTarget.get(k).getTargetDetail().get(j)[n]);
									if (sTarget.get(k).getTargetDetail().get(j)[n].equals(userDetail)) {
										check = true;
									}
								}
								System.out.println(check);
							}
						}
					}
				}
				if (check) {
					System.out.println("survey 넘버 : " + sList.get(i).getsNum());
					stList.add(sList.get(i));
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return stList;
	}

	public ArrayList<SortByType> sortByType(Connection conn, int qNum, String aContent) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String[] userTypes = userType.userTypes();
		HashMap<String, String[]> typeList = userType.checkSurveys();
		ArrayList<SortByType> sbtList = new ArrayList<SortByType>();

		try {
			for (int i = 0; i < userTypes.length; i++) {
				String[] typeDetail = new String[typeList.get(userTypes[i]).length];
				int[] typeDetailCount = new int[typeList.get(userTypes[i]).length];
				for (int j = 0; j < typeList.get(userTypes[i]).length; j++) {

					String[] arr = typeList.get(userTypes[i]);
					pstmt = conn.prepareStatement("SELECT COUNT(?) FROM CHATLIST WHERE QNUM = ? AND RTEXT = ?");
					pstmt.setString(1, arr[j]);
					pstmt.setInt(2, qNum);
					pstmt.setString(3, aContent);
					System.out.println(aContent);

					rs = pstmt.executeQuery();
					while (rs.next()) {
						typeDetail[j] = arr[j];
						typeDetailCount[j] = rs.getInt(1);
					}

				}
				sbtList.add(new SortByType(userTypes[i], typeDetail, typeDetailCount));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		return sbtList;
	}

	public void updateSurveyCount(Connection conn, String userId) {
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement("UPDATE USER_INFO SET SURVEYCOUNT = SURVEYCOUNT + 1 WHERE USERID = ?");
			pstmt.setString(1, userId);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	public ArrayList<Survey> selectWaitingSurvey(Connection conn, String userId) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		ArrayList<Survey> sList = null;
		try {
			pstmt = conn.prepareStatement("SELECT * FROM SURVEY WHERE SUSERID =? AND SSTATUS ='P'");
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

	// 전제 설문 리스트 조회 dao
	public ArrayList<Survey> allSurvey(Connection conn) {
		Statement stmt = null;
		ResultSet rs = null;
		ArrayList<Survey> list = null;

		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery("SELECT * FROM SURVEY ORDER BY SNUM");

			list = new ArrayList<Survey>();

			while (rs.next()) {
				Survey s = new Survey(rs.getInt("snum"), rs.getString("stype"), rs.getString("stitle"),
						rs.getDate("senddt"), rs.getDate("sstartdt"), rs.getInt("scount"), rs.getInt("spoint"),
						rs.getInt("qcount"), rs.getInt("scount"), rs.getString("sstatus"), rs.getString("starget"),
						rs.getDate("screatedt"), rs.getString("suserid"));

				list.add(s);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(stmt);
		}

		return list;
	}

	// 완료 설문 리스트 조회 dao
	public ArrayList<Survey> compSurvey(Connection conn) {
		Statement stmt = null;
		ResultSet rs = null;
		ArrayList<Survey> list = null;

		try {
			stmt = (Statement) conn.createStatement();
			rs = ((java.sql.Statement) stmt).executeQuery("SELECT * FROM SURVEY WHERE SSTATUS ='C'");

			list = new ArrayList<Survey>();

			while (rs.next()) {
				Survey s = new Survey(rs.getInt("snum"), rs.getString("stype"), rs.getString("stitle"),
						rs.getDate("senddt"), rs.getDate("sstartdt"), rs.getInt("scount"), rs.getInt("spoint"),
						rs.getInt("qcount"), rs.getInt("scount"), rs.getString("sstatus"), rs.getString("starget"),
						rs.getDate("screatedt"), rs.getString("suserid"));

				list.add(s);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(stmt);
		}
		// System.out.println("dao에서의 list : " + list);
		return list;

	}

	// 진행 중인 설문 리스트 조회 dao
	public ArrayList<Survey> getProcList(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		ArrayList<Survey> list = null;

		try {
			pstmt = conn.prepareStatement("SELECT * FROM SURVEY WHERE SSTATUS='I'");
			rs = pstmt.executeQuery();

			list = new ArrayList<Survey>();

			while (rs.next()) {
				Survey s = new Survey(rs.getInt("snum"), rs.getString("stype"), rs.getString("stitle"),
						rs.getDate("senddt"), rs.getDate("sstartdt"), rs.getInt("scount"), rs.getInt("spoint"),
						rs.getInt("qcount"), rs.getInt("scount"), rs.getString("sstatus"), rs.getString("starget"),
						rs.getDate("screatedt"), rs.getString("suserid"));

				list.add(s);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		return list;
	}

	// 결제 대기 설문 리스트 조회 dao
	public ArrayList<Survey> getHoldList(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		ArrayList<Survey> list = null;

		try {
			pstmt = conn.prepareStatement("SELECT * FROM SURVEY WHERE SSTATUS='H'");
			rs = pstmt.executeQuery();

			list = new ArrayList<Survey>();
			while (rs.next()) {
				Survey s = new Survey(rs.getInt("snum"), rs.getString("stype"), rs.getString("stitle"),
						rs.getDate("senddt"), rs.getDate("sstartdt"), rs.getInt("scount"), rs.getInt("spoint"),
						rs.getInt("qcount"), rs.getInt("scount"), rs.getString("sstatus"), rs.getString("starget"),
						rs.getDate("screatedt"), rs.getString("suserid"));

				list.add(s);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}

		return list;
	}

	public int getMaleStats(Connection conn, String value, int qnum) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		int MaleStats = 0;

		try {
			pstmt = conn.prepareStatement(
					"SELECT COUNT(*) FROM RESULT, USER_INFO WHERE RUSERID = USERID AND QNUM =? AND RTEXT=? AND GENDER='남자'");
			pstmt.setInt(1, qnum);
			pstmt.setString(2, value);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				MaleStats = rs.getInt(1);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		return MaleStats;
	}

	public int getFemaleStats(Connection conn, String value, int qnum) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int FemaleStats = 0;

		try {
			pstmt = conn.prepareStatement(
					"SELECT COUNT(*) FROM RESULT, USER_INFO WHERE RUSERID = USERID AND QNUM =? AND RTEXT=? AND GENDER='여자'");
			pstmt.setInt(1, qnum);
			pstmt.setString(2, value);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				FemaleStats = rs.getInt(1);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		return FemaleStats;
	}

	public int getElementStats(Connection conn, String value, int qnum) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int ElementStats = 0;
		try {
			pstmt = conn.prepareStatement(
					"SELECT COUNT(*) FROM RESULT, USER_INFO WHERE RUSERID = USERID AND QNUM =? AND RTEXT=? AND FINAL_EDUCATION='초등학교 졸업'");
			pstmt.setInt(1, qnum);
			pstmt.setString(2, value);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				ElementStats = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		return ElementStats;
	}

	public int getMiddelStats(Connection conn, String value, int qnum) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int MiddleStats = 0;
		try {
			pstmt = conn.prepareStatement(
					"SELECT COUNT(*) FROM RESULT, USER_INFO WHERE RUSERID = USERID AND QNUM =?	 AND RTEXT=? AND FINAL_EDUCATION='중학교 졸업'");
			pstmt.setInt(1, qnum);
			pstmt.setString(2, value);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				MiddleStats = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		return MiddleStats;
	}

	public int getHighStats(Connection conn, String value, int qnum) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int HighStats = 0;
		try {
			pstmt = conn.prepareStatement(
					"SELECT COUNT(*) FROM RESULT, USER_INFO WHERE RUSERID = USERID AND QNUM =? AND RTEXT=? AND FINAL_EDUCATION='고등학교 졸업'");
			pstmt.setInt(1, qnum);
			pstmt.setString(2, value);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				HighStats = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		return HighStats;
	}

	public int getCollegeStats(Connection conn, String value, int qnum) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int CollegeStats = 0;
		try {
			pstmt = conn.prepareStatement(
					"SELECT COUNT(*) FROM RESULT, USER_INFO WHERE RUSERID = USERID AND QNUM =? AND RTEXT=? AND FINAL_EDUCATION='2·3년제 대학교 졸업'");
			pstmt.setInt(1, qnum);
			pstmt.setString(2, value);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				CollegeStats = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		return CollegeStats;
	}

	public int getUniversityStats(Connection conn, String value, int qnum) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int UniversityStats = 0;
		try {
			pstmt = conn.prepareStatement(
					"SELECT COUNT(*) FROM RESULT, USER_INFO WHERE RUSERID = USERID AND QNUM =? AND RTEXT=? AND FINAL_EDUCATION='4년제 대학교 졸업'");
			pstmt.setInt(1, qnum);
			pstmt.setString(2, value);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				UniversityStats = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		return UniversityStats;
	}

	public int getMasterStats(Connection conn, String value, int qnum) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int MasterStats = 0;
		try {
			pstmt = conn.prepareStatement(
					"SELECT COUNT(*) FROM RESULT, USER_INFO WHERE RUSERID = USERID AND QNUM =? AND RTEXT=? AND FINAL_EDUCATION='석사학위 졸업'");
			pstmt.setInt(1, qnum);
			pstmt.setString(2, value);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				MasterStats = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		return MasterStats;
	}

	public int getDoctorMasterStats(Connection conn, String value, int qnum) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int DoctorStats = 0;
		try {
			pstmt = conn.prepareStatement(
					"SELECT COUNT(*) FROM RESULT, USER_INFO WHERE RUSERID = USERID AND QNUM =? AND RTEXT=? AND FINAL_EDUCATION='박사학위 취득'");
			pstmt.setInt(1, qnum);
			pstmt.setString(2, value);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				DoctorStats = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		return DoctorStats;

	}

	public int getUnemployedStats(Connection conn, String value, int qnum) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int UnemployedStats = 0;
		try {
			pstmt = conn.prepareStatement(
					"SELECT COUNT(*) FROM RESULT, USER_INFO WHERE RUSERID = USERID AND QNUM =? AND RTEXT=? AND JOB='무직'");
			pstmt.setInt(1, qnum);
			pstmt.setString(2, value);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				UnemployedStats = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		return UnemployedStats;
	}

	public int getStudentStats(Connection conn, String value, int qnum) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int StudentStats = 0;
		try {
			pstmt = conn.prepareStatement(
					"SELECT COUNT(*) FROM RESULT, USER_INFO WHERE RUSERID = USERID AND QNUM =? AND RTEXT=? AND JOB='학생'");
			pstmt.setInt(1, qnum);
			pstmt.setString(2, value);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				StudentStats = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		return StudentStats;
	}

	public int getSelfStats(Connection conn, String value, int qnum) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int SelfStats = 0;
		try {
			pstmt = conn.prepareStatement(
					"SELECT COUNT(*) FROM RESULT, USER_INFO WHERE RUSERID = USERID AND QNUM =? AND RTEXT=? AND JOB='자영업'");
			pstmt.setInt(1, qnum);
			pstmt.setString(2, value);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				SelfStats = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		return SelfStats;
	}

	public int getOfficeStats(Connection conn, String value, int qnum) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int OfficeStats = 0;
		try {
			pstmt = conn.prepareStatement(
					"SELECT COUNT(*) FROM RESULT, USER_INFO WHERE RUSERID = USERID AND QNUM =? AND RTEXT=? AND JOB='사무직'");
			pstmt.setInt(1, qnum);
			pstmt.setString(2, value);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				OfficeStats = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		return OfficeStats;
	}

	public int getServiceStats(Connection conn, String value, int qnum) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int ServiceStats = 0;
		try {
			pstmt = conn.prepareStatement(
					"SELECT COUNT(*) FROM RESULT, USER_INFO WHERE RUSERID = USERID AND QNUM =? AND RTEXT=? AND JOB='판메/서비스직'");
			pstmt.setInt(1, qnum);
			pstmt.setString(2, value);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				ServiceStats = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		return ServiceStats;
	}

	public int getTechnicalStats(Connection conn, String value, int qnum) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int TechnicalStats = 0;
		try {
			pstmt = conn.prepareStatement(
					"SELECT COUNT(*) FROM RESULT, USER_INFO WHERE RUSERID = USERID AND QNUM =? AND RTEXT=? AND JOB='생산/기술직'");
			pstmt.setInt(1, qnum);
			pstmt.setString(2, value);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				TechnicalStats = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		return TechnicalStats;
	}

	public int getArtStats(Connection conn, String value, int qnum) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int ArtStats = 0;
		try {
			pstmt = conn.prepareStatement(
					"SELECT COUNT(*) FROM RESULT, USER_INFO WHERE RUSERID = USERID AND QNUM =? AND RTEXT=? AND JOB='전문/예술직'");
			pstmt.setInt(1, qnum);
			pstmt.setString(2, value);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				ArtStats = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		return ArtStats;
	}

	public int getManagementStats(Connection conn, String value, int qnum) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int ManagementStats = 0;
		try {
			pstmt = conn.prepareStatement(
					"SELECT COUNT(*) FROM RESULT, USER_INFO WHERE RUSERID = USERID AND QNUM =? AND RTEXT=? AND JOB='경영/관리직'");
			pstmt.setInt(1, qnum);
			pstmt.setString(2, value);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				ManagementStats = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		return ManagementStats;
	}

	public int getLiveStockStats(Connection conn, String value, int qnum) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int LiveStockStats = 0;
		try {
			pstmt = conn.prepareStatement(
					"SELECT COUNT(*) FROM RESULT, USER_INFO WHERE RUSERID = USERID AND QNUM =? AND RTEXT=? AND JOB='농/어/축산업'");
			pstmt.setInt(1, qnum);
			pstmt.setString(2, value);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				LiveStockStats = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		return LiveStockStats;
	}

	public int getEctStats(Connection conn, String value, int qnum) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int EctStats = 0;
		try {
			pstmt = conn.prepareStatement(
					"SELECT COUNT(*) FROM RESULT, USER_INFO WHERE RUSERID = USERID AND QNUM =? AND RTEXT=? AND JOB='기타'");
			pstmt.setInt(1, qnum);
			pstmt.setString(2, value);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				EctStats = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}

		return EctStats;
	}

	public int getTwoHlessStats(Connection conn, String value, int qnum) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int TwoHlessStats = 0;
		try {
			pstmt = conn.prepareStatement(
					"SELECT COUNT(*) FROM RESULT, USER_INFO WHERE RUSERID = USERID AND QNUM =? AND RTEXT=? AND INCOME='200만원 이하'");
			pstmt.setInt(1, qnum);
			pstmt.setString(2, value);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				TwoHlessStats = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}

		return TwoHlessStats;
	}

	public int getFourHlessStats(Connection conn, String value, int qnum) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int FourHlessStats = 0;
		try {
			pstmt = conn.prepareStatement(
					"SELECT COUNT(*) FROM RESULT, USER_INFO WHERE RUSERID = USERID AND QNUM =? AND RTEXT=? AND INCOME='200만원~400만원 이하'");
			pstmt.setInt(1, qnum);
			pstmt.setString(2, value);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				FourHlessStats = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}

		return FourHlessStats;
	}

	public int getSixHlessStats(Connection conn, String value, int qnum) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int SixHlessStats = 0;
		try {
			pstmt = conn.prepareStatement(
					"SELECT COUNT(*) FROM RESULT, USER_INFO WHERE RUSERID = USERID AND QNUM =? AND RTEXT=? AND INCOME='400~600만원 이하'");
			pstmt.setInt(1, qnum);
			pstmt.setString(2, value);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				SixHlessStats = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}

		return SixHlessStats;
	}

	public int getSixHmoreStats(Connection conn, String value, int qnum) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int SixHmoreStats = 0;
		try {
			pstmt = conn.prepareStatement(
					"SELECT COUNT(*) FROM RESULT, USER_INFO WHERE RUSERID = USERID AND QNUM =? AND RTEXT=? AND INCOME='600만원 이상'");
			pstmt.setInt(1, qnum);
			pstmt.setString(2, value);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				SixHmoreStats = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}

		return SixHmoreStats;
	}

	public int getMonthlyStats(Connection conn, String value, int qnum) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int MonthlyStats = 0;
		try {
			pstmt = conn.prepareStatement(
					"SELECT COUNT(*) FROM RESULT, USER_INFO WHERE RUSERID = USERID AND QNUM =? AND RTEXT=? AND LIVING_TYPE='월세'");
			pstmt.setInt(1, qnum);
			pstmt.setString(2, value);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				MonthlyStats = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}

		return MonthlyStats;
	}

	public int getCharterStats(Connection conn, String value, int qnum) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int CharterStats = 0;
		try {
			pstmt = conn.prepareStatement(
					"SELECT COUNT(*) FROM RESULT, USER_INFO WHERE RUSERID = USERID AND QNUM =? AND RTEXT=? AND LIVING_TYPE='전세'");
			pstmt.setInt(1, qnum);
			pstmt.setString(2, value);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				CharterStats = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}

		return CharterStats;
	}

	public int getOnesStats(Connection conn, String value, int qnum) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int OnesStats = 0;
		try {
			pstmt = conn.prepareStatement(
					"SELECT COUNT(*) FROM RESULT, USER_INFO WHERE RUSERID = USERID AND QNUM =? AND RTEXT=? AND LIVING_TYPE='자가'");
			pstmt.setInt(1, qnum);
			pstmt.setString(2, value);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				OnesStats = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}

		return OnesStats;
	}

	public int getLivingEctStats(Connection conn, String value, int qnum) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int LivingEctStats = 0;
		try {
			pstmt = conn.prepareStatement(
					"SELECT COUNT(*) FROM RESULT, USER_INFO WHERE RUSERID = USERID AND QNUM =? AND RTEXT=? AND LIVING_TYPE='기타'");
			pstmt.setInt(1, qnum);
			pstmt.setString(2, value);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				LivingEctStats = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}

		return LivingEctStats;
	}

	public int getSingleHsStats(Connection conn, String value, int qnum) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int SingleStats = 0;
		try {
			pstmt = conn.prepareStatement(
					"SELECT COUNT(*) FROM RESULT, USER_INFO WHERE RUSERID = USERID AND QNUM =? AND RTEXT=? AND HOUSE_TYPE='단독 주택'");
			pstmt.setInt(1, qnum);
			pstmt.setString(2, value);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				SingleStats = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}

		return SingleStats;
	}

	public int getMultiHsStats(Connection conn, String value, int qnum) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int MultiStats = 0;
		try {
			pstmt = conn.prepareStatement(
					"SELECT COUNT(*) FROM RESULT, USER_INFO WHERE RUSERID = USERID AND QNUM =? AND RTEXT=? AND HOUSE_TYPE='다세대 주택'");
			pstmt.setInt(1, qnum);
			pstmt.setString(2, value);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				MultiStats = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}

		return MultiStats;
	}

	public int getApartmentStats(Connection conn, String value, int qnum) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int ApartmentStats = 0;
		try {
			pstmt = conn.prepareStatement(
					"SELECT COUNT(*) FROM RESULT, USER_INFO WHERE RUSERID = USERID AND QNUM =? AND RTEXT=? AND HOUSE_TYPE='아파트'");
			pstmt.setInt(1, qnum);
			pstmt.setString(2, value);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				ApartmentStats = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}

		return ApartmentStats;
	}

	public int getHouseEctStats(Connection conn, String value, int qnum) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int HouseEctStats = 0;
		try {
			pstmt = conn.prepareStatement(
					"SELECT COUNT(*) FROM RESULT, USER_INFO WHERE RUSERID = USERID AND QNUM =? AND RTEXT=? AND HOUSE_TYPE='기타'");
			pstmt.setInt(1, qnum);
			pstmt.setString(2, value);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				HouseEctStats = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}

		return HouseEctStats;
	}

	public int getNoneReliStats(Connection conn, String value, int qnum) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int NoneReliStats = 0;
		try {
			pstmt = conn.prepareStatement(
					"SELECT COUNT(*) FROM RESULT, USER_INFO WHERE RUSERID = USERID AND QNUM =? AND RTEXT=? AND RELIGION='무교'");
			pstmt.setInt(1, qnum);
			pstmt.setString(2, value);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				NoneReliStats = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}

		return NoneReliStats;

	}

	public int getChristianStats(Connection conn, String value, int qnum) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int ChristianStats = 0;
		try {
			pstmt = conn.prepareStatement(
					"SELECT COUNT(*) FROM RESULT, USER_INFO WHERE RUSERID = USERID AND QNUM =? AND RTEXT=? AND RELIGION='기독교'");
			pstmt.setInt(1, qnum);
			pstmt.setString(2, value);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				ChristianStats = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}

		return ChristianStats;
	}

	public int getBuddhismStats(Connection conn, String value, int qnum) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int BuddhismStats = 0;
		try {
			pstmt = conn.prepareStatement(
					"SELECT COUNT(*) FROM RESULT, USER_INFO WHERE RUSERID = USERID AND QNUM =? AND RTEXT=? AND RELIGION='불교'");
			pstmt.setInt(1, qnum);
			pstmt.setString(2, value);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				BuddhismStats = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}

		return BuddhismStats;
	}

	public int getCatholicStats(Connection conn, String value, int qnum) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int CatholicStats = 0;
		try {
			pstmt = conn.prepareStatement(
					"SELECT COUNT(*) FROM RESULT, USER_INFO WHERE RUSERID = USERID AND QNUM =? AND RTEXT=? AND RELIGION='천주교'");
			pstmt.setInt(1, qnum);
			pstmt.setString(2, value);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				CatholicStats = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}

		return CatholicStats;
	}

	public int getReliEctStats(Connection conn, String value, int qnum) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int ReliEctStats = 0;
		try {
			pstmt = conn.prepareStatement(
					"SELECT COUNT(*) FROM RESULT, USER_INFO WHERE RUSERID = USERID AND QNUM =? AND RTEXT=? AND RELIGION='기타'");
			pstmt.setInt(1, qnum);
			pstmt.setString(2, value);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				ReliEctStats = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}

		return ReliEctStats;
	}

	public int getSingleStats(Connection conn, String value, int qnum) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int SingleStats = 0;
		try {
			pstmt = conn.prepareStatement(
					"SELECT COUNT(*) FROM RESULT, USER_INFO WHERE RUSERID = USERID AND QNUM =? AND RTEXT=? AND MARITAL_STATUS='미혼'");
			pstmt.setInt(1, qnum);
			pstmt.setString(2, value);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				SingleStats = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}

		return SingleStats;
	}

	public int getMarriedStats(Connection conn, String value, int qnum) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int MarriedStats = 0;
		try {
			pstmt = conn.prepareStatement(
					"SELECT COUNT(*) FROM RESULT, USER_INFO WHERE RUSERID = USERID AND QNUM =? AND RTEXT=? AND MARITAL_STATUS='기혼'");
			pstmt.setInt(1, qnum);
			pstmt.setString(2, value);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				MarriedStats = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}

		return MarriedStats;
	}

	public int getZeroStats(Connection conn, String value, int qnum) {
		// TODO Auto-generated method stub
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int ZeroStats = 0;
		try {
			pstmt = conn.prepareStatement(
					"SELECT COUNT(*) FROM RESULT, USER_INFO WHERE RUSERID = USERID AND QNUM =? AND RTEXT=? AND LIVING_WITH='0명'");
			pstmt.setInt(1, qnum);
			pstmt.setString(2, value);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				ZeroStats = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}

		return ZeroStats;

	}

	public int getOneStats(Connection conn, String value, int qnum) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int OneStats = 0;
		try {
			pstmt = conn.prepareStatement(
					"SELECT COUNT(*) FROM RESULT, USER_INFO WHERE RUSERID = USERID AND QNUM =? AND RTEXT=? AND LIVING_WITH='1명'");
			pstmt.setInt(1, qnum);
			pstmt.setString(2, value);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				OneStats = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}

		return OneStats;
	}

	public int getTwoStats(Connection conn, String value, int qnum) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int TwoStats = 0;
		try {
			pstmt = conn.prepareStatement(
					"SELECT COUNT(*) FROM RESULT, USER_INFO WHERE RUSERID = USERID AND QNUM =? AND RTEXT=? AND LIVING_WITH='2명'");
			pstmt.setInt(1, qnum);
			pstmt.setString(2, value);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				TwoStats = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}

		return TwoStats;
	}

	public int getThreeStats(Connection conn, String value, int qnum) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int ThreeStats = 0;
		try {
			pstmt = conn.prepareStatement(
					"SELECT COUNT(*) FROM RESULT, USER_INFO WHERE RUSERID = USERID AND QNUM =? AND RTEXT=? AND LIVING_WITH='3명'");
			pstmt.setInt(1, qnum);
			pstmt.setString(2, value);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				ThreeStats = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}

		return ThreeStats;
	}

	public int getFourStats(Connection conn, String value, int qnum) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int FourStats = 0;
		try {
			pstmt = conn.prepareStatement(
					"SELECT COUNT(*) FROM RESULT, USER_INFO WHERE RUSERID = USERID AND QNUM =? AND RTEXT=? AND LIVING_WITH='4명'");
			pstmt.setInt(1, qnum);
			pstmt.setString(2, value);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				FourStats = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}

		return FourStats;
	}

	public int getFiveStats(Connection conn, String value, int qnum) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int FiveStats = 0;
		try {
			pstmt = conn.prepareStatement(
					"SELECT COUNT(*) FROM RESULT, USER_INFO WHERE RUSERID = USERID AND QNUM =? AND RTEXT=? AND LIVING_WITH='5명'");
			pstmt.setInt(1, qnum);
			pstmt.setString(2, value);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				FiveStats = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}

		return FiveStats;
	}

	public int getSixMStats(Connection conn, String value, int qnum) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int SixMStats = 0;
		try {
			pstmt = conn.prepareStatement(
					"SELECT COUNT(*) FROM RESULT, USER_INFO WHERE RUSERID = USERID AND QNUM =? AND RTEXT=? AND LIVING_WITH='6명 이상'");
			pstmt.setInt(1, qnum);
			pstmt.setString(2, value);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				SixMStats = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}

		return SixMStats;
	}

	public int getMilitaryPen(Connection conn, String value, int qnum) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int MilitaryPen = 0;
		try {
			pstmt = conn.prepareStatement(
					"SELECT COUNT(*) FROM RESULT, USER_INFO WHERE RUSERID = USERID AND QNUM =? AND RTEXT=? AND ARMY_GO='군필'");
			pstmt.setInt(1, qnum);
			pstmt.setString(2, value);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				MilitaryPen = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}

		return MilitaryPen;
	}

	public int getMifill(Connection conn, String value, int qnum) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int Mifill = 0;
		try {
			pstmt = conn.prepareStatement(
					"SELECT COUNT(*) FROM RESULT, USER_INFO WHERE RUSERID = USERID AND QNUM =? AND RTEXT=? AND ARMY_GO='미필'");
			pstmt.setInt(1, qnum);
			pstmt.setString(2, value);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				Mifill = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}

		return Mifill;
	}

	public int getExemption(Connection conn, String value, int qnum) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int Exemption = 0;
		try {
			pstmt = conn.prepareStatement(
					"SELECT COUNT(*) FROM RESULT, USER_INFO WHERE RUSERID = USERID AND QNUM =? AND RTEXT=? AND ARMY_GO='면제'");
			pstmt.setInt(1, qnum);
			pstmt.setString(2, value);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				Exemption = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}

		return Exemption;
	}

	public int adminMakeSurvey(Connection conn, Survey s) {
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

	public int adminMakeSurveyTarget(Connection conn, SurveyTarget st) {
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

	public int adminMakeQuestion(Connection conn, String[] qNum, String[] qType, String[] qTitle,
			ArrayList<String[]> answer) {
		PreparedStatement pstmt = null;
		int qResult = 0;
		int aResult = 0;
		try {
			for (int i = 0; i < qNum.length; i++) {

				pstmt = conn.prepareStatement(
						"INSERT INTO QUESTION VALUES(SEQ_QUESTION.NEXTVAL, SEQ_SURVEY.CURRVAL, ?, ?)");
				pstmt.setString(1, qType[i]);
				pstmt.setString(2, qTitle[i]);
				qResult = pstmt.executeUpdate();
				String[] ans = new String[answer.get(i).length];
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

	public ArrayList<DoSurvey> adminModifySurveyTarget(Connection conn, Survey s, ArrayList<Question> qList,
			ArrayList<SurveyTarget> stList) {
			PreparedStatement pstmt = null;
			ResultSet rs = null;

			ArrayList<DoSurvey> dsList = new ArrayList();

				try {
					for (int i = 0; i < qList.size(); i++) {
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
					DoSurvey ds = new DoSurvey(s, q, aList, aCount, stList.get(0));
					dsList.add(ds);
					}
				} catch (SQLException e) {
					e.printStackTrace();
				}

			return dsList;
		}

	public ArrayList<DoSurvey> adminModifySurvey(Connection conn, Survey s, ArrayList<Question> qList) {
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


}