package survey.model.vo;

import java.io.Serializable;

public class SurveyCheck implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 2187039726537002786L;
	private int snum;
	private String status;
	private String userId;
	
	public SurveyCheck() {
		super();
	}
	public SurveyCheck(int snum, String status, String userId) {
		super();
		this.snum = snum;
		this.status = status;
		this.userId = userId;
	}
	
	public int getSnum() {
		return snum;
	}
	public void setSnum(int snum) {
		this.snum = snum;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		return "SurveyCheck [snum=" + snum + ", status=" + status + ", userId=" + userId + "]";
	}
	
	
	

}
