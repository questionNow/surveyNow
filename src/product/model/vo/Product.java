package product.model.vo;

import java.io.Serializable;

public class Product implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 4502798713914275391L;
	private int proNum;
	private String categoryId;
	private String proName;
	private int price;
	private String proText;
	private int proCount;
	public Product() {
	
	}
	public Product(int proNum, String categoryId, String proName, int price, String proText, int proCount) {
		super();
		this.proNum = proNum;
		this.categoryId = categoryId;
		this.proName = proName;
		this.price = price;
		this.proText = proText;
		this.proCount = proCount;
	}
	public int getProNum() {
		return proNum;
	}
	public void setProNum(int proNum) {
		this.proNum = proNum;
	}
	public String getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(String categoryId) {
		this.categoryId = categoryId;
	}
	public String getProName() {
		return proName;
	}
	public void setProName(String proName) {
		this.proName = proName;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getProText() {
		return proText;
	}
	public void setProText(String proText) {
		this.proText = proText;
	}
	public int getProCount() {
		return proCount;
	}
	public void setProCount(int proCount) {
		this.proCount = proCount;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		return "Product [proNum=" + proNum + ", categoryId=" + categoryId + ", proName=" + proName + ", price=" + price
				+ ", proText=" + proText + ", proCount=" + proCount + "]";
	}
	
	
	
	
}
