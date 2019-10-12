package notice.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Notice implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 5875954839993211121L;

	private int nNum;
	private String nWriter;
	private String nTitle;
	private String nContent;
	private Date nCreateDate;
	private Date nUpdateDate;
	private String nType;
	private String nStatus;
	
	// 기본 생성자
	public Notice() {
	}
	
	// 생성자
	public Notice(int nNum, String nWriter, String nTitle, String nContent, Date nCreateDate, Date nUpdateDate,
			String nType, String nStatus) {
		super();
		this.nNum = nNum;
		this.nWriter = nWriter;
		this.nTitle = nTitle;
		this.nContent = nContent;
		this.nCreateDate = nCreateDate;
		this.nUpdateDate = nUpdateDate;
		this.nType = nType;
		this.nStatus = nStatus;
	}

	// get & set
	public int getnNum() {
		return nNum;
	}

	public void setnNum(int nNum) {
		this.nNum = nNum;
	}

	public String getnWriter() {
		return nWriter;
	}

	public void setnWriter(String nWriter) {
		this.nWriter = nWriter;
	}

	public String getnTitle() {
		return nTitle;
	}

	public void setnTitle(String nTitle) {
		this.nTitle = nTitle;
	}

	public String getnContent() {
		return nContent;
	}

	public void setnContent(String nContent) {
		this.nContent = nContent;
	}

	public Date getnCreateDate() {
		return nCreateDate;
	}

	public void setnCreateDate(Date nCreateDate) {
		this.nCreateDate = nCreateDate;
	}

	public Date getnUpdateDate() {
		return nUpdateDate;
	}

	public void setnUpdateDate(Date nUpdateDate) {
		this.nUpdateDate = nUpdateDate;
	}

	public String getnType() {
		return nType;
	}

	public void setnType(String nType) {
		this.nType = nType;
	}

	public String getnStatus() {
		return nStatus;
	}

	public void setnStatus(String nStatus) {
		this.nStatus = nStatus;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Notice [nNum=" + nNum + ", nWriter=" + nWriter + ", nTitle=" + nTitle + ", nContent=" + nContent
				+ ", nCreateDate=" + nCreateDate + ", nUpdateDate=" + nUpdateDate + ", nType=" + nType + ", nStatus="
				+ nStatus + "]";
	}
	
	
}
