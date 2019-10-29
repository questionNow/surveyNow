package survey.model.vo;

import java.io.Serializable;

public class GenderChart implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 3569842249935345988L;
	
	private String gender;
	private int stats;
	
	
	public GenderChart() {
		super();
	}


	public GenderChart(String gender, int stats) {
		super();
		this.gender = gender;
		this.stats = stats;
	}


	public String getGender() {
		return gender;
	}


	public void setGender(String gender) {
		this.gender = gender;
	}


	public int getStats() {
		return stats;
	}


	public void setStats(int stats) {
		this.stats = stats;
	}


	public static long getSerialversionuid() {
		return serialVersionUID;
	}


	@Override
	public String toString() {
		return "GenderChart [gender=" + gender + ", stats=" + stats + "]";
	}


}
