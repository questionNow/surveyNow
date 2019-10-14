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
	private String livingType;
	private String houseType;
	private String religion;
	private String maritalStatus;
	private String livingWith;
	private String armyGo;
	private String interest;
	public UserInfo2() {}
	
	
	public UserInfo2(String userId, String finalEducation, String job, String incomeSelf, String livingType,
			String houseType, String religion, String maritalStatus, String livingWith, String armyGo,
			String interest) {
		super();
		this.userId = userId;
		this.finalEducation = finalEducation;
		this.job = job;
		this.incomeSelf = incomeSelf;
		this.livingType = livingType;
		this.houseType = houseType;
		this.religion = religion;
		this.maritalStatus = maritalStatus;
		this.livingWith = livingWith;
		this.armyGo = armyGo;
		this.interest = interest;
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


	public static long getSerialversionuid() {
		return serialVersionUID;
	}


	@Override
	public String toString() {
		return "UserInfo2 [userId=" + userId + ", finalEducation=" + finalEducation + ", job=" + job + ", incomeSelf="
				+ incomeSelf + ", livingType=" + livingType + ", houseType=" + houseType + ", religion=" + religion
				+ ", maritalStatus=" + maritalStatus + ", livingWith=" + livingWith + ", armyGo=" + armyGo
				+ ", interest=" + interest + "]";
	}
	
	
	
}
	