package survey.model.vo;

import java.io.Serializable;

public class Result implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -8938974015216485585L;

	private String userId;
	private int sNum;
	private int qNum;
	private int aNum;
	private String otherAnswer;

	public Result() {

	}

	public Result(String userId, int sNum, int qNum, int aNum, String otherAnswer) {
		super();
		this.userId = userId;
		this.sNum = sNum;
		this.qNum = qNum;
		this.aNum = aNum;
		this.otherAnswer = otherAnswer;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public int getsNum() {
		return sNum;
	}

	public void setsNum(int sNum) {
		this.sNum = sNum;
	}

	public int getqNum() {
		return qNum;
	}

	public void setqNum(int qNum) {
		this.qNum = qNum;
	}

	public int getaNum() {
		return aNum;
	}

	public void setaNum(int aNum) {
		this.aNum = aNum;
	}

	public String getOtherAnswer() {
		return otherAnswer;
	}

	public void setOtherAnswer(String otherAnswer) {
		this.otherAnswer = otherAnswer;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Result [userId=" + userId + ", sNum=" + sNum + ", qNum=" + qNum + ", aNum=" + aNum + ", otherAnswer="
				+ otherAnswer + "]";
	}
	
	
}
