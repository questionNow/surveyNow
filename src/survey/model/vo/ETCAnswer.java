package survey.model.vo;

import java.io.Serializable;

public class ETCAnswer implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -5708301523492414874L;

	private int eaNum;
	private int aNum;
	private String eaContent;
	private String eaYN;
	public ETCAnswer() {
	
	}
	public ETCAnswer(int eaNum, int aNum, String eaContent, String eaYN) {
		super();
		this.eaNum = eaNum;
		this.aNum = aNum;
		this.eaContent = eaContent;
		this.eaYN = eaYN;
	}
	public int getEaNum() {
		return eaNum;
	}
	public void setEaNum(int eaNum) {
		this.eaNum = eaNum;
	}
	public int getaNum() {
		return aNum;
	}
	public void setaNum(int aNum) {
		this.aNum = aNum;
	}
	public String getEaContent() {
		return eaContent;
	}
	public void setEaContent(String eaContent) {
		this.eaContent = eaContent;
	}
	public String getEaYN() {
		return eaYN;
	}
	public void setEaYN(String eaYN) {
		this.eaYN = eaYN;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		return "ETCAnswer [eaNum=" + eaNum + ", aNum=" + aNum + ", eaContent=" + eaContent + ", eaYN=" + eaYN + "]";
	}
	
	
	
}
