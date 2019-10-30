package product.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class BuyProduct implements Serializable {

	private static final long serialVersionUID = -6131855561432833932L;

	private int bnum;
	private int pronum;
	private String userid;
	private int price;
	private Date buyDate;

	public BuyProduct() {}

	public BuyProduct(int bnum, int pronum, String userid, int price, Date buyDate) {
		this.bnum = bnum;
		this.pronum = pronum;
		this.userid = userid;
		this.price = price;
		this.buyDate = buyDate;
	}

	public int getBnum() {
		return bnum;
	}

	public void setBnum(int bnum) {
		this.bnum = bnum;
	}

	public int getPronum() {
		return pronum;
	}

	public void setPronum(int pronum) {
		this.pronum = pronum;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public Date getBuyDate() {
		return buyDate;
	}

	public void setBuyDate(Date buyDate) {
		this.buyDate = buyDate;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "BuyProduct [bnum=" + bnum + ", pronum=" + pronum + ", userid=" + userid + ", price=" + price
				+ ", buyDate=" + buyDate + "]";
	}

}
