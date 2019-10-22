package survey.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Chart implements Serializable{

   /**
    * 
    */
   private static final long serialVersionUID = -6701078447046720829L;
   
   private int snum;
   private String stitle;
   private String starget;
   private Date sstartdt;
   private Date senddt;
   private int qnum;
   private String qtitle;
   private String content;
   private int count;
   
   
   public Chart() {
   }


public Chart(int snum, String stitle, String starget, Date sstartdt, Date senddt, int qnum, String qtitle,
		String content, int count) {
	super();
	this.snum = snum;
	this.stitle = stitle;
	this.starget = starget;
	this.sstartdt = sstartdt;
	this.senddt = senddt;
	this.qnum = qnum;
	this.qtitle = qtitle;
	this.content = content;
	this.count = count;
}


public int getSnum() {
	return snum;
}


public void setSnum(int snum) {
	this.snum = snum;
}


public String getStitle() {
	return stitle;
}


public void setStitle(String stitle) {
	this.stitle = stitle;
}


public String getStarget() {
	return starget;
}


public void setStarget(String starget) {
	this.starget = starget;
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


public int getQnum() {
	return qnum;
}


public void setQnum(int qnum) {
	this.qnum = qnum;
}


public String getQtitle() {
	return qtitle;
}


public void setQtitle(String qtitle) {
	this.qtitle = qtitle;
}


public String getContent() {
	return content;
}


public void setContent(String content) {
	this.content = content;
}


public int getCount() {
	return count;
}


public void setCount(int count) {
	this.count = count;
}


public static long getSerialversionuid() {
	return serialVersionUID;
}


@Override
public String toString() {
	return "Chart [snum=" + snum + ", stitle=" + stitle + ", starget=" + starget + ", sstartdt=" + sstartdt
			+ ", senddt=" + senddt + ", qnum=" + qnum + ", qtitle=" + qtitle + ", content=" + content + ", count="
			+ count + "]";
}

    
   
}