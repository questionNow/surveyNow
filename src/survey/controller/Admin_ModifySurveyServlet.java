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
 * Servlet implementation class ModifySurveyServlet
 */
@WebServlet("/Admin_surveyModify.sv")
public class Admin_ModifySurveyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Admin_ModifySurveyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int sNum = Integer.valueOf(request.getParameter("sNum"));
		String userId = request.getParameter("userId");
		
		ArrayList<DoSurvey> dsList = new SurveyService().adminModifySurvey(sNum);
		request.setAttribute("dsList", dsList);
		request.setAttribute("userId", userId);
		request.getRequestDispatcher("views/admin/admin_ModifySurvey.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
