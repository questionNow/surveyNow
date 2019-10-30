package board.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import board.model.dao.BoardDao;
import board.model.vo.Board;
import board.model.vo.Reply;
import user.model.vo.UserInfo;

public class BoardService {

   // 게시판 insert 메소드
   public int insertBoard(Board b) {
      Connection conn = getConnection();
      
      int result = new BoardDao().insertBoard(conn, b);
      
      if(result > 0) 
         commit(conn);
      else
         rollback(conn);
      
      close(conn);
         
      return result;
   }

   // 게시판 페이지 목록 찾아오는 메소드
   public ArrayList<Board> selectNoticeList(int currentPage, int limit, String bCategory) {
      Connection conn = getConnection();
      
      ArrayList<Board> list = new BoardDao().selectNoticeList(conn, currentPage, limit);
      
      close(conn);
      
      return list;
   }
   
   public ArrayList<Board> selectEventList(int currentPage, int limit, String bCategory) {
      Connection conn = getConnection();
      
      ArrayList<Board> list = new BoardDao().selectEventList(conn, currentPage, limit);
      
      close(conn);
      
      return list;
   }

   // 게시판 페이지 목록 갯수 가져오는 메소드
   public int getListCount(String tableName) {
      Connection conn = getConnection();
      
      int listCount = new BoardDao().getListCount(conn, tableName);
      
      close(conn);
      
      return listCount;
   }

   // 게시글 상세보기 메소드
   public Board selectBoard(int bnum) {
      Connection conn = getConnection();

      Board b = new Board();
      BoardDao bDao = new BoardDao();
      int result = bDao.updateCount(conn,bnum);
      
      if(result>0) {
         commit(conn);
         b=bDao.selectBoard(conn,bnum);
      }else {
         rollback(conn);
      }
      
      close(conn);
      
      return b;
   }

   public ArrayList<Reply> selectReplyList(int currentPage, int limit) {
      Connection conn = getConnection();
      
      ArrayList<Reply> list = new BoardDao().selectReplyList(conn, currentPage, limit);
      
      close(conn);
      
      return list;
   }

   public int deleteReply(int replyNum, String userId) {
      Connection conn = getConnection();
      int result = new BoardDao().deleteReply(conn, replyNum, userId);
      
      if(result > 0)
         commit(conn);
      else
         rollback(conn);
      
      close(conn);
      
      return result;
   }

   public int updateBoard(Board b) {
      Connection conn = getConnection();
      int result = new BoardDao().updateBoard(conn, b);
      
      if(result > 0)
         commit(conn);
      else 
         rollback(conn);
      
      close(conn);
      
      return result;
   }

   public int deleteBoard(int bnum) {
      Connection conn = getConnection();
      int result = new BoardDao().deleteBoard(conn, bnum);
      
      if(result > 0)
         commit(conn);
      else 
         rollback(conn);
      
      close(conn);
      
      return result;
   }
   
      // 메인 화면의 공지사항 
   public ArrayList<Board> mainBoardList() {
      Connection conn = getConnection();
      
      ArrayList<Board> list = new BoardDao().mainBoardList(conn);
      
      close(conn);
      
      return list;
   }
}