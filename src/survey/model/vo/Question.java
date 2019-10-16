package survey.model.vo;

import java.io.Serializable;

public class Question implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -3951460177739763598L;

	private int qNum;
	private int sNum;
	private int answerCount;
	private String qTitle;
	private String qType;
	public Question() {
	
	}
	public Question(int qNum, int sNum, int answerCount, String qTitle, String qType) {
		super();
		this.qNum = qNum;
		this.sNum = sNum;
		this.answerCount = answerCount;
		this.qTitle = qTitle;
		this.qType = qType;
	}
	public int getqNum() {
		return qNum;
	}
	public void setqNum(int qNum) {
		this.qNum = qNum;
	}
	public int getsNum() {
		return sNum;
	}
	public void setsNum(int sNum) {
		this.sNum = sNum;
	}
	public int getAnswerCount() {
		return answerCount;
	}
	public void setAnswerCount(int answerCount) {
		this.answerCount = answerCount;
	}
	public String getqTitle() {
		return qTitle;
	}
	public void setqTitle(String qTitle) {
		this.qTitle = qTitle;
	}
	public String getqType() {
		return qType;
	}
	public void setqType(String qType) {
		this.qType = qType;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		return "Question [qNum=" + qNum + ", sNum=" + sNum + ", answerCount=" + answerCount + ", qTitle=" + qTitle
				+ ", qType=" + qType + "]";
	}
	
	
}
