package user.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Point implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 6199829392680905870L;

	private String userId;
	private int point;
	private String plusPoint;
	private Date plusePointDate;
	private String minusPoing;
	private Date minusPointDate;
	public Point() {
		super();
	}
	public Point(String userId, int point, String plusPoint, Date plusePointDate, String minusPoing,
			Date minusPointDate) {
		super();
		this.userId = userId;
		this.point = point;
		this.plusPoint = plusPoint;
		this.plusePointDate = plusePointDate;
		this.minusPoing = minusPoing;
		this.minusPointDate = minusPointDate;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public String getPlusPoint() {
		return plusPoint;
	}
	public void setPlusPoint(String plusPoint) {
		this.plusPoint = plusPoint;
	}
	public Date getPlusePointDate() {
		return plusePointDate;
	}
	public void setPlusePointDate(Date plusePointDate) {
		this.plusePointDate = plusePointDate;
	}
	public String getMinusPoing() {
		return minusPoing;
	}
	public void setMinusPoing(String minusPoing) {
		this.minusPoing = minusPoing;
	}
	public Date getMinusPointDate() {
		return minusPointDate;
	}
	public void setMinusPointDate(Date minusPointDate) {
		this.minusPointDate = minusPointDate;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		return "Point [userId=" + userId + ", point=" + point + ", plusPoint=" + plusPoint + ", plusePointDate="
				+ plusePointDate + ", minusPoing=" + minusPoing + ", minusPointDate=" + minusPointDate + "]";
	}
	
}
