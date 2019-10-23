package mypage.model.vo;

import java.io.Serializable;

public class QnA implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -537720166147060801L;

	
	private int qnaNum; 
	private String userId;
	private String qnaTitle;
	private String qnaContent;
	private String qnaType;
	private String aContent;
	private String aStatus;
	public QnA() {
		super();
	}
	
	
	
	public QnA(int qnaNum, String userId, String qnaTitle, String qnaContent, String qnaType) {
		super();
		this.qnaNum = qnaNum;
		this.userId = userId;
		this.qnaTitle = qnaTitle;
		this.qnaContent = qnaContent;
		this.qnaType = qnaType;
	}



	public QnA(int qnaNum, String userId, String qnaTitle, String qnaContent, String qnaType, String aContent,
			String aStatus) {
		super();
		this.qnaNum = qnaNum;
		this.userId = userId;
		this.qnaTitle = qnaTitle;
		this.qnaContent = qnaContent;
		this.qnaType = qnaType;
		this.aContent = aContent;
		this.aStatus = aStatus;
	}
	public int getQnaNum() {
		return qnaNum;
	}
	public void setQnaNum(int qnaNum) {
		this.qnaNum = qnaNum;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getQnaTitle() {
		return qnaTitle;
	}
	public void setQnaTitle(String qnaTitle) {
		this.qnaTitle = qnaTitle;
	}
	public String getQnaContent() {
		return qnaContent;
	}
	public void setQnaContent(String qnaContent) {
		this.qnaContent = qnaContent;
	}
	public String getQnaType() {
		return qnaType;
	}
	public void setQnaType(String qnaType) {
		this.qnaType = qnaType;
	}
	public String getaContent() {
		return aContent;
	}
	public void setaContent(String aContent) {
		this.aContent = aContent;
	}
	public String getaStatus() {
		return aStatus;
	}
	public void setaStatus(String aStatus) {
		this.aStatus = aStatus;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		return "Board [qnaNum=" + qnaNum + ", userId=" + userId + ", qnaTitle=" + qnaTitle + ", qnaContent="
				+ qnaContent + ", qnaType=" + qnaType + ", aContent=" + aContent + ", aStatus=" + aStatus + "]";
	}		

	
	
}
