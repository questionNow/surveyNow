package survey.model.vo;

import java.io.Serializable;

public class Question implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -3951460177739763598L;
	private int qNum;
	private int sNum;
	private String qType;
	private String qTitle;
	public Question() {
	
	}
	public Question(int qNum, int sNum, String qType, String qTitle) {
		super();
		this.qNum = qNum;
		this.sNum = sNum;
		this.qType = qType;
		this.qTitle = qTitle;
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
	public String getqType() {
		return qType;
	}
	public void setqType(String qType) {
		this.qType = qType;
	}
	public String getqTitle() {
		return qTitle;
	}
	public void setqTitle(String qTitle) {
		this.qTitle = qTitle;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		return "Question [qNum=" + qNum + ", sNum=" + sNum + ", qType=" + qType + ", qTitle=" + qTitle + "]";
	}
	
	
}
