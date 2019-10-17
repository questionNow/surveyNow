package notice.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Reply implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 8188438616006949413L;

	private int replyNum;
	private int nNum;
	private String replyId;
	private String replyText;
	private Date replyDate;
	private String replyStatus;
	public Reply() {
	
	}
	public Reply(int replyNum, int nNum, String replyId, String replyText, Date replyDate, String replyStatus) {
		super();
		this.replyNum = replyNum;
		this.nNum = nNum;
		this.replyId = replyId;
		this.replyText = replyText;
		this.replyDate = replyDate;
		this.replyStatus = replyStatus;
	}
	public int getReplyNum() {
		return replyNum;
	}
	public void setReplyNum(int replyNum) {
		this.replyNum = replyNum;
	}
	public int getnNum() {
		return nNum;
	}
	public void setnNum(int nNum) {
		this.nNum = nNum;
	}
	public String getReplyId() {
		return replyId;
	}
	public void setReplyId(String replyId) {
		this.replyId = replyId;
	}
	public String getReplyText() {
		return replyText;
	}
	public void setReplyText(String replyText) {
		this.replyText = replyText;
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
	@Override
	public String toString() {
		return "Reply [replyNum=" + replyNum + ", nNum=" + nNum + ", replyId=" + replyId + ", replyText=" + replyText
				+ ", replyDate=" + replyDate + ", replyStatus=" + replyStatus + "]";
	}
	
	
	
}
