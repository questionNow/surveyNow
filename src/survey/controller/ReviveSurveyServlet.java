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

/**
 * Servlet implementation class ReviveSurveyServlet
 */
@WebServlet("/surveyRevive.sv")
public class ReviveSurveyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviveSurveyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int sNum = Integer.valueOf(request.getParameter("sNum"));
		int result = new SurveyService().reviveSurvey(sNum);
		 if(result >0) {
			 request.setAttribute("msg", "복구 되었습니다. 확인하시려면 작성중인 설문으로 이동해주세요.");
			 request.getRequestDispatcher("views/survey/deletedSurvey.jsp").forward(request, response);
		 } else {
			 System.out.println("실패");
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
