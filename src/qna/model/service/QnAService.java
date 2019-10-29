package qna.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;
import qna.model.dao.QnADao;
import qna.model.vo.QnA;

public class QnAService {


	public ArrayList<QnA> selectList(String userId) {
		Connection conn = getConnection();
		ArrayList<QnA> list = new QnADao().selectList(conn, userId);
		
		close(conn);
		
		return list;
	}

	public QnA selectQnA(int qnanum) {
		Connection conn = getConnection();
		
		QnA q = new QnADao().selectQnA(conn,qnanum);
		
		close(conn);
		
		return q;
	}


	public int answerInsert(int qnaNum, String adminId, String acontent) {
		Connection conn = getConnection();
		
		int result = new QnADao().answerInsert(conn, qnaNum, adminId, acontent);

		close(conn);
		
		return result;
	}



	public ArrayList<QnA> MyQnASearch( int qnaNum, String qnaType, String qnaTitle) {
		Connection conn = getConnection();
		ArrayList<QnA> list = new QnADao().MyQnASearch(conn, qnaNum, qnaType, qnaTitle);
		
		close(conn);
		
		return list;
	}
}
