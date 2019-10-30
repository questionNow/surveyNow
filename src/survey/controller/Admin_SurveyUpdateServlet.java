package survey.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import survey.model.service.SurveyService;
import survey.model.vo.Survey;
import survey.model.vo.SurveyTarget;

/**
 * Servlet implementation class Admin_SurveyUpdateServlet
 */
@WebServlet("/Admin_SurveyUpdate.sv")
public class Admin_SurveyUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Admin_SurveyUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String[] delSnum = request.getParameterValues("delSnum");
		String[] delQnum = request.getParameterValues("delQnum");
		ArrayList<String> delAnum = new ArrayList<String>();

		for(int i = 0 ; i < delQnum.length ; i++) {
			String qq = "A"+delQnum[0];
			String [] delA = request.getParameterValues(qq);
			for(int j = 0 ; j< delA.length ; j++) {
				delAnum.add(delA[j]);
			}
		}
		int result = new SurveyService().deleteModifiedSurvey(delSnum, delQnum, delAnum);
		if( result >0) {
		}
		
		
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
				System.out.println("주관식");
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

		int result1 = new SurveyService().adminMakeSurvey(s, st, qNum, qType, qTitle, answer);
		
		response.sendRedirect("all.sv");

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
