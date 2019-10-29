package survey.model.vo;

import java.io.Serializable;

public class SurveyType implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 62107476537376921L;

	private String sType;
	private String stName;
	public SurveyType() {
	
	}
	public SurveyType(String sType, String stName) {
		super();
		this.sType = sType;
		this.stName = stName;
	}
	public String getsType() {
		return sType;
	}
	public void setsType(String sType) {
		this.sType = sType;
	}
	public String getStName() {
		return stName;
	}
	public void setStName(String stName) {
		this.stName = stName;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		return "SurveyType [sType=" + sType + ", stName=" + stName + "]";
	}
	
	
	
	
	
	
}
