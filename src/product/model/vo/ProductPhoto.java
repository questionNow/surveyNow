package product.model.vo;

import java.io.Serializable;

public class ProductPhoto implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -5181198653106438922L;
	
	private int photoNum;
	private int proNum;
	private String photoName;
	private String photoPath;
	public ProductPhoto() {
	
	}
	public ProductPhoto(int photoNum, int proNum, String photoName, String photoPath) {
		super();
		this.photoNum = photoNum;
		this.proNum = proNum;
		this.photoName = photoName;
		this.photoPath = photoPath;
	}
	public int getPhotoNum() {
		return photoNum;
	}
	public void setPhotoNum(int photoNum) {
		this.photoNum = photoNum;
	}
	public int getProNum() {
		return proNum;
	}
	public void setProNum(int proNum) {
		this.proNum = proNum;
	}
	public String getPhotoName() {
		return photoName;
	}
	public void setPhotoName(String photoName) {
		this.photoName = photoName;
	}
	public String getPhotoPath() {
		return photoPath;
	}
	public void setPhotoPath(String photoPath) {
		this.photoPath = photoPath;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		return "ProductPhoto [photoNum=" + photoNum + ", proNum=" + proNum + ", photoName=" + photoName + ", photoPath="
				+ photoPath + "]";
	}
	
	
}
