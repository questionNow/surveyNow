package notice.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Comments implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -336956955107748213L;

	private int cNum;
	private int nNum;
	private String cWriter;
	private String cContent;
	private Date cCreateDate;
	private Date cUpdateDate;
	private String cStatus;
	
	// 기본 생성자
	public Comments() {
	}

	// 생성자
	public Comments(int cNum, int nNum, String cWriter, String cContent, Date cCreateDate, Date cUpdateDate,
			String cStatus) {
		super();
		this.cNum = cNum;
		this.nNum = nNum;
		this.cWriter = cWriter;
		this.cContent = cContent;
		this.cCreateDate = cCreateDate;
		this.cUpdateDate = cUpdateDate;
		this.cStatus = cStatus;
	}

	// get & set
	public int getcNum() {
		return cNum;
	}

	public void setcNum(int cNum) {
		this.cNum = cNum;
	}

	public int getnNum() {
		return nNum;
	}

	public void setnNum(int nNum) {
		this.nNum = nNum;
	}

	public String getcWriter() {
		return cWriter;
	}

	public void setcWriter(String cWriter) {
		this.cWriter = cWriter;
	}

	public String getcContent() {
		return cContent;
	}

	public void setcContent(String cContent) {
		this.cContent = cContent;
	}

	public Date getcCreateDate() {
		return cCreateDate;
	}

	public void setcCreateDate(Date cCreateDate) {
		this.cCreateDate = cCreateDate;
	}

	public Date getcUpdateDate() {
		return cUpdateDate;
	}

	public void setcUpdateDate(Date cUpdateDate) {
		this.cUpdateDate = cUpdateDate;
	}

	public String getcStatus() {
		return cStatus;
	}

	public void setcStatus(String cStatus) {
		this.cStatus = cStatus;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Comments [cNum=" + cNum + ", nNum=" + nNum + ", cWriter=" + cWriter + ", cContent=" + cContent
				+ ", cCreateDate=" + cCreateDate + ", cUpdateDate=" + cUpdateDate + ", cStatus=" + cStatus + "]";
	}
	
}
