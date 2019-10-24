package survey.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonObject;

import survey.model.service.SurveyService;
import survey.model.vo.DoSurvey;

/**
 * Servlet implementation class Practice
 */
@WebServlet("/prac.pr")
public class Practice extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Practice() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int sNum = Integer.valueOf(request.getParameter("sNum"));
		System.out.println(sNum);
		ArrayList<DoSurvey> dsList =  new SurveyService().doServey(sNum);
		System.out.println("서블릿 : "+ dsList);
		request.setAttribute("dsList",dsList);
		request.getRequestDispatcher("views/survey/Chart.jsp").forward(request, response);
		
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
