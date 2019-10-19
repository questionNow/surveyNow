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
	
	
	public DoSurvey() {
		super();
	}


	public DoSurvey(Survey s, Question q, ArrayList<Answer> a) {
		super();
		this.s = s;
		this.q = q;
		this.a = a;
	}


	public static long getSerialversionuid() {
		return serialVersionUID;
	}


	public Survey getS() {
		return s;
	}


	public Question getQ() {
		return q;
	}


	public ArrayList<Answer> getA() {
		return a;
	}


	@Override
	public String toString() {
		return "DoSurvey [s=" + s + ", q=" + q + ", a=" + a + "]";
	}
	
	
		
	
}
