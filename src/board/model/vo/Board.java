package board.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Board implements Serializable {

	private static final long serialVersionUID = -5219066150385199445L;

	private int bNum;
	private String bWriter;
	private String bWName;
	private String bTitle;
	private String bContent;
	private Date bCreateDt;
	private String bType;
	private String bStatus;
	private int bCount;

	public Board() {}
	
	public Board(int bNum, String bWriter, String bWName, String bTitle, String bContent, Date bCreateDt, String bType,
			String bStatus, int bCount) {
		this.bNum = bNum;
		this.bWriter = bWriter;
		this.bWName = bWName;
		this.bTitle = bTitle;
		this.bContent = bContent;
		this.bCreateDt = bCreateDt;
		this.bType = bType;
		this.bStatus = bStatus;
		this.bCount = bCount;
	}

	public Board(String bType, String bTitle, String bContent, String bWriter ) {
		this.bType = bType;
		this.bTitle = bTitle;
		this.bContent = bContent;
		this.bWriter = bWriter;
	}

	public int getbNum() {
		return bNum;
	}

	public void setbNum(int bNum) {
		this.bNum = bNum;
	}

	public String getbWriter() {
		return bWriter;
	}

	public void setbWriter(String bWriter) {
		this.bWriter = bWriter;
	}

	public String getbWName() {
		return bWName;
	}

	public void setbWName(String bWName) {
		this.bWName = bWName;
	}

	public String getbTitle() {
		return bTitle;
	}

	public void setbTitle(String bTitle) {
		this.bTitle = bTitle;
	}

	public String getbContent() {
		return bContent;
	}

	public void setbContent(String bContent) {
		this.bContent = bContent;
	}

	public Date getbCreateDt() {
		return bCreateDt;
	}

	public void setbCreateDt(Date bCreateDt) {
		this.bCreateDt = bCreateDt;
	}

	public String getbType() {
		return bType;
	}

	public void setbType(String bType) {
		this.bType = bType;
	}

	public String getbStatus() {
		return bStatus;
	}

	public void setbStatus(String bStatus) {
		this.bStatus = bStatus;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	public int getbCount() {
		return bCount;
	}

	public void setbCount(int bCount) {
		this.bCount = bCount;
	}

	@Override
	public String toString() {
		return "Board [bNum=" + bNum + ", bWriter=" + bWriter + ", bWName=" + bWName + ", bTitle=" + bTitle
				+ ", bContent=" + bContent + ", bCreateDt=" + bCreateDt + ", bType=" + bType + ", bStatus=" + bStatus
				+ ", bCount=" + bCount + "]";
	}
}
