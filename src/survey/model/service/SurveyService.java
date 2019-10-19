package survey.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import survey.model.dao.SurveyDao;
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


}
