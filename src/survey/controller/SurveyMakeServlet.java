package survey.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import survey.model.service.SurveyService;
import survey.model.vo.Survey;
import survey.model.vo.SurveyTarget;

/**
 * Servlet implementation class SurveyMakeServlet
 */
@WebServlet("/surveyMake.sv")
public class SurveyMakeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SurveyMakeServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ArrayList<String[]> targetList = new ArrayList<String[]>();
		String[] targetType = null;
		String[] targetDetail = null;
		SurveyTarget st = null;
		if(request.getParameterValues("targetType") != null) {
			targetType = request.getParameterValues("targetType");
			for(int i = 0 ; i<targetType.length ; i ++) {
				targetDetail = request.getParameterValues(targetType[i]);
				targetList.add(targetDetail);
				for(int j = 0; j<targetDetail.length; j++) {
				}
			}
		st = new SurveyTarget(targetType, targetList);
		}
		
		
		String sTitle = request.getParameter("sTitle");
		String userId = request.getParameter("userId");
		int sPoint = Integer.valueOf(request.getParameter("sPoint"));
		int sCount = Integer.valueOf(request.getParameter("sCount"));
		String[] qNum = request.getParameterValues("Qnum");
		String[] qType = request.getParameterValues("Qtype");
		String[] qTitle = request.getParameterValues("Qtitle");
		String sCategory = request.getParameter("sCategory");
		
		
		Survey s = new Survey();
		s.setsUserId(userId);
		s.setsTitle(sTitle);
		s.setsType(sCategory);
		s.setsPoint(sPoint);
		s.setsCount(sCount);
		s.setqCount(qNum.length);
		ArrayList<String[]> answer = new ArrayList();
		for (String Q : qNum) {
			String[] ans = request.getParameterValues(Q);
			answer.add(ans);
		}
		int result = new SurveyService().makeSurvey(s, st, qNum, qType, qTitle, answer);
		response.sendRedirect("surveyHoldList.sv?userId="+userId);
		;

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
