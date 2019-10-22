package survey.model.vo;

import java.io.Serializable;

public class Answer implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 7387474610944826874L;
	
	private int aNum;
	private int qNum;
	private int sNum;
	private String aContent;
	private String eayn;
	public Answer() {
	}
	public Answer(int aNum, int qNum, String aContent) {
		super();
		this.aNum = aNum;
		this.qNum = qNum;
		this.aContent = aContent;
	}
	public int getaNum() {
		return aNum;
	}
	public void setaNum(int aNum) {
		this.aNum = aNum;
	}
	public int getqNum() {
		return qNum;
	}
	public void setqNum(int qNum) {
		this.qNum = qNum;
	}
	public String getaContent() {
		return aContent;
	}
	public void setaContent(String aContent) {
		this.aContent = aContent;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		return "Answer [aNum=" + aNum + ", qNum=" + qNum + ", aContent=" + aContent + "]";
	}
	
}