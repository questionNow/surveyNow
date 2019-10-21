package user.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class UserInfo implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -7487973697633513418L;
	
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
	
	
	public UserInfo() {

	}

	
	
	public UserInfo(String userId, String userPwd) {
		super();
		this.userId = userId;
		this.userPwd = userPwd;
	}
	
	





	public UserInfo(String userId, String userName, int age, String email, String phone, String address,
			String finalEducation, String job, String income, String livingType, String houseType, String religion,
			String maritalStatus, String livingWith, String armyGo) {
		super();
		this.userId = userId;
		this.userName = userName;
		this.age = age;
		this.email = email;
		this.phone = phone;
		this.address = address;
		this.finalEducation = finalEducation;
		this.job = job;
		this.income = income;
		this.livingType = livingType;
		this.houseType = houseType;
		this.religion = religion;
		this.maritalStatus = maritalStatus;
		this.livingWith = livingWith;
		this.armyGo = armyGo;

	}



	public UserInfo(String userId, String userPwd, String userName, int age, String gender, String email, String phone,
			String address, String recommendId, String finalEducation, String job, String income, String livingType,
			String houseType, String religion, String maritalStatus, String livingWith, String armyGo, String interest) {
		super();
		this.userId = userId;
		this.userPwd = userPwd;
		this.userName = userName;
		this.age = age;
		this.gender = gender;
		this.email = email;
		this.phone = phone;
		this.address = address;
		this.recommendId = recommendId;
		this.finalEducation = finalEducation;
		this.job = job;
		this.income = income;
		this.livingType = livingType;
		this.houseType = houseType;
		this.religion = religion;
		this.maritalStatus = maritalStatus;
		this.livingWith = livingWith;
		this.armyGo = armyGo;
		this.interest = interest;
	}
	
	public UserInfo(String userId, String userPwd, String userName, int age, String gender, String email, String phone,
			String address, String recommendId, int surveyCount, int visitCount, int userType, String status,
			String finalEducation, String job, String income, String livingType, String houseType, String religion,
			String maritalStatus, String livingWith, String armyGo, String interest, Date pwdDate) {
		super();
		this.userId = userId;
		this.userPwd = userPwd;
		this.userName = userName;
		this.age = age;
		this.gender = gender;
		this.email = email;
		this.phone = phone;
		this.address = address;
		this.recommendId = recommendId;
		this.surveyCount = surveyCount;
		this.visitCount = visitCount;
		this.userType = userType;
		this.status = status;
		this.finalEducation = finalEducation;
		this.job = job;
		this.income = income;
		this.livingType = livingType;
		this.houseType = houseType;
		this.religion = religion;
		this.maritalStatus = maritalStatus;
		this.livingWith = livingWith;
		this.armyGo = armyGo;
		this.interest = interest;
		this.pwdDate = pwdDate;
		
	}




	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPwd() {
		return userPwd;
	}
	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getRecommendId() {
		return recommendId;
	}
	public void setRecommendId(String recommendId) {
		this.recommendId = recommendId;
	}
	public int getSurveyCount() {
		return surveyCount;
	}
	public void setSurveyCount(int surveyCount) {
		this.surveyCount = surveyCount;
	}
	public int getVisitCount() {
		return visitCount;
	}
	public void setVisitCount(int visitCount) {
		this.visitCount = visitCount;
	}
	public int getUserType() {
		return userType;
	}
	public void setUserType(int userType) {
		this.userType = userType;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getFinalEducation() {
		return finalEducation;
	}
	public void setFinalEducation(String finalEducation) {
		this.finalEducation = finalEducation;
	}
	public String getJob() {
		return job;
	}
	public void setJob(String job) {
		this.job = job;
	}
	public String getIncome() {
		return income;
	}
	public void setIncome(String income) {
		this.income = income;
	}
	public String getLivingType() {
		return livingType;
	}
	public void setLivingType(String livingType) {
		this.livingType = livingType;
	}
	public String getHouseType() {
		return houseType;
	}
	public void setHouseType(String houseType) {
		this.houseType = houseType;
	}
	public String getReligion() {
		return religion;
	}
	public void setReligion(String religion) {
		this.religion = religion;
	}
	public String getMaritalStatus() {
		return maritalStatus;
	}
	public void setMaritalStatus(String maritalStatus) {
		this.maritalStatus = maritalStatus;
	}
	public String getLivingWith() {
		return livingWith;
	}
	public void setLivingWith(String livingWith) {
		this.livingWith = livingWith;
	}
	public String getArmyGo() {
		return armyGo;
	}
	public void setArmyGo(String armyGo) {
		this.armyGo = armyGo;
	}
	public String getInterest() {
		return interest;
	}
	public void setInterest(String interest) {
		this.interest = interest;
	}
	public Date getPwdDate() {
		return pwdDate;
	}
	public void setPwdDate(Date pwdDate) {
		this.pwdDate = pwdDate;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		return "UserInfo [userId=" + userId + ", userPwd=" + userPwd + ", userName=" + userName + ", age=" + age
				+ ", gender=" + gender + ", email=" + email + ", phone=" + phone + ", address=" + address
				+ ", recommendId=" + recommendId + ", surveyCount=" + surveyCount + ", visitCount=" + visitCount
				+ ", userType=" + userType + ", status=" + status + ", finalEducation=" + finalEducation + ", job="
				+ job + ", income=" + income + ", livingType=" + livingType + ", houseType=" + houseType + ", religion="
				+ religion + ", maritalStatus=" + maritalStatus + ", livingWith=" + livingWith + ", armyGo=" + armyGo
				+ ", interest=" + interest + ", pwdDate=" + pwdDate + "]";
	}
}