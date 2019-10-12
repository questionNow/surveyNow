package survey.model.vo;

import java.io.Serializable;

public class SurveyType implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1856280958664960580L;
	
	private String sType;
	private String stName;
	private String sCode;
	public SurveyType() {
	
	}
	public SurveyType(String sType, String stName, String sCode) {
		super();
		this.sType = sType;
		this.stName = stName;
		this.sCode = sCode;
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
	public String getsCode() {
		return sCode;
	}
	public void setsCode(String sCode) {
		this.sCode = sCode;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		return "SurveyType [sType=" + sType + ", stName=" + stName + ", sCode=" + sCode + "]";
	}
	
	
	
	

}
