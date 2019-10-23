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
			int result1 = sDao.makeSurveyTarget(conn, st);
			if (result1 > 0) {
				int result2 = sDao.makeQuestion(conn, qNum, qType, qTitle, answer);
				if (result2 > 0) {
					commit(conn);
				}
			}
		}
		close(conn);
		return result;
	}

	public ArrayList<Survey> selectSurveys(String userId) {
		Connection conn = getConnection();
		SurveyDao sDao = new SurveyDao();
		ArrayList<Survey> sList = sDao.selectSurveys(conn, userId);
		close(conn);

		return sList;
	}

	public ArrayList<DoSurvey> doServey(int sNum) {
		Connection conn = getConnection();
		SurveyDao sDao = new SurveyDao();
		Survey s = sDao.doServeyS(conn, sNum);
		ArrayList<Question> qList = sDao.doServeyQ(conn, sNum);
		ArrayList<DoSurvey> dsList = sDao.doServeyA(conn, s, qList);
		close(conn);

		return dsList;
	}

	public ArrayList<DoSurvey> chartSurvey2(int snum) {

		Connection conn = getConnection();
		SurveyDao sDao = new SurveyDao();
		Survey s = sDao.doServeyS(conn, snum);
		ArrayList<Question> qList = sDao.doServeyQ(conn, snum);
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
		int addUpdate = sDao.addPoint(conn,survey, userId);
		for (int i = 0; i < result.length; i++) {
			if (result[i] > 0) {
				countResult[i] = sDao.addAnswerCount(conn, aNum[i]);
			}
		}
		if(result.length == countResult.length) {
			cResult = 1;
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return cResult;
	}

}
