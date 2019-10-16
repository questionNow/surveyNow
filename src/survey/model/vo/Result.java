package survey.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Result implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -8938974015216485585L;
	private int rNum;
	private int aNum;
	private int eaNum;
	private String rUserId;
	private String rText;
	private Date rDate;
	public Result() {
	
	}
	public Result(int rNum, int aNum, int eaNum, String rUserId, String rText, Date rDate) {
		super();
		this.rNum = rNum;
		this.aNum = aNum;
		this.eaNum = eaNum;
		this.rUserId = rUserId;
		this.rText = rText;
		this.rDate = rDate;
	}
	public int getrNum() {
		return rNum;
	}
	public void setrNum(int rNum) {
		this.rNum = rNum;
	}
	public int getaNum() {
		return aNum;
	}
	public void setaNum(int aNum) {
		this.aNum = aNum;
	}
	public int getEaNum() {
		return eaNum;
	}
	public void setEaNum(int eaNum) {
		this.eaNum = eaNum;
	}
	public String getrUserId() {
		return rUserId;
	}
	public void setrUserId(String rUserId) {
		this.rUserId = rUserId;
	}
	public String getrText() {
		return rText;
	}
	public void setrText(String rText) {
		this.rText = rText;
	}
	public Date getrDate() {
		return rDate;
	}
	public void setrDate(Date rDate) {
		this.rDate = rDate;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		return "Result [rNum=" + rNum + ", aNum=" + aNum + ", eaNum=" + eaNum + ", rUserId=" + rUserId + ", rText="
				+ rText + ", rDate=" + rDate + "]";
	}
	
	
	
	
}
