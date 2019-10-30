package qna.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class QnA implements Serializable {

	private static final long serialVersionUID = 6865946081699938411L;

	private int qnaNum;
	private String userId;
	private String qnaTitle;
	private String qnaConent;
	private String qnaType;
	private String aContent;
	private String answerYN;
	private Date qnaDate;
	private String adminId;
	
	public QnA() {}

	public QnA(int qnaNum, String userId, String qnaTitle, String qnaConent, String qnaType, String aContent, String answerYN, String adminId, Date qnaDate) {
		this.qnaNum = qnaNum;
		this.userId = userId;
		this.qnaTitle = qnaTitle;
		this.qnaConent = qnaConent;
		this.qnaType = qnaType;
		this.aContent = aContent;
		this.answerYN = answerYN;
		this.adminId = adminId;
		this.qnaDate = qnaDate;
	}

	public QnA(String adminId, String aContent) {
		this.adminId = adminId; 
		this.aContent = aContent;
	}

	public QnA(int qnaNum, String userId, String qnaTitle, String qnaConent, String qnaType, String aContent, String answerYN, Date qnaDate) {
		this.qnaNum = qnaNum;
		this.userId = userId;
		this.qnaTitle = qnaTitle;
		this.qnaConent = qnaConent;
		this.qnaType = qnaType;
		this.aContent = aContent;
		this.answerYN = answerYN;
		this.qnaDate = qnaDate;
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

	public String getQnaConent() {
		return qnaConent;
	}

	public void setQnaConent(String qnaConent) {
		this.qnaConent = qnaConent;
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
	
	public String getAnswerYN() {
		return answerYN;
	}

	public void setAnswerYN(String answerYN) {
		this.answerYN = answerYN;
	}

	public Date getQnaDate() {
		return qnaDate;
	}

	public void setQnaDate(Date qnaDate) {
		this.qnaDate = qnaDate;
	}
	
	public String getAdminId() {
		return adminId;
	}

	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "QnA [qnaNum=" + qnaNum + ", userId=" + userId + ", qnaTitle=" + qnaTitle + ", qnaConent=" + qnaConent
				+ ", qnaType=" + qnaType + ", aContent=" + aContent + ", answerYN=" + answerYN + ", qnaDate=" + qnaDate
				+ ", adminId=" + adminId + "]";
	}
}
