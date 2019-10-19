package survey.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import survey.model.service.SurveyService;
import survey.model.vo.DoSurvey;

/**
 * Servlet implementation class DoSurveyServlet
 */
@WebServlet("/doSurveyDetailView.sv")
public class DoSurveyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DoSurveyServlet() {
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int sNum = Integer.valueOf(request.getParameter("sNum"));
		
		ArrayList<DoSurvey> dsList = new SurveyService().doServey(sNum);
		
		
		request.setAttribute("sNum", sNum);
		request.setAttribute("dsList", dsList);
		request.getRequestDispatcher("views/survey/detailSurveyView.jsp").forward(request, response);
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
