package qna.model.vo;

import java.io.Serializable;

public class Question implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -4065952314766433572L;

	private int qNum;
	private String qTitle;
	private String qType;
	public Question() {
		super();
	}
	public Question(int qNum, String qTitle, String qType) {
		super();
		this.qNum = qNum;
		this.qTitle = qTitle;
		this.qType = qType;
	}
	public int getqNum() {
		return qNum;
	}
	public void setqNum(int qNum) {
		this.qNum = qNum;
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
		return "Question [qNum=" + qNum + ", qTitle=" + qTitle + ", qType=" + qType + "]";
	}
	
	
}
