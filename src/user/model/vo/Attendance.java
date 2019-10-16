package user.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Attendance implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -6308859992781613714L;
	private int attNum;
	private String userId;
	private int attPoint;
	private int attCount;
	private Date attDate;
	public Attendance() {
	
	}
	public Attendance(int attNum, String userId, int attPoint, int attCount, Date attDate) {
		super();
		this.attNum = attNum;
		this.userId = userId;
		this.attPoint = attPoint;
		this.attCount = attCount;
		this.attDate = attDate;
	}
	public int getAttNum() {
		return attNum;
	}
	public void setAttNum(int attNum) {
		this.attNum = attNum;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getAttPoint() {
		return attPoint;
	}
	public void setAttPoint(int attPoint) {
		this.attPoint = attPoint;
	}
	public int getAttCount() {
		return attCount;
	}
	public void setAttCount(int attCount) {
		this.attCount = attCount;
	}
	public Date getAttDate() {
		return attDate;
	}
	public void setAttDate(Date attDate) {
		this.attDate = attDate;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		return "Attendance [attNum=" + attNum + ", userId=" + userId + ", attPoint=" + attPoint + ", attCount="
				+ attCount + ", attDate=" + attDate + "]";
	}
	
	
	
}
