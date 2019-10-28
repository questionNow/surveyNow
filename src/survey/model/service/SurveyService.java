package survey.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import survey.model.dao.SurveyDao;
import survey.model.vo.Answer;
import survey.model.vo.DoSurvey;
import survey.model.vo.Question;
import survey.model.vo.Survey;
import survey.model.vo.SurveyTarget;
import user.model.vo.UserInfo;

public class SurveyService {

	public ArrayList<Survey> selectHoldSurvey(String userId) {
		Connection conn = getConnection();

		ArrayList<Survey> sList = new SurveyDao().selectHoldSurvey(conn, userId);

		close(conn);
		return sList;
	}

	public ArrayList<Survey> selectDeletedSurvey(String userId) {
		Connection conn = getConnection();

		ArrayList<Survey> sList = new SurveyDao().selectDeletedSurvey(conn, userId);

		close(conn);
		return sList;
	}

	public int reviveSurvey(int sNum) {
		Connection conn = getConnection();

		int result = new SurveyDao().reviveSurvey(conn, sNum);

		close(conn);

		return result;
	}

	public ArrayList<Survey> selectIngSurvey(String userId) {
		Connection conn = getConnection();
		ArrayList<Survey> sList = new SurveyDao().selectIngSurvey(conn, userId);

		close(conn);
		return sList;
	}

	public ArrayList<Survey> selectFinishedSurvey(String userId) {
		Connection conn = getConnection();

		ArrayList<Survey> sList = new SurveyDao().selectFinishedSurvey(conn, userId);

		close(conn);
		return sList;
	}

	public ArrayList<Survey> selectPurchaseSurvey(String userId) {
		Connection conn = getConnection();

		ArrayList<Survey> sList = new SurveyDao().selectPurchaseSurvey(conn, userId);

		close(conn);
		return sList;
	}

	public int checkSNum() {
		Connection conn = getConnection();

		int sNum = new SurveyDao().checkSNum(conn);

		close(conn);
		return sNum;
	}

	public int makeSurvey(Survey s, SurveyTarget st, String[] qNum, String[] qType, String[] qTitle,
			ArrayList<String[]> answer) {
		Connection conn = getConnection();
		SurveyDao sDao = new SurveyDao();
		int result = sDao.makeSurvey(conn, s);
		if (result > 0) {
			if (st != null) {
				int result1 = sDao.makeSurveyTarget(conn, st);
			}
			int result2 = sDao.makeQuestion(conn, qNum, qType, qTitle, answer);
			if (result2 > 0) {
				
			}
			commit(conn);
		}
		
		close(conn);
		return result;
	}

	public ArrayList<Survey> selectSurveys(String userId) {
		Connection conn = getConnection();
		SurveyDao sDao = new SurveyDao();
		ArrayList<Survey> sList = sDao.selectSurveys(conn, userId);
		ArrayList<Survey> stList = sDao.checkSurveys(conn, sList, userId);
		System.out.println(stList);
		close(conn);
		return stList;
	}

	public ArrayList<DoSurvey> doServey(int sNum) {
		Connection conn = getConnection();
		SurveyDao sDao = new SurveyDao();
		Survey s = sDao.doServeyS(conn, sNum);
		ArrayList<Question> qList = sDao.doServeyQ(conn, s);
		ArrayList<DoSurvey> dsList = sDao.doServeyA(conn, s, qList);
		close(conn);

		return dsList;
	}

	public ArrayList<DoSurvey> chartSurvey2(int snum) {

		Connection conn = getConnection();
		SurveyDao sDao = new SurveyDao();
		Survey s = sDao.doServeyS2(conn, snum);
		ArrayList<Question> qList = sDao.doServeyQ(conn, s);
		// qnum과 일치하는 anum들의 리스트를 작성
		ArrayList<DoSurvey> dsList = sDao.doServeyA(conn, s, qList);
		close(conn);

		return dsList;
	}

	public int recordAnswer(String userId, int sNum, int[] qNum, int[] aNum, String[] aContent) {
		Connection conn = getConnection();
		SurveyDao sDao = new SurveyDao();
		int[] result = sDao.recordAnswer(conn, userId, sNum, qNum, aNum, aContent);
		int[] countResult = new int[result.length];
		int cResult = 0;
		int countSurvey = sDao.addSurveyCount(conn, sNum);
		int checkSurveyCount = sDao.checkSurveyCount(conn, sNum);
		Survey survey = sDao.selectSurveys(conn, sNum);
		int pointRecord = sDao.recordPoint(conn, survey, userId);
		int addUpdate = sDao.addPoint(conn, survey, userId);
		int addAnswerUser = sDao.addAnswerUser(conn, survey, userId);
		for (int i = 0; i < result.length; i++) {
			if (result[i] > 0) {
				countResult[i] = sDao.addAnswerCount(conn, aNum[i]);
			}
		}
		if (result.length == countResult.length) {
			cResult = 1;
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);

		return cResult;
	}

	public int deleteSurvey(int sNum) {
		Connection conn = getConnection();

		int result = new SurveyDao().deleteSurvey(conn, sNum);
		if (result > 0) {
			commit(conn);
		} else
			rollback(conn);

		close(conn);
		return result;
	}

	public int powerDeleteSurvey(int sNum) {
		Connection conn = getConnection();

		int result = new SurveyDao().powerDeleteSurvey(conn, sNum);
		if (result > 0) {
			commit(conn);
		} else
			rollback(conn);

		close(conn);
		return result;
	}

	public ArrayList<DoSurvey> modifySurvey(int sNum, String userId) {
		Connection conn = getConnection();
		SurveyDao sDao = new SurveyDao();
		Survey s = sDao.selectSurvey(conn, sNum);
		SurveyTarget st = null;
		ArrayList<Question> qList = sDao.selectQuestion(conn, s);
		ArrayList<DoSurvey> dsList = new ArrayList<DoSurvey>();
		if(s.getsTarget() != null) {
			st = sDao.selectSurveyTarget(conn, s);
			dsList = sDao.modifySurveyTarget(conn, s, qList, st);
		}else {
			dsList = sDao.modifySurvey(conn, s, qList);
		}
		
		close(conn);
		
		return dsList;
	}

	public int deleteModifiedSurvey(String[] delSnum, String[] delQnum, ArrayList<String> delAnum) {
		Connection conn = getConnection();
		SurveyDao sDao = new SurveyDao();
		int result1 =  sDao.deleteModifiedAnswer(conn, delQnum);
		int result2 =  sDao.deleteModifiedQuestion(conn, delSnum);
		int result3 =  sDao.deleteModifiedSurvey(conn, delSnum);
		commit(conn);
		
		close(conn);
		return result1 +result2+result3; 
	}

	public void sortChart(String aContent, int qNum) {
		Connection conn = getConnection();
		
		SurveyDao sDao = new SurveyDao();
		sDao.sortChart(conn, aContent, qNum);
	}


	public int purchaseSurvey(String sNums) {
		Connection conn = getConnection();
		System.out.println("purchase Survey : " + sNums);	
		 int result = new SurveyDao().purchaseSurvey(conn, sNums);
		commit(conn);
	
		close(conn);
		return result;
	}

}
