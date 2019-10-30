package user.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class UserInfo implements Serializable {

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
   private String recommendId;
   private int surveyCount;
   private int visitCount;
   private int userType;
   private String status;
   private String finalEducation;
   private String job;
   private String income;
   private String livingType;
   private String houseType;
   private String religion;
   private String maritalStatus;
   private String livingWith;
   private String armyGo;
   private String interest;
   private Date pwdDate;
   private Date joinDate;
   private int point;
   private String pwdVisible;
   
public UserInfo() {}

   public UserInfo(String userId, String userPwd) {
      super();
      this.userId = userId;
      this.userPwd = userPwd;
   }
   
   public UserInfo(String pwdVisible) {
      super();
      this.pwdVisible = pwdVisible;
   }

   public UserInfo(String userId, String userPwd, String userName, int age, String email, String phone, String address,
         String finalEducation, String job, String income, String livingType, String houseType, String religion,
         String maritalStatus, String livingWith, String armyGo, String interest) {
      super();
      this.userId = userId;
      this.userPwd = userPwd;
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
      this.interest = interest;
   }
   public UserInfo(String userId, String userPwd, String userName, int age, String gender, String email, String phone,
         String address, String recommendId, String finalEducation, String job, String income, String livingType,
         String houseType, String religion, String maritalStatus, String livingWith, String armyGo,
         String interest) {
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
         String maritalStatus, String livingWith, String armyGo, String interest, Date pwdDate, Date joinDate,
         int point) {
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
      this.joinDate = joinDate;
      this.point = point;
   }

   // SDB _ 홈버튼을 위해서.. pwdVisible 생성...ㅎ(비밀번호 그냥 때려넣고 ... 사용하면...)
   public UserInfo(String userId, String userPwd, String userName, int age, String gender, String email, String phone,
      String address, String recommendId, int surveyCount, int visitCount, int userType, String status,
      String finalEducation, String job, String income, String livingType, String houseType, String religion,
      String maritalStatus, String livingWith, String armyGo, String interest, Date pwdDate, Date joinDate, int point,
      String pwdVisible) {
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
   this.joinDate = joinDate;
   this.point = point;
   this.pwdVisible = pwdVisible;
}

public String getPwdVisible() {
   return pwdVisible;
   }

   public void setPwdVisible(String pwdVisible) {
      this.pwdVisible = pwdVisible;
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

   public Date getJoinDate() {
      return joinDate;
   }

   public void setJoinDate(Date joinDate) {
      this.joinDate = joinDate;
   }

   public int getPoint() {
      return point;
   }

   public void setPoint(int point) {
      this.point = point;
   }

   public static long getSerialversionuid() {
      return serialVersionUID;
   }

@Override
public String toString() {
   return "UserInfo [userId=" + userId + ", userPwd=" + userPwd + ", userName=" + userName + ", age=" + age
         + ", gender=" + gender + ", email=" + email + ", phone=" + phone + ", address=" + address + ", recommendId="
         + recommendId + ", surveyCount=" + surveyCount + ", visitCount=" + visitCount + ", userType=" + userType
         + ", status=" + status + ", finalEducation=" + finalEducation + ", job=" + job + ", income=" + income
         + ", livingType=" + livingType + ", houseType=" + houseType + ", religion=" + religion + ", maritalStatus="
         + maritalStatus + ", livingWith=" + livingWith + ", armyGo=" + armyGo + ", interest=" + interest
         + ", pwdDate=" + pwdDate + ", joinDate=" + joinDate + ", point=" + point + ", pwdVisible=" + pwdVisible
         + "]";
}



}
