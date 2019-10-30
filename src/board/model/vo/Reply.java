package board.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Reply implements Serializable {

	private static final long serialVersionUID = 1474052757396200987L;

	private int replyNum;
	private int bNum;
	private String replyId;
	private String replytext;
	private Date replyDate;
	private String replyStatus;

	public Reply() {}

	public Reply(int replyNum, int bNum, String replyId, String replytext, Date replyDate, String replyStatus) {
		this.replyNum = replyNum;
		this.bNum = bNum;
		this.replyId = replyId;
		this.replytext = replytext;
		this.replyDate = replyDate;
		this.replyStatus = replyStatus;
	}

	public int getReplyNum() {
		return replyNum;
	}

	public void setReplyNum(int replyNum) {
		this.replyNum = replyNum;
	}

	public String getReplyId() {
		return replyId;
	}

	public void setReplyId(String replyId) {
		this.replyId = replyId;
	}

	public String getReplytext() {
		return replytext;
	}

	public void setReplytext(String replytext) {
		this.replytext = replytext;
	}

	public Date getReplyDate() {
		return replyDate;
	}

	public void setReplyDate(Date replyDate) {
		this.replyDate = replyDate;
	}

	public String getReplyStatus() {
		return replyStatus;
	}

	public void setReplyStatus(String replyStatus) {
		this.replyStatus = replyStatus;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	public int getbNum() {
		return bNum;
	}

	public void setbNum(int bNum) {
		this.bNum = bNum;
	}

	@Override
	public String toString() {
		return "Reply [replyNum=" + replyNum + ", bNum=" + bNum + ", replyId=" + replyId + ", replytext=" + replytext
				+ ", replyDate=" + replyDate + ", replyStatus=" + replyStatus + "]";
	}
}
