package user.model.vo;

import java.io.Serializable; 
import java.sql.Date;

public class surveyList implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -5725676525820595066L;

	private int snum;
	private String stype;
	private String stitle;
	private Date sstartdt;
	private Date senddt;
	private int scount;
	private int spoint;
	private int acount;
	private String sstatus;
	private String starget;
	private Date screatedt;
	private String suserid;

	public surveyList() {
		super();
	}

	public surveyList(int snum, String stype, String stitle, Date sstartdt, Date senddt, int scount, int spoint,
			int acount, String sstatus, String starget, Date screatedt, String suserid) {
		super();
		this.snum = snum;
		this.stype = stype;
		this.stitle = stitle;
		this.sstartdt = sstartdt;
		this.senddt = senddt;
		this.scount = scount;
		this.spoint = spoint;
		this.acount = acount;
		this.sstatus = sstatus;
		this.starget = starget;
		this.screatedt = screatedt;
		this.suserid = suserid;
	}

	public int getSnum() {
		return snum;
	}

	public void setSnum(int snum) {
		this.snum = snum;
	}

	public String getStype() {
		return stype;
	}

	public void setStype(String stype) {
		this.stype = stype;
	}

	public String getStitle() {
		return stitle;
	}

	public void setStitle(String stitle) {
		this.stitle = stitle;
	}

	public Date getSstartdt() {
		return sstartdt;
	}

	public void setSstartdt(Date sstartdt) {
		this.sstartdt = sstartdt;
	}

	public Date getSenddt() {
		return senddt;
	}

	public void setSenddt(Date senddt) {
		this.senddt = senddt;
	}

	public int getScount() {
		return scount;
	}

	public void setScount(int scount) {
		this.scount = scount;
	}

	public int getSpoint() {
		return spoint;
	}

	public void setSpoint(int spoint) {
		this.spoint = spoint;
	}

	public int getAcount() {
		return acount;
	}

	public void setAcount(int acount) {
		this.acount = acount;
	}

	public String getSstatus() {
		return sstatus;
	}

	public void setSstatus(String sstatus) {
		this.sstatus = sstatus;
	}

	public String getStarget() {
		return starget;
	}

	public void setStarget(String starget) {
		this.starget = starget;
	}

	public Date getScreatedt() {
		return screatedt;
	}

	public void setScreatedt(Date screatedt) {
		this.screatedt = screatedt;
	}

	public String getSuserid() {
		return suserid;
	}

	public void setSuserid(String suserid) {
		this.suserid = suserid;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "surveyList [snum=" + snum + ", stype=" + stype + ", stitle=" + stitle + ", sstartdt=" + sstartdt
				+ ", senddt=" + senddt + ", scount=" + scount + ", spoint=" + spoint + ", acount=" + acount
				+ ", sstatus=" + sstatus + ", starget=" + starget + ", screatedt=" + screatedt + ", suserid=" + suserid
				+ "]";
	}

}
