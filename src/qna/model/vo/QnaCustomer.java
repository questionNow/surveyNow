package qna.model.vo;

import java.io.Serializable;

public class QnaCustomer implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 5593274793451620597L;

	private int qnaNum;
	private String userId;
	private String qnaTitle;
	private String qnaContent;
	private String qnaType;
	private String aContent;
	
	public QnaCustomer() {
	}
	
	public QnaCustomer(int qnaNum, String userId, String qnaTitle, String qnaContent, String qnaType,
			String aContent) {
		super();
		this.qnaNum = qnaNum;
		this.userId = userId;
		this.qnaTitle = qnaTitle;
		this.qnaContent = qnaContent;
		this.qnaType = qnaType;
		this.aContent = aContent;
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

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "QnaCustomer [qnaNum=" + qnaNum + ", userId=" + userId + ", qnaTitle=" + qnaTitle + ", qnaContent="
				+ qnaContent + ", qnaType=" + qnaType + ", aContent=" + aContent + "]";
	}
	
	
	
	
}
