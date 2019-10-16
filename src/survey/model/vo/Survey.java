package survey.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Survey implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -5412214412295286625L;

	private int sNum;
	private String sType;
	private String sTitle;
	private String sUserId;
	private Date sCreateDate;
	private Date sStartDate;
	private Date sEndDate;
	private int surveyCount;
	private int sPoint;
	private int responseCount;
	private String sStatus;
	private String sTarget;
	private int questionCount;
	private String sCode;

	public Survey() {

	}

	public Survey(int sNum, String sType, String sTitle, String sUserId, Date sCreateDate, Date sStartDate,
			Date sEndDate, int surveyCount, int sPoint, int responseCount, String sStatus, String sTarget,
			int questionCount, String sCode) {
		super();
		this.sNum = sNum;
		this.sType = sType;
		this.sTitle = sTitle;
		this.sUserId = sUserId;
		this.sCreateDate = sCreateDate;
		this.sStartDate = sStartDate;
		this.sEndDate = sEndDate;
		this.surveyCount = surveyCount;
		this.sPoint = sPoint;
		this.responseCount = responseCount;
		this.sStatus = sStatus;
		this.sTarget = sTarget;
		this.questionCount = questionCount;
		this.sCode = sCode;
	}

	public int getsNum() {
		return sNum;
	}

	public void setsNum(int sNum) {
		this.sNum = sNum;
	}

	public String getsType() {
		return sType;
	}

	public void setsType(String sType) {
		this.sType = sType;
	}

	public String getsTitle() {
		return sTitle;
	}

	public void setsTitle(String sTitle) {
		this.sTitle = sTitle;
	}

	public String getsUserId() {
		return sUserId;
	}

	public void setsUserId(String sUserId) {
		this.sUserId = sUserId;
	}

	public Date getsCreateDate() {
		return sCreateDate;
	}

	public void setsCreateDate(Date sCreateDate) {
		this.sCreateDate = sCreateDate;
	}

	public Date getsStartDate() {
		return sStartDate;
	}

	public void setsStartDate(Date sStartDate) {
		this.sStartDate = sStartDate;
	}

	public Date getsEndDate() {
		return sEndDate;
	}

	public void setsEndDate(Date sEndDate) {
		this.sEndDate = sEndDate;
	}

	public int getSurveyCount() {
		return surveyCount;
	}

	public void setSurveyCount(int surveyCount) {
		this.surveyCount = surveyCount;
	}

	public int getsPoint() {
		return sPoint;
	}

	public void setsPoint(int sPoint) {
		this.sPoint = sPoint;
	}

	public int getResponseCount() {
		return responseCount;
	}

	public void setResponseCount(int responseCount) {
		this.responseCount = responseCount;
	}

	public String getsStatus() {
		return sStatus;
	}

	public void setsStatus(String sStatus) {
		this.sStatus = sStatus;
	}

	public String getsTarget() {
		return sTarget;
	}

	public void setsTarget(String sTarget) {
		this.sTarget = sTarget;
	}

	public int getQuestionCount() {
		return questionCount;
	}

	public void setQuestionCount(int questionCount) {
		this.questionCount = questionCount;
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
		return "Survey [sNum=" + sNum + ", sType=" + sType + ", sTitle=" + sTitle + ", sUserId=" + sUserId
				+ ", sCreateDate=" + sCreateDate + ", sStartDate=" + sStartDate + ", sEndDate=" + sEndDate
				+ ", surveyCount=" + surveyCount + ", sPoint=" + sPoint + ", responseCount=" + responseCount
				+ ", sStatus=" + sStatus + ", sTarget=" + sTarget + ", questionCount=" + questionCount + ", sCode="
				+ sCode + "]";
	}
	
	
	
}
