package mypage.model.vo;

import java.sql.Date;

public class attendence {

			private int attnum;
		private String userid;
		private int attpoint;
		private int attcount;
		private Date attdate;
		
		public attendence() {
			super();
		}
		
		public attendence(int attnum, String userid, int attpoint, int attcount, Date attdate) {
			super();
			this.attnum = attnum;
			this.userid = userid;
			this.attpoint = attpoint;
			this.attcount = attcount;
			this.attdate = attdate;
		}
		public int getAttnum() {
			return attnum;
		}
		public void setAttnum(int attnum) {
			this.attnum = attnum;
		}
		public String getUserid() {
			return userid;
		}
		public void setUserid(String userid) {
			this.userid = userid;
		}
		public int getAttpoint() {
			return attpoint;
		}
		public void setAttpoint(int attpoint) {
			this.attpoint = attpoint;
		}
		public int getAttcount() {
			return attcount;
		}
		public void setAttcount(int attcount) {
			this.attcount = attcount;
		}
		public Date getAttdate() {
			return attdate;
		}
		public void setAttdate(Date attdate) {
			this.attdate = attdate;
		}
		@Override
		public String toString() {
			return "attendence [attnum=" + attnum + ", userid=" + userid + ", attpoint=" + attpoint + ", attcount="
					+ attcount + ", attdate=" + attdate + "]";
		}
		
		
	}

