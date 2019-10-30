package product.model.vo;

import java.io.Serializable;

public class Product implements Serializable {

	private static final long serialVersionUID = 4502798713914275391L;

	private int proNum;
	private String categorId;
	private String proName;
	private int pPrice;
	private String proText;
	private int proCount;

	public Product() {}

	public Product(int proNum, String categorId, String proName, int pPrice, String proText, int proCount) {
		this.proNum = proNum;
		this.categorId = categorId;
		this.proName = proName;
		this.pPrice = pPrice;
		this.proText = proText;
		this.proCount = proCount;
	}

	public int getProNum() {
		return proNum;
	}

	public void setProNum(int proNum) {
		this.proNum = proNum;
	}

	public String getCategorId() {
		return categorId;
	}

	public void setCategorId(String categorId) {
		this.categorId = categorId;
	}

	public String getProName() {
		return proName;
	}

	public void setProName(String proName) {
		this.proName = proName;
	}
	
	public int getpPrice() {
		return pPrice;
	}

	public void setpPrice(int pPrice) {
		this.pPrice = pPrice;
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
		return "Product [proNum=" + proNum + ", categorId=" + categorId + ", proName=" + proName + ", pPrice=" + pPrice
				+ ", proText=" + proText + ", proCount=" + proCount + "]";
	}
}
