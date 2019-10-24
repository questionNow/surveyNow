package survey.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import survey.model.service.SurveyService;
import survey.model.vo.Survey;

/**
 * Servlet implementation class HoldSurveyListServlet
 */
@WebServlet("/surveyHoldList.sv")
public class HoldSurveyListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HoldSurveyListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = request.getParameter("userId");
		
System.out.println("userId : " + userId);
System.out.println("sNum : " + request.getParameter("sNum"));
		
		//ArrayList<Survey> sList = new SurveyService().selectHoldSurvey(userId);
		
//		int result = 0;

		if(request.getParameter("sNum") != null) {
			
			int sNum = Integer.valueOf(request.getParameter("sNum"));
			Survey survey = new Survey();
			survey.setsNum(sNum);
			survey.setsUserId(userId);
			
			ArrayList<Survey> sList2 = new SurveyService().updateHoldSurvey(survey);

System.out.println("sList2 : " + sList2);
			
			
//			  request.setAttribute("sList2", sList2);
//			  request.getRequestDispatcher("views/survey/holdSurvey.jsp").forward(request,response);
			 

			response.setContentType("application/json;");	//charset=utf-8 해줘야 되는데 필터에서 해주니까 생략
			new Gson().toJson(sList2,response.getWriter()); 
			
			/*
			 * if(result > 0) { System.out.println("111"); sList = new
			 * SurveyService().selectHoldSurvey(userId);
			 * 
			 * System.out.println("sList : " + sList); request.setAttribute("sList", sList);
			 * request.getRequestDispatcher("views/survey/holdSurvey.jsp").forward(request,
			 * response); }
			 */
			
		}else { 
System.out.println("222");
			ArrayList<Survey> sList = new SurveyService().selectHoldSurvey(userId);
			
			request.setAttribute("sList", sList);
			request.getRequestDispatcher("views/survey/holdSurvey.jsp").forward(request, response);		
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
