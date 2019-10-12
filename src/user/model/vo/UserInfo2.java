package user.model.vo;

import java.io.Serializable;

public class UserInfo2 implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -5194039595442293737L;

	private String userId;
	private String finalEducation;
	private String job;
	private String incomeSelf;
	private String incomeFamily;
	private String livingType;
	private String houseType;
	private String maritalStatus;
	private String pregnancyStatus;
	private String armyGo;
	private String livingWith;
	private String religion;
	public UserInfo2() {
	
	}
	public UserInfo2(String userId, String finalEducation, String job, String incomeSelf, String incomeFamily,
			String livingType, String houseType, String maritalStatus, String pregnancyStatus, String armyGo,
			String livingWith, String religion) {
		super();
		this.userId = userId;
		this.finalEducation = finalEducation;
		this.job = job;
		this.incomeSelf = incomeSelf;
		this.incomeFamily = incomeFamily;
		this.livingType = livingType;
		this.houseType = houseType;
		this.maritalStatus = maritalStatus;
		this.pregnancyStatus = pregnancyStatus;
		this.armyGo = armyGo;
		this.livingWith = livingWith;
		this.religion = religion;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
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
	public String getIncomeSelf() {
		return incomeSelf;
	}
	public void setIncomeSelf(String incomeSelf) {
		this.incomeSelf = incomeSelf;
	}
	public String getIncomeFamily() {
		return incomeFamily;
	}
	public void setIncomeFamily(String incomeFamily) {
		this.incomeFamily = incomeFamily;
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
	public String getMaritalStatus() {
		return maritalStatus;
	}
	public void setMaritalStatus(String maritalStatus) {
		this.maritalStatus = maritalStatus;
	}
	public String getPregnancyStatus() {
		return pregnancyStatus;
	}
	public void setPregnancyStatus(String pregnancyStatus) {
		this.pregnancyStatus = pregnancyStatus;
	}
	public String getArmyGo() {
		return armyGo;
	}
	public void setArmyGo(String armyGo) {
		this.armyGo = armyGo;
	}
	public String getLivingWith() {
		return livingWith;
	}
	public void setLivingWith(String livingWith) {
		this.livingWith = livingWith;
	}
	public String getReligion() {
		return religion;
	}
	public void setReligion(String religion) {
		this.religion = religion;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		return "User_Info2 [userId=" + userId + ", finalEducation=" + finalEducation + ", job=" + job + ", incomeSelf="
				+ incomeSelf + ", incomeFamily=" + incomeFamily + ", livingType=" + livingType + ", houseType="
				+ houseType + ", maritalStatus=" + maritalStatus + ", pregnancyStatus=" + pregnancyStatus + ", armyGo="
				+ armyGo + ", livingWith=" + livingWith + ", religion=" + religion + "]";
	}
	
	
	
}
