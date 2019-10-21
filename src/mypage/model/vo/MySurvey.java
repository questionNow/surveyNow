package mypage.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class MySurvey implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 6710699132534529518L;
	
	// 유저 정보
	private String userId;
	private String userPwd;
	private String userName;
	private int age;
	private String gender;
	private String email;
	private String phone;
	private String address;      
	private String recommendId;  // 추천인
	private int surveyCount;     // 조사 카운트
	private int visitCount;      // 방문 카운트
	private int userType;        // 사용자 타입(1:admin / 2:일반사용자)
	private String status;			//탈퇴여부(Y:탈퇴 / N:탈퇴하지 않음)
	private String finalEducation;  // 최종학력
	private String job;				// 직업
	private String income;			// 월 평균 소득(세전) - 본인 ** 구간표시
	private String livingType;      //주거형태(월세/전세/분양/임대)
	private String houseType;       //주거 주택 유형(아파트/원룸)
	private String religion;		// 종교
	private String maritalStatus;   // 혼인여부(Y/N)
	private String livingWith;		// 동거 가족
	private String armyGo;          // 제대 여부(Y/N)
	private String interest;        // 관심분야
	private Date pwdDate;           // 비밀번호 바꾼 날짜
	
	
	
	
	
}
