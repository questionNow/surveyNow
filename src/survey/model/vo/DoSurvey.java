package survey.model.vo;

import java.io.Serializable;
import java.util.ArrayList;

public class DoSurvey implements Serializable{

	
    /**
	 * 	
	 */
	private static final long serialVersionUID = -2074972443780512070L;
	
	private Survey s;
	private Question q;
	private ArrayList<Answer> a;
	private int aCount;
	
	public DoSurvey() {

	}

	public DoSurvey(Survey s, Question q, ArrayList<Answer> a, int aCount) {
		super();
		this.s = s;
		this.q = q;
		this.a = a;
		this.aCount = aCount;
	}

	public Survey getS() {
		return s;
	}

	public void setS(Survey s) {
		this.s = s;
	}

	public Question getQ() {
		return q;
	}

	public void setQ(Question q) {
		this.q = q;
	}

	public ArrayList<Answer> getA() {
		return a;
	}

	public void setA(ArrayList<Answer> a) {
		this.a = a;
	}

	public int getaCount() {
		return aCount;
	}

	public void setaCount(int aCount) {
		this.aCount = aCount;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "DoSurvey [s=" + s + ", q=" + q + ", a=" + a + ", aCount=" + aCount + "]";
	}

}
