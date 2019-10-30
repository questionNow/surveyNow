package board.model.dao;

import java.sql.*;
import java.util.ArrayList;

import static common.JDBCTemplate.*;
import board.model.vo.Board;
import board.model.vo.Reply;

public class BoardDao {
   // 게시판 작성 시 사용자 이름 가져오는 메소드 
   public String getWriterName(String userId) {
      Connection conn = getConnection();
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      
      String query = "SELECT userName FROM user_info WHERE userId = ?";
      String userName = null;
      
      try {
         pstmt = conn.prepareStatement(query);
         pstmt.setString(1, userId);
         
         rs = pstmt.executeQuery();
         
         if(rs.next())
            userName = rs.getString("userName");
         
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         close(pstmt);
         close(rs);
      }
      
      close(conn);
      
      return userName;
   }

   // 게시판 insert 메소드
   public int insertBoard(Connection conn, Board b) {
      PreparedStatement pstmt = null;
      int result = 0;
      
      String query = "INSERT INTO board VALUES(SEQ_BOARD.NEXTVAL,?,?,?,?,SYSDATE,?,'N',0)";

      try {
         pstmt = conn.prepareStatement(query);
         pstmt.setString(1, b.getbWriter());
         pstmt.setString(2, getWriterName(b.getbWriter()));
         pstmt.setString(3, b.getbTitle());
         pstmt.setString(4, b.getbContent());
         pstmt.setString(5, b.getbType());
         
         result = pstmt.executeUpdate();
         
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         close(pstmt);
      }
      return result;
   }
   
   // 게시판 리스트 조회
   public ArrayList<Board> selectNoticeList(Connection conn, int currentPage, int limit) {
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      
      ArrayList<Board>list = null;
      
      String query = "SELECT ROWNUM, bnum, bwriter, bwname, btitle, bcontent, bcreatedt, DECODE(btype, 'n', '공지사항', 'e', '이벤트') btype, bstatus, bcount FROM board " + 
            "WHERE ROWNUM BETWEEN ? AND ? AND bstatus = 'N' AND btype = 'n' ORDER BY 1 DESC";
      
      int startRow = (currentPage-1)*limit +1;   
      int endRow = startRow + limit -1;
      
      try {
         pstmt = conn.prepareStatement(query);
         
         pstmt.setInt(1, startRow);
         pstmt.setInt(2, endRow);
         
         rs=pstmt.executeQuery();
         
         list = new ArrayList<Board>();
         
         while(rs.next()) {
            Board b = new Board(rs.getInt("bnum"),
                           rs.getString("bwriter"),
                           rs.getString("bwname"),
                           rs.getString("btitle"),
                           rs.getString("bcontent"),
                           rs.getDate("bcreatedt"),
                           rs.getString("btype"),
                           rs.getString("bstatus"),
                           rs.getInt("bcount"));
            
            list.add(b);
         }
         
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         close(rs);
         close(pstmt);
      }

      return list;
   }
   
   public ArrayList<Board> selectEventList(Connection conn, int currentPage, int limit) {
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      
      ArrayList<Board>list = null;
      
      String query = "SELECT ROWNUM, bnum, bwriter, bwname, btitle, bcontent, bcreatedt, DECODE(btype, 'n', '공지사항', 'e', '이벤트') btype, bstatus, bcount FROM board " + 
            "WHERE ROWNUM BETWEEN ? AND ? AND bstatus = 'N' AND btype = 'e' ORDER BY 1 DESC";
      
      int startRow = (currentPage-1)*limit +1;   
      int endRow = startRow + limit -1;
      
      try {
         pstmt = conn.prepareStatement(query);
         
         pstmt.setInt(1, startRow);
         pstmt.setInt(2, endRow);
         
         rs=pstmt.executeQuery();
         
         list = new ArrayList<Board>();
         
         while(rs.next()) {
            Board b = new Board(rs.getInt("bnum"),
                           rs.getString("bwriter"),
                           rs.getString("bwname"),
                           rs.getString("btitle"),
                           rs.getString("bcontent"),
                           rs.getDate("bcreatedt"),
                           rs.getString("btype"),
                           rs.getString("bstatus"),
                           rs.getInt("bcount"));
            
            list.add(b);
         }
         
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         close(rs);
         close(pstmt);
      }

      return list;
   }

   // 게시글 목록 카운트  목록을 찾아올 테이블 기준으로 해당 테이블에 게시글이 몇개있는지 찾아오는 메소드 
   public int getListCount(Connection conn, String tableName) {
      Statement stmt = null;
      ResultSet rs = null;
      
      int listCount = 0;
      
      String query = "SELECT COUNT(*) FROM " + tableName;
      
      try {
         stmt = conn.createStatement();
         rs = stmt.executeQuery(query);
         
         if(rs.next()) {
            listCount=rs.getInt(1);
         }

      } catch (SQLException e) {
         e.printStackTrace();
      }finally {
         close(stmt);
         close(rs);
      }
      return listCount;
   }

   // 조회수 카운트
   public int updateCount(Connection conn, int bnum) {
      PreparedStatement pstmt = null;
      int result = 0;
      
      String query = "UPDATE board SET bcount = bcount + 1 WHERE bNum = ?";
      
      try {
         pstmt = conn.prepareStatement(query);
         pstmt.setInt(1, bnum);
         
         result = pstmt.executeUpdate();
 
      } catch (SQLException e) {
         e.printStackTrace();
      }finally {
         close(pstmt);
      }

      return result;
   }

   // 게시글 상세보기
   public Board selectBoard(Connection conn, int bnum) {
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      
      Board b = null;
      
      String query = "SELECT * FROM board WHERE bnum = ?";
      
      try {
         pstmt = conn.prepareStatement(query);
         pstmt.setInt(1, bnum);
         
      
         rs = pstmt.executeQuery();
         
         while(rs.next()) {
            b = new Board(rs.getInt("bnum"),
                       rs.getString("bwriter"),
                       rs.getString("bwname"),
                       rs.getString("btitle"),
                       rs.getString("bcontent"),
                       rs.getDate("bcreatedt"),
                       rs.getString("btype"),
                       rs.getString("bstatus"),
                       rs.getInt("bcount"));
         }
         
      } catch (SQLException e) {
         e.printStackTrace();
      }finally {
         close(pstmt);
         close(rs);
      }
      return b;
   }

   public ArrayList<Reply> selectReplyList(Connection conn, int currentPage, int limit) {
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      
      ArrayList<Reply>list = null;
      
      String query = "SELECT ROWNUM,REPLYNUM,BNUM,REPLYID,REPLYTEXT,REPLYDATE,REPLYSTATUS FROM REPLY WHERE ROWNUM BETWEEN ? AND ? AND REPLYSTATUS = 'N' "
            + "ORDER BY 1 DESC";
      
      int startRow = (currentPage-1)*limit +1;   
      int endRow = startRow + limit -1;
      
      try {
         pstmt = conn.prepareStatement(query);
         
         pstmt.setInt(1, startRow);
         pstmt.setInt(2, endRow);
         
         rs=pstmt.executeQuery();
         
         list = new ArrayList<Reply>();
         
         while(rs.next()) {
            Reply b = new Reply(rs.getInt("replyNum"),
                           rs.getInt("bnum"),
                           rs.getString("replyid"),
                           rs.getString("replytext"),
                           rs.getDate("replyDate"),
                           rs.getString("replyStatus"));
            list.add(b);
         }
         
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         close(rs);
         close(pstmt);
      }
      return list;
   }

   public int deleteReply(Connection conn, int replyNum, String userId) {
      PreparedStatement pstmt = null;
      int result = 0;
      
      String query = "UPDATE reply SET replystatus='Y' WHERE replynum = ? AND replyid  = ?";
      
      try {
         pstmt = conn.prepareStatement(query);
         pstmt.setInt(1, replyNum);
         pstmt.setString(2, userId);
         
         result = pstmt.executeUpdate();
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         close(pstmt);
      }
      return result;
   }

   public int updateBoard(Connection conn, Board b) {
      PreparedStatement pstmt = null;
      int result = 0;
      
      String query = "UPDATE board SET btype = ?, btitle = ?, bcontent = ? WHERE bnum = ?";
      
      try {
         pstmt = conn.prepareStatement(query);
         pstmt.setString(1, b.getbType());
         pstmt.setString(2, b.getbTitle());
         pstmt.setString(3, b.getbContent());
         pstmt.setInt(4, b.getbNum());
         
         result = pstmt.executeUpdate();
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         close(pstmt);
      }
      
      return result;
   }

   public int deleteBoard(Connection conn, int bnum) {
      Statement stmt = null;
      int result = 0;
      
      String query = "UPDATE board SET bstatus = 'Y' WHERE bnum ="+bnum;
      
      try {
         stmt = conn.createStatement();
         result = stmt.executeUpdate(query);
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         close(stmt);
      }
      
      return result;
   }

   
   
   // 메인화면 게시판 List (조회 갯수는 15)
   public ArrayList<Board> mainBoardList(Connection conn) {
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      
      ArrayList<Board>list = null;
      
      String query = "SELECT * FROM("
                  +"SELECT ROWNUM, bnum, bwriter, bwname, btitle, bcontent, bcreatedt, DECODE(btype, 'n', '공지사항', 'e', '이벤트') btype, bstatus, bcount FROM board " 
                  +"WHERE bstatus = 'N' ORDER BY BTYPE, 1 DESC"
                  +")WHERE ROWNUM <= 15"; 
      
      try {
         pstmt = conn.prepareStatement(query);

         rs=pstmt.executeQuery();
         
         list = new ArrayList<Board>();
         
         while(rs.next()) {
            Board b = new Board(rs.getInt("bnum"),
                           rs.getString("bwriter"),
                           rs.getString("bwname"),
                           rs.getString("btitle"),
                           rs.getString("bcontent"),
                           rs.getDate("bcreatedt"),
                           rs.getString("btype"),
                           rs.getString("bstatus"),
                           rs.getInt("bcount"));
            
            list.add(b);
         }
         
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         close(rs);
         close(pstmt);
      }

      return list;
   }   
   
   
   
   
   
   
   
   
   
}