package mypage.model.dao;

import static common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import mypage.model.vo.Member;


public class MemberDao {

	// 메소드에서 활용된 query문을 properties 파일로 만들어 가져온다.
	// member(회원)과 관련된 쿼리를 담을 member-query.properties 파일을 불러오자
	
	private Properties prop = new Properties();
	
	public MemberDao() {
		// 항상 member-query.properties 값을 불러 올 수 있도록
		// 기본 생성자 안에서 properties 파일을 불러오는 작업을 하자
		String fileName = MemberDao.class.getResource("../mypage/sql/member-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}	
	}
	
	public Member loginMember(Connection conn, Member member) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		Member loginUser = null;
		
		String query = prop.getProperty("loginMember");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, member.getUserId());
			pstmt.setString(2, member.getUserPwd());
			
			rs = pstmt.executeQuery();
			
			
			if(rs.next()) {	// resultSet의 결과가 있으면...
				loginUser = new Member(rs.getInt("USER_NO"),
										rs.getString("USER_ID"),
										rs.getString("USER_PWD"),
										rs.getString("USER_NAME"),
										rs.getString("PHONE"),
										rs.getString("EMAIL"),
										rs.getString("ADDRESS"),
										rs.getString("INTEREST"),
										rs.getDate("ENROLL_DATE"),
										rs.getDate("MODIFY_DATE"),
										rs.getString("STATUS")									
			
						);	
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return loginUser;
		
		// 다시 Service로 가자!!
		}




	public int insertMember(Connection conn, Member member) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertMember");
		
		
		//SEQ_UNO.NEXTVAL, ?, ?, ?, ?, ?, ?, ?, SYSDATE, SYSDATE, DEFAULT
		//USER_NO,	USER_ID,	USER_PWD,	USER_NAME,	PHONE,	EMAIL,	ADDRESS,	INTEREST,	ENROLL_DATE,	MODIFY_DATE	STATUS
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, member.getUserId());
			pstmt.setString(2, member.getUserPwd());
			pstmt.setString(3, member.getUserName());
			pstmt.setString(4, member.getPhone());
			pstmt.setString(5, member.getEmail());
			pstmt.setString(6, member.getAddress());
			pstmt.setString(7, member.getInterest());
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
				
		return result;
		// memberService로 돌아가자!
	}




	public Member selectMember(Connection conn, String userId) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Member member = null;
		
		String query = prop.getProperty("selectMember");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userId);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {	// resultSet의 결과가 있으면...
				member = new Member(rs.getInt("USER_NO"),
										rs.getString("USER_ID"),
										rs.getString("USER_PWD"),
										rs.getString("USER_NAME"),
										rs.getString("PHONE"),
										rs.getString("EMAIL"),
										rs.getString("ADDRESS"),
										rs.getString("INTEREST"),
										rs.getDate("ENROLL_DATE"),
										rs.getDate("MODIFY_DATE"),
										rs.getString("STATUS")									
							);	
			}			

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		
		return member;
	}




	public int updateMember(Connection conn, Member member) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateMember");
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1,  member.getUserName());
			pstmt.setString(2,  member.getPhone());
			pstmt.setString(3,  member.getEmail());
			pstmt.setString(4,  member.getAddress());
			pstmt.setString(5,  member.getInterest());
			pstmt.setString(6,  member.getUserId());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}




	public int deleteMember(Connection conn, String userId) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("deleteMember");
		
		try {
		pstmt = conn.prepareStatement(query);
		pstmt.setString(1, userId);
		
		
		result = pstmt.executeUpdate();
		
	} catch (SQLException e) {
		e.printStackTrace();
	}finally {
		close(pstmt);
	}
	
	return result;
	}



}

