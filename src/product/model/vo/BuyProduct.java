package product.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class BuyProduct implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 4716367183547184597L;

	private int bNum;
	private int proNum;
	private String buyId;
	private int bCount;
	private int totalPrice;
	private Date bDate;
	public BuyProduct() {
	
	}
	public BuyProduct(int bNum, int proNum, String buyId, int bCount, int totalPrice, Date bDate) {
		super();
		this.bNum = bNum;
		this.proNum = proNum;
		this.buyId = buyId;
		this.bCount = bCount;
		this.totalPrice = totalPrice;
		this.bDate = bDate;
	}
	public int getbNum() {
		return bNum;
	}
	public void setbNum(int bNum) {
		this.bNum = bNum;
	}
	public int getProNum() {
		return proNum;
	}
	public void setProNum(int proNum) {
		this.proNum = proNum;
	}
	public String getBuyId() {
		return buyId;
	}
	public void setBuyId(String buyId) {
		this.buyId = buyId;
	}
	public int getbCount() {
		return bCount;
	}
	public void setbCount(int bCount) {
		this.bCount = bCount;
	}
	public int getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
	public Date getbDate() {
		return bDate;
	}
	public void setbDate(Date bDate) {
		this.bDate = bDate;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		return "BuyProduct [bNum=" + bNum + ", proNum=" + proNum + ", buyId=" + buyId + ", bCount=" + bCount
				+ ", totalPrice=" + totalPrice + ", bDate=" + bDate + "]";
	}
	
	
	
}
