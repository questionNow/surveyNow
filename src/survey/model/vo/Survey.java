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
	private Date sStartDate;
	private Date sEndDate;
	private int sCount;
	private String sStatus;
	private String sTarget;
	public Survey() {
	
	}
	public Survey(int sNum, String sType, String sTitle, Date sStartDate, Date sEndDate, int sCount, String sStatus,
			String sTarget) {
		super();
		this.sNum = sNum;
		this.sType = sType;
		this.sTitle = sTitle;
		this.sStartDate = sStartDate;
		this.sEndDate = sEndDate;
		this.sCount = sCount;
		this.sStatus = sStatus;
		this.sTarget = sTarget;
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
	public int getsCount() {
		return sCount;
	}
	public void setsCount(int sCount) {
		this.sCount = sCount;
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
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		return "Survey [sNum=" + sNum + ", sType=" + sType + ", sTitle=" + sTitle + ", sStartDate=" + sStartDate
				+ ", sEndDate=" + sEndDate + ", sCount=" + sCount + ", sStatus=" + sStatus + ", sTarget=" + sTarget
				+ "]";
	}
	
	
	
}
