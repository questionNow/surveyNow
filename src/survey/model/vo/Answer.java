package survey.model.vo;

import java.io.Serializable;

public class Answer implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 7387474610944826874L;

	private int aNum;
	private String answer;
	
	public Answer() {
		super();
	}
	public Answer(int aNum, String answer) {
		super();
		this.aNum = aNum;
		this.answer = answer;
	}
	public int getaNum() {
		return aNum;
	}
	public void setaNum(int aNum) {
		this.aNum = aNum;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		return "Answer [aNum=" + aNum + ", answer=" + answer + "]";
	}
	
}
