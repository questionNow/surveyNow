package survey.model.vo;

import java.io.Serializable;

public class QuestionType implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 6543700556438472641L;

	private String qType;
	private String qtName;
	public QuestionType() {

	}
	public QuestionType(String qType, String qtName) {
		super();
		this.qType = qType;
		this.qtName = qtName;
	}
	public String getqType() {
		return qType;
	}
	public void setqType(String qType) {
		this.qType = qType;
	}
	public String getQtName() {
		return qtName;
	}
	public void setQtName(String qtName) {
		this.qtName = qtName;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		return "QuestionType [qType=" + qType + ", qtName=" + qtName + "]";
	}
	
	
}
