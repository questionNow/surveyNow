package product.model.vo;

import java.io.Serializable;

public class ProductCategory implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -4943069194461643802L;

	private String categoryId;
	private String categoryName;
	private String pCategory;
	public ProductCategory() {
	
	}
	public ProductCategory(String categoryId, String categoryName, String pCategory) {
		super();
		this.categoryId = categoryId;
		this.categoryName = categoryName;
		this.pCategory = pCategory;
	}
	public String getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(String categoryId) {
		this.categoryId = categoryId;
	}
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	public String getpCategory() {
		return pCategory;
	}
	public void setpCategory(String pCategory) {
		this.pCategory = pCategory;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		return "ProductCategory [categoryId=" + categoryId + ", categoryName=" + categoryName + ", pCategory="
				+ pCategory + "]";
	}
	
	
	
}
