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
		ArrayList<String[]> targetList = null;
		String[] targetType = null;
		String[] targetDetail = null;
		SurveyTarget st = null;
		Survey s = new Survey();
		if (request.getParameterValues("targetType") != null) {
			targetList = new ArrayList<>();
			targetType = request.getParameterValues("targetType");
			String sTarget = "";
			for (int i = 0; i < targetType.length; i++) {
				targetDetail = new String[targetType.length];
				targetDetail = request.getParameterValues(targetType[i]);
				targetList.add(targetDetail);
				if(i == targetType.length -1) {
					sTarget += targetType[i];
				}else {
					sTarget += targetType[i] +",";
				}
			}
			st = new SurveyTarget(targetType, targetList);
			s.setsTarget(sTarget);
		}

		String sTitle = request.getParameter("sTitle");
		String userId = request.getParameter("userId");
		int sPoint = Integer.valueOf(request.getParameter("sPoint"));
		int sCount = Integer.valueOf(request.getParameter("sCount"));
		String[] qNum = request.getParameterValues("Qnum");
		String[] qType = request.getParameterValues("Qtype");
		String[] qTitle = request.getParameterValues("Qtitle");
		String sCategory = request.getParameter("sCategory");

		
		// 객관식일 경우 보기 값을 / 주관식일 경우 "주관식 을 담음"
		ArrayList<String[]> answer = new ArrayList();
		for (int i = 0; i < qType.length; i++) {
			if (qType[i].equals("객관식")) {
				String[] ans = new String[qType[i].length()];
				ans = request.getParameterValues(qNum[i]);
				answer.add(ans);
			} else if (qType[i].equals("주관식")) {
				String[] ans = new String[1];
				ans[0] = qType[i];
				answer.add(ans);
			}
		}

		
		s.setsUserId(userId);
		s.setsTitle(sTitle);
		s.setsType(sCategory);
		s.setsPoint(sPoint);
		s.setsCount(sCount);
		s.setqCount(qNum.length);

		int result = new SurveyService().makeSurvey(s, st, qNum, qType, qTitle, answer);
		response.sendRedirect("surveyHoldList.sv?userId=" + userId);

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
