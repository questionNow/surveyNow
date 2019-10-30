package point.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Point implements Serializable {

	private static final long serialVersionUID = -635060112403208913L;

	private int pNum;
	private String userId;
	private int point;
	private Date pDate;
	private String pContent;

	public Point() {
	}

	public Point(int pNum, String userId, int point, Date pDate, String pContent) {
		this.pNum = pNum;
		this.userId = userId;
		this.point = point;
		this.pDate = pDate;
		this.pContent = pContent;
	}

	public Point(String userId, int point) {
		this.userId = userId;
		this.point = point;
	}

	public int getpNum() {
		return pNum;
	}

	public void setpNum(int pNum) {
		this.pNum = pNum;
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

	public Date getpDate() {
		return pDate;
	}

	public void setpDate(Date pDate) {
		this.pDate = pDate;
	}

	public String getpContent() {
		return pContent;
	}

	public void setpContent(String pContent) {
		this.pContent = pContent;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Point [pNum=" + pNum + ", userId=" + userId + ", point=" + point + ", pDate=" + pDate + ", pContent="
				+ pContent + "]";
	}

}
