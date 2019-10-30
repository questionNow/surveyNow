package qna.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import board.model.dao.BoardDao;
import board.model.vo.Board;
import qna.model.dao.QnADao;
import qna.model.vo.QnA;

public class QnAService {
	
	public int getListCount(String tableName) {
		Connection conn = getConnection();
		
		int listCount = new QnADao().getListCount(conn, tableName);
		
		close(conn);
		
		return listCount;
	}

	public ArrayList<QnA> selectList(int currentPage, int limit) {
		Connection conn = getConnection();
		
		ArrayList<QnA> list = new QnADao().selectList(conn, currentPage, limit);
		
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
}
