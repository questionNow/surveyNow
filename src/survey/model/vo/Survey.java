package survey.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Survey implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -5412214412295286625L;

	private int sNum;
	private String sType;
	private String sTitle;
	private Date sEndDate;
	private Date sStartDate;
	private int sCount;
	private int sPoint;
	private int qCount;
	private int aCount;
	private String sStatus;
	private String sTarget;
	private Date sCreateDate;
	private String sUserId;
	public Survey() {

	}
	public Survey(int sNum, String sType, String sTitle, Date sEndDate, Date sStartDate, int sCount, int sPoint,
			int qCount, int aCount, String sStatus, String sTarget, Date sCreateDate, String sUserId) {
		super();
		this.sNum = sNum;
		this.sType = sType;
		this.sTitle = sTitle;
		this.sEndDate = sEndDate;
		this.sStartDate = sStartDate;
		this.sCount = sCount;
		this.sPoint = sPoint;
		this.qCount = qCount;
		this.aCount = aCount;
		this.sStatus = sStatus;
		this.sTarget = sTarget;
		this.sCreateDate = sCreateDate;
		this.sUserId = sUserId;
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
	public Date getsEndDate() {
		return sEndDate;
	}
	public void setsEndDate(Date sEndDate) {
		this.sEndDate = sEndDate;
	}
	public Date getsStartDate() {
		return sStartDate;
	}
	public void setsStartDate(Date sStartDate) {
		this.sStartDate = sStartDate;
	}
	public int getsCount() {
		return sCount;
	}
	public void setsCount(int sCount) {
		this.sCount = sCount;
	}
	public int getsPoint() {
		return sPoint;
	}
	public void setsPoint(int sPoint) {
		this.sPoint = sPoint;
	}
	public int getqCount() {
		return qCount;
	}
	public void setqCount(int qCount) {
		this.qCount = qCount;
	}
	public int getaCount() {
		return aCount;
	}
	public void setaCount(int aCount) {
		this.aCount = aCount;
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
	public Date getsCreateDate() {
		return sCreateDate;
	}
	public void setsCreateDate(Date sCreateDate) {
		this.sCreateDate = sCreateDate;
	}
	public String getsUserId() {
		return sUserId;
	}
	public void setsUserId(String sUserId) {
		this.sUserId = sUserId;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		return "Survey [sNum=" + sNum + ", sType=" + sType + ", sTitle=" + sTitle + ", sEndDate=" + sEndDate
				+ ", sStartDate=" + sStartDate + ", sCount=" + sCount + ", sPoint=" + sPoint + ", qCount=" + qCount
				+ ", aCount=" + aCount + ", sStatus=" + sStatus + ", sTarget=" + sTarget + ", sCreateDate="
				+ sCreateDate + ", sUserId=" + sUserId + "]";
	}
	
	
}
