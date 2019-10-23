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
	private int answerCount;
	public Answer() {
	}
	public Answer(int aNum, int qNum, int sNum, String aContent, int answerCount) {
		super();
		this.aNum = aNum;
		this.qNum = qNum;
		this.sNum = sNum;
		this.aContent = aContent;
		this.answerCount = answerCount;
	}
	
	
	public Answer(int aNum, int qNum, String aContent, int answerCount) {
		super();
		this.aNum = aNum;
		this.qNum = qNum;
		this.aContent = aContent;
		this.answerCount = answerCount;
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
	public int getsNum() {
		return sNum;
	}
	public void setsNum(int sNum) {
		this.sNum = sNum;
	}
	public String getaContent() {
		return aContent;
	}
	public void setaContent(String aContent) {
		this.aContent = aContent;
	}
	public String getEayn() {
		return eayn;
	}
	public void setEayn(String eayn) {
		this.eayn = eayn;
	}
	public int getAnswerCount() {
		return answerCount;
	}
	public void setAnswerCount(int answerCount) {
		this.answerCount = answerCount;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		return "Answer [aNum=" + aNum + ", qNum=" + qNum + ", sNum=" + sNum + ", aContent=" + aContent + ", eayn="
				+ eayn + ", answerCount=" + answerCount + "]";
	}
		
}