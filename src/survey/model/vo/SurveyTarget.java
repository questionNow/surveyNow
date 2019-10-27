package survey.model.vo;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Arrays;

public class SurveyTarget implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 4464354407101272709L;

	private int svNum;
	private int sNum;
	private String[] targetType;
	private ArrayList<String[]> targetDetail;
	public SurveyTarget() {
	}
	
	public SurveyTarget(String[] targetType, ArrayList<String[]> targetDetail) {
		super();
		this.targetType = targetType;
		this.targetDetail = targetDetail;
	}

	public SurveyTarget(int svNum, int sNum, String[] targetType, ArrayList<String[]> targetDetail) {
		super();
		this.svNum = svNum;
		this.sNum = sNum;
		this.targetType = targetType;
		this.targetDetail = targetDetail;
	}
	public int getSvNum() {
		return svNum;
	}
	public void setSvNum(int svNum) {
		this.svNum = svNum;
	}
	public int getsNum() {
		return sNum;
	}
	public void setsNum(int sNum) {
		this.sNum = sNum;
	}
	public String[] getTargetType() {
		return targetType;
	}
	public void setTargetType(String[] targetType) {
		this.targetType = targetType;
	}
	public ArrayList<String[]> getTargetDetail() {
		return targetDetail;
	}
	public void setTargetDetail(ArrayList<String[]> targetDetail) {
		this.targetDetail = targetDetail;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		return "SurveyTarget [svNum=" + svNum + ", sNum=" + sNum + ", targetType=" + Arrays.toString(targetType)
				+ ", targetDetail=" + targetDetail + "]";
	}
		
}
