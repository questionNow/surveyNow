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
	//SDB 설문 삭제 추가
	public int deleteSurvey(int sNum) {
		Connection conn = getConnection();

		int result = new SurveyDao().deleteSurvey(conn, sNum);

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

	public int makeSurvey(Survey s, String[] qNum, String[] qType, String[] qTitle, ArrayList<String[]> answer) {
		Connection conn = getConnection();
		SurveyDao sDao = new SurveyDao();
		int result = sDao.makeSurvey(conn, s);
		int result1 = sDao.makeQuestion(conn, qNum, qType, qTitle, answer);
		commit(conn);
		close(conn);
		return result;
	}

	public ArrayList<Survey> selectSurveys(String userId) {
		Connection conn = getConnection();
		ArrayList<Survey> sList = new SurveyDao().selectSurveys(conn,userId);
		
		close(conn);
		
		return sList;
	}

	public ArrayList<DoSurvey> doServey(int sNum) {
		Connection conn  = getConnection();
		SurveyDao sDao = new SurveyDao();
		Survey s = sDao.doServeyS(conn, sNum);
		ArrayList<Question> qList = sDao.doServeyQ(conn, sNum);	
		ArrayList<DoSurvey> dsList = sDao.doServeyA(conn, s, qList);
		
		close(conn);
		
		return dsList;
	}

	public ArrayList<Survey> updateHoldSurvey(Survey survey) {
		Connection conn = getConnection();
		
		SurveyDao sDao = new SurveyDao();
		
		int result = new SurveyDao().updateHoldSurvey(conn, survey);
		
		ArrayList<Survey> sList = null;
		
		if(result>0) {
			commit(conn);
			sList = sDao.selectHoldSurvey(conn, survey.getsUserId());
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return sList;
	}

}
