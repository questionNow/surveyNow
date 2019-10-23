package survey.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import survey.model.service.SurveyService;

/**
 * Servlet implementation class SurveyAnswerServlet
 */
@WebServlet("/surveyAnswer.sv")
public class SurveyAnswerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SurveyAnswerServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String[] qName = request.getParameterValues("answerQnum");
		int[] qNum = new int[qName.length];
		String answer[] = new String[qName.length];
		int[] aNum = new int[qName.length];
		String[] aContent = new String[qName.length];
		for(int i = 0 ; i< qName.length ; i++) {
			qNum[i] = Integer.valueOf(qName[i]);
			answer[i] = request.getParameter(qName[i]);
			aNum[i] = Integer.valueOf(answer[i].split(",")[0]);
			aContent[i] = answer[i].split(",")[1];
		}
		int sNum = Integer.valueOf(request.getParameter("sNum"));
		String userId = request.getParameter("userId");
		int result = new SurveyService().recordAnswer(userId, sNum, qNum, aNum, aContent);
		if(result >0) {
			request.setAttribute("userId", userId);
			request.getRequestDispatcher("surveyListView.sv").forward(request, response);
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
