package survey.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import survey.model.service.SurveyService;
import survey.model.vo.Survey;

/**
 * Servlet implementation class CompleteSurveyServlet
 */
@WebServlet("/complete.sv")
public class Admin_CompleteSurveyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Admin_CompleteSurveyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = request.getParameter("userId");

		ArrayList<Survey> sList = new SurveyService().adminFinishedSurvey(userId);
		
		RequestDispatcher view = null;
		
		
		
		if(sList != null) {
			view = request.getRequestDispatcher("views/admin/compSurveyView.jsp");
			request.setAttribute("list", sList);
		}else {
		}
		
		view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
