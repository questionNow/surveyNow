package user.model.service;

import static common.JDBCTemplate.*;

import java.sql.*;

import user.model.dao.UserDao;
import user.model.vo.UserInfo;

import java.sql.Connection;

public class UserService {

	// 로그인 처리를 위한 상수 선언
	public static int LOGIN_OK = 1;
	public static int WRONG_PASSWORD = 0;
	public static int ID_NOT_EXIST = -1;

	public UserService() {
	}

	// SDB 로그인
	public UserInfo loginUser(UserInfo user) {
		Connection conn = getConnection();

		UserInfo loginUser = new UserDao().loginUser(conn, user);

		close(conn);

		return loginUser;
	}

	// SDB -TEST_정보수정 되는지 확인용
	public UserInfo selectMember(String userId) {
		Connection conn = getConnection();

		UserInfo user = new UserDao().selectUser(conn, userId);

		close(conn);

		return user;
	}

	// SeoJaeWoong 회원가입
	public int registerUser(UserInfo userInfo) {
		Connection conn = getConnection();
		UserDao uDao = new UserDao();
		int result = uDao.registerUser(conn, userInfo);

		if (result > 0) {
			// 가입시 감사 포인트 추가
			int result2 = uDao.registerPoint(conn, userInfo);
			if (userInfo.getRecommendId().length() >4) {
				// 추천인 등록한 가입자 포인트 추가
				int result4 = uDao.recPoint2(conn,userInfo);
				int result5 = uDao.recUserPointUpdate(conn, userInfo);
				// 추천 대상 포인트 추가
				int result3 = uDao.recPoint(conn, userInfo);
				int result6 = uDao.recPointUpdate(conn, userInfo);
			}
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	// SeoJaeWoong 아이디 중복체크
	public int idCheck(String userId) {
		Connection conn = getConnection();
		int result = new UserDao().idCheck(conn, userId);
		System.out.println("Service 검사" + result);
		close(conn);
		return result;
	}

	// SeoJaeWoong 아이디 찾기 (이메일)
	public UserInfo findIdEmail(UserInfo findData) {
		Connection conn = getConnection();
		UserInfo findId = new UserDao().findIdEmail(conn, findData);

		System.out.println("서비스쪽 : " + findId);
		close(conn);
		return findId;
	}

	// SeoJaeWoong 아이디 찾기 (핸드폰)
	public UserInfo findIdPhone(UserInfo findData) {
		Connection conn = getConnection();
		UserInfo findId = new UserDao().findIdPhone(conn, findData);

		System.out.println("서비스쪽 : " + findId);
		close(conn);
		return findId;
	}

	// SeoJaeWoong 비밀번호 찾기(이메일)
	public UserInfo findPwdEmail(UserInfo findData) {
		Connection conn = getConnection();
		UserInfo findPwd = new UserDao().findPwdEmail(conn, findData);
		System.out.println("서비스쪽 : " + findPwd);
		close(conn);
		return findPwd;
	}

	// SeoJaeWopng 비밀번호 찾기(핸드폰)
	public UserInfo findPwdPhone(UserInfo findData) {
		Connection conn = getConnection();
		UserInfo findPwd = new UserDao().findPwdPhone(conn, findData);
		System.out.println("서비스쪽 : " + findPwd);
		close(conn);
		return findPwd;
	}

	// SeoJaeWooong 비밀번호 수정
	public int changePwd(UserInfo changeData) {
		Connection conn = getConnection();
		int result = new UserDao().changePwd(conn, changeData);

		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		System.out.println("서비스쪽 : " + result);
		close(conn);
		return result;
	}

	// 회원 or 관리자 구분해서 로그인
	public static int userType(String userId) {
		Connection conn = getConnection();
		new UserDao();
		int userType = UserDao.userType(conn, userId);

		close(conn);

		return userType;
	}

	// SeoJaeWoong 추천인 아이디 점검
	public int reIdCheck(String recommendId) {
		Connection conn = getConnection();
		int result = new UserDao().reIdCheck(conn, recommendId);
		System.out.println("Service 검사" + result);
		close(conn);
		return result;
	}
}
