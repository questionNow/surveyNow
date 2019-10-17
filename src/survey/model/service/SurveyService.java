package survey.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

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

}
