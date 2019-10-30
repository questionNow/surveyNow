package point.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import board.model.dao.BoardDao;
import point.model.dao.PointDao;
import point.model.vo.Point;

import static common.JDBCTemplate.*;

public class PointService {
	
	public int getListCount() {
		Connection conn = getConnection();
		
		int listCount = new PointDao().getListCount(conn);
		
		close(conn);
		
		return listCount;
	}

	public ArrayList<Point> selectPointList(int currentPage, int limit) {
		Connection conn = getConnection();
		
		ArrayList<Point> list = new PointDao().selectPointList(conn, currentPage, limit);
		
		close(conn);
		
		return list;
	}

	public ArrayList<Point> selectList(int currentPage, int limit) {
		Connection conn = getConnection();  
		
		ArrayList<Point> list = new PointDao().selectList(conn, currentPage, limit);
		
		close(conn);
		
		return list;
	}

	public int plusPoint(Point p) {
		Connection conn = getConnection();
		
		int r1 = new PointDao().pointInsert(conn, p);
		int r2 = new PointDao().plusPointUser(conn, p);
		
		if(r1 > 0 && r2 > 0)
			commit(conn);
		else 
			rollback(conn);
		
		close(conn);
		
		return r1;
	}

	public int minusPoint(Point p) {
Connection conn = getConnection();
		
		int r1 = new PointDao().pointInsert(conn, p);
		int r2 = new PointDao().minusPointUser(conn, p);
		
		if(r1 > 0 && r2 > 0)
			commit(conn);
		else 
			rollback(conn);
		
		close(conn);
		
		return r1;
	}

}
