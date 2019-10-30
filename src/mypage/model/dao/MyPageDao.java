package mypage.model.dao;

/*import java.sql.ResultSet;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Connection;
*/
import static common.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import mypage.model.vo.attendence;
import qna.model.vo.QnA;
import user.model.vo.Point;
import user.model.vo.UserInfo;



public class MyPageDao {
	

	public MyPageDao() {}

	
	// 마이페이지 !
	public UserInfo selectUser(Connection conn, String userId) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		UserInfo user = null;

		try {

			pstmt = conn.prepareStatement("SELECT * FROM USER_INFO WHERE USERID=?");
			pstmt.setString(1, userId);

			rs = pstmt.executeQuery();

			// resultSet의 결과가 있으면 ...
			if (rs.next()) {
				user = new UserInfo(rs.getString("USERID"), rs.getString("USERPWD"), rs.getString("USERNAME"),
						rs.getInt("AGE"), rs.getString("GENDER"), rs.getString("EMAIL"), rs.getString("PHONE"),
						rs.getString("ADDRESS"), rs.getString("RECOMMEND_ID"), rs.getInt("SURVEYCOUNT"),
						rs.getInt("VISITCOUNT"), rs.getInt("USERTYPE"), rs.getString("STATUS"),
						rs.getString("FINAL_EDUCATION"), rs.getString("JOB"), rs.getString("INCOME"),
						rs.getString("LIVING_TYPE"), rs.getString("HOUSE_TYPE"), rs.getString("RELIGION"),
						rs.getString("MARITAL_STATUS"), rs.getString("LIVING_WITH"), rs.getString("ARMY_GO"),
						rs.getString("INTEREST"), rs.getDate("PWDDATE"), rs.getDate("JOINDATE"), rs.getInt("POINT"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}

		return user;
	}

	// 마이페이지 정보 수정 
	public UserInfo MyInfoUser(Connection conn, String userId) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		UserInfo user = null;

		try {

			pstmt = conn.prepareStatement("SELECT * FROM USER_INFO WHERE USERID=?");
			pstmt.setString(1, userId);

			rs = pstmt.executeQuery();

			// resultSet의 결과가 있으면 ...
			if (rs.next()) {
				user = new UserInfo(rs.getString("USERID"), rs.getString("USERPWD"), rs.getString("USERNAME"),
						rs.getInt("AGE"), rs.getString("GENDER"), rs.getString("EMAIL"), rs.getString("PHONE"),
						rs.getString("ADDRESS"), rs.getString("RECOMMEND_ID"), rs.getInt("SURVEYCOUNT"),
						rs.getInt("VISITCOUNT"), rs.getInt("USERTYPE"), rs.getString("STATUS"),
						rs.getString("FINAL_EDUCATION"), rs.getString("JOB"), rs.getString("INCOME"),
						rs.getString("LIVING_TYPE"), rs.getString("HOUSE_TYPE"), rs.getString("RELIGION"),
						rs.getString("MARITAL_STATUS"), rs.getString("LIVING_WITH"), rs.getString("ARMY_GO"),
						rs.getString("INTEREST"), rs.getDate("PWDDATE"), rs.getDate("JOINDATE"), rs.getInt("POINT"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}

		return user;
	}

	// 마이페이지  포인트게시판 리스트 갯수 구하기
	
	 
	  	// 포인트 게시판
	public ArrayList<Point> selectPointList(Connection conn, String userId) {
		PreparedStatement pstmt = null;
		ResultSet rs =null;
		
		ArrayList<Point> pointlist =null;
		
		/* String query ="SELECT * FROM POINTTEST WHERE USERID=?"; */ 
		 String query ="SELECT * FROM POINT WHERE USERID=?"; 
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userId);
			
			rs = pstmt.executeQuery();
			
			pointlist = new ArrayList<Point>();
			
			while(rs.next()) {
				Point p = new Point(rs.getInt("pNum"),
									rs.getString("userId"),
									rs.getInt("point"),
									rs.getDate("pDate"),
									rs.getString("pContent"));
				
				pointlist.add(p);
	}
		} catch (SQLException e) {
		e.printStackTrace(); 
		}finally { 
		close(rs);
		 close(pstmt); 
		 }

		 return pointlist; 
		 }
	

	public int InfoChange(Connection conn, UserInfo userInfo) {
		PreparedStatement pstm = null;
		int result = 0;
		
		String query ="UPDATE USER_INFO SET USERPWD=?, USERNAME=?, AGE=?, EMAIL=?, PHONE=?, ADDRESS=?, FINAL_EDUCATION=?, JOB=?, INCOME=?, LIVING_TYPE=?, HOUSE_TYPE=?, "
				+ "RELIGION=?, MARITAL_STATUS=?, LIVING_WITH=?, ARMY_GO=?, INTEREST=? WHERE USERID=?";
		try {
			pstm = conn.prepareStatement(query);
	
			
			
			pstm.setString(1, userInfo.getUserPwd());
			pstm.setString(2, userInfo.getUserName());			
			pstm.setInt(3, userInfo.getAge());
			pstm.setString(4, userInfo.getEmail());
			pstm.setString(5, userInfo.getPhone());
			pstm.setString(6, userInfo.getAddress());
			pstm.setString(7, userInfo.getFinalEducation());
			pstm.setString(8, userInfo.getJob());
			pstm.setString(9, userInfo.getIncome());
			pstm.setString(10, userInfo.getLivingType());
			pstm.setString(11, userInfo.getHouseType());
			pstm.setString(12, userInfo.getReligion());
			pstm.setString(13, userInfo.getMaritalStatus());
			pstm.setString(14, userInfo.getLivingWith());
			pstm.setString(15, userInfo.getArmyGo());
			pstm.setString(16, userInfo.getInterest());
			pstm.setString(17, userInfo.getUserId());
			result = pstm.executeUpdate();
			
			System.out.println(result);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstm);
		}
		return result;
	}


	


	


	public int getQnAListCount(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int listCount = 0;
		
		String query ="SELECT COUNT(*) FROM QNA WHERE USERID=?";
		
		try {
			pstmt = conn.prepareStatement(query);
			rs = pstmt.executeQuery();
			
			
			
			if(rs.next()) {
				listCount=rs.getInt(1);	// 쿼리에서의 resultSet 컬럼 값(count(*))을 뽑아내서 int listCount에 담음
							
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rs);
		}
		return listCount;
	}


	/* public ArrayList<Board> selectQnAList(Connection conn, int currentPage, int limit) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		ArrayList<Board>list = null;
		
		String query ="SELECT ROWNUM, QNANUM, USERID, QNATITLE, QNACONTENT, QNATYPE FROM QNA WHERE USERID=?";
		
		// 쿼리문 실행시 조건절에 넣을 변수들(rownum에 대한 조건 시 필요)
		int startRow = (currentPage-1)*limit +1;	
		// ex) 2page면 시작 번호가 11번일 것이다.
		int endRow = startRow + limit -1;
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			pstmt.setString(3, "userId");

			rs=pstmt.executeQuery();
			
			list = new ArrayList<Board>();	// 컬렉션(ArrayList)는 반드시 기본생성자로 초기화 해놓고 활용하자!!
	
			while(rs.next()) {
				Board b = new Board(rs.getInt("qnanum"),
									rs.getString("userid"),
									rs.getString("qnatitle"),
									rs.getString("qnacontent"),
									rs.getString("qnatype"),
									rs.getString("acontent"),
									rs.getString("astatus"));
															
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
	 	*/

	public int insertMyQnA(Connection conn, QnA qna) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query ="INSERT INTO QNA VALUES(SEQ_QNA.NEXTVAL, ?, ?, ?, ?, DEFAULT,'N',SYSDATE, DEFAULT)";
	
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, 	qna.getUserId());
			pstmt.setString(2, qna.getQnaTitle());
			pstmt.setString(3, qna.getQnaConent());
			pstmt.setString(4, qna.getQnaType());
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);

		}
		
		
		return result;
	}


	public int Userdelete(Connection conn, String userId) {
			PreparedStatement pstmt = null;
			int result = 0;
			
			
			String query ="UPDATE USER_INFO SET STATUS='Y' WHERE USERID=?";
			
			try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userId);
		
			
		
			System.out.println("result : " + result);
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
		}


	/*
	 * public UserInfo UserDeleteForm(Connection conn, String userId) {
	 * PreparedStatement pstmt = null; ResultSet rs = null; attendence at = null;
	 * 
	 * try {
	 * 
	 * pstmt = conn.prepareStatement("SELECT * FROM USER_INFO WHERE USERID=?");
	 * pstmt.setString(1, userId);
	 * 
	 * rs = pstmt.executeQuery();
	 * 
	 * // resultSet의 결과가 있으면 ... if (rs.next()) { at = new attendence
	 * (rs.getInt("ATTNUM"), rs.getString("USERID"), rs.getInt("ATTPOINT"),
	 * rs.getInt("ATTCOUNT"), rs.getDate("ATTDATE")); }
	 * 
	 * 
	 * 
	 * } catch (SQLException e) { e.printStackTrace(); } finally { close(pstmt);
	 * close(rs); }
	 * 
	 * return at; }
	 */

	public int calendarSave(Connection conn, String userId) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		
		String query ="UPDATE ATTENDANCE SET ATTPOINT= ATTPOINT +1, ATTCOUNT= ATTCOUNT+1, ATTDATE=SYSDATE WHERE USERID=?";
		
		try {
		pstmt = conn.prepareStatement(query);
		pstmt.setString(1, userId);
	
		
	
		System.out.println("result : " + result);
		result = pstmt.executeUpdate();
		
	} catch (SQLException e) {
		e.printStackTrace();
	}finally {
		close(pstmt);
	}
	
	return result;
	}


	public ArrayList<attendence> calendarSelect(Connection conn, String userId) {
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<attendence> at = null; 
		System.out.println("1111111");
	
		try {
				System.out.println("22222222222");
			pstmt = conn.prepareStatement("SELECT * FROM ATTENDANCE WHERE USERID=?");
			pstmt.setString(1, userId);

			rs = pstmt.executeQuery();
			at = new ArrayList<attendence>();
			// resultSet의 결과가 있으면 ...
			while(rs.next()) {
				attendence a = new attendence (rs.getInt("ATTNUM"), rs.getString("USERID"), rs.getInt("ATTPOINT"),
						rs.getInt("ATTCOUNT"), rs.getDate("ATTDATE"));
				at.add(a);
			}

			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		System.out.println("333333333333");
		return at;
	}


		


	public UserInfo UserDeleteForm(Connection conn, String userId) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		UserInfo user = null;

		try {

	pstmt = conn.prepareStatement("SELECT * FROM USER_INFO WHERE USERID=?");
	pstmt.setString(1, userId);
	
	rs = pstmt.executeQuery();

			// resultSet의 결과가 있으면 ...
	if (rs.next()) {
		user = new UserInfo(rs.getString("USERID"), rs.getString("USERPWD"), rs.getString("USERNAME"),
				rs.getInt("AGE"), rs.getString("GENDER"), rs.getString("EMAIL"), rs.getString("PHONE"),
				rs.getString("ADDRESS"), rs.getString("RECOMMEND_ID"), rs.getInt("SURVEYCOUNT"),
						rs.getInt("VISITCOUNT"), rs.getInt("USERTYPE"), rs.getString("STATUS"),
						rs.getString("FINAL_EDUCATION"), rs.getString("JOB"), rs.getString("INCOME"),
						rs.getString("LIVING_TYPE"), rs.getString("HOUSE_TYPE"), rs.getString("RELIGION"),
						rs.getString("MARITAL_STATUS"), rs.getString("LIVING_WITH"), rs.getString("ARMY_GO"),
						rs.getString("INTEREST"), rs.getDate("PWDDATE"), rs.getDate("JOINDATE"), rs.getInt("POINT"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}

		return user;
	}

}
