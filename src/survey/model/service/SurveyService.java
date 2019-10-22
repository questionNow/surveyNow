package survey.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import survey.model.dao.SurveyDao;
import survey.model.vo.Answer;
import survey.model.vo.Chart;
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

	public int makeSurvey(Survey s, SurveyTarget st, String[] qNum, String[] qType, String[] qTitle, ArrayList<String[]> answer) {
		Connection conn = getConnection();
		SurveyDao sDao = new SurveyDao();
		int result = sDao.makeSurvey(conn, s);
		System.out.println("survey make : " +result);
		int result1 = sDao.makeSurveyTarget(conn, st);
		System.out.println("survey makeTarget : " +result1);
		int result2 = sDao.makeQuestion(conn, qNum, qType, qTitle, answer);
		System.out.println("Question Make : " +result2);
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
	
	public ArrayList<Chart> chartSurvey(int sNum){
		
		Connection conn  = getConnection();
		SurveyDao sDao = new SurveyDao();
		Survey s = sDao.doServeyS(conn, sNum);
		ArrayList<Question> qList = sDao.doServeyQ(conn, sNum);
		System.out.println("큐리" + qList);
		//	qnum과 일치하는 anum들의 리스트를 작성
		ArrayList<DoSurvey> dsList = sDao.doServeyA(conn, s, qList);
		System.out.println("ds리" + dsList);
		ArrayList<Chart> cList = sDao.chartServey(conn, s, qList, dsList); 
		
		close(conn);
		
		return cList;
		
	}


}
