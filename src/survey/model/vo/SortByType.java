package survey.model.vo;

import java.io.Serializable;
import java.util.Arrays;

public class SortByType implements Serializable {
	private String userType;
	private String[] userTypeDetail;
	private int[] typeCount;
	public SortByType() {
	}
	public SortByType(String userType, String[] userTypeDetail, int[] typeCount) {
		super();
		this.userType = userType;
		this.userTypeDetail = userTypeDetail;
		this.typeCount = typeCount;
	}
	public String getUserType() {
		return userType;
	}
	public String[] getUserTypeDetail() {
		return userTypeDetail;
	}
	public int[] getTypeCount() {
		return typeCount;
	}
	@Override
	public String toString() {
		return "SortByType [userType=" + userType + ", userTypeDetail=" + Arrays.toString(userTypeDetail)
				+ ", typeCount=" + Arrays.toString(typeCount) + "]";
	}

}
