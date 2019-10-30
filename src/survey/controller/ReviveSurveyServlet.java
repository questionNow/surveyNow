package survey.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.service.BoardService;
import board.model.vo.Board;
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
		String updateDelete = request.getParameter("ud");
		String userId = request.getParameter("userId");
		
		RequestDispatcher view = null;

//str 메인화면 공지사항 ---------------------------------------------------------------------------------------------
		 BoardService bService = new BoardService();
		 String tableName = "board";
		 int listCount = bService.getListCount(tableName);
		  
		 ArrayList<Board> blist = bService.mainBoardList();
		 
//end 메인화면 공지사항 ---------------------------------------------------------------------------------------------	
		 
		if(request.getParameter("ud") == null) {
			 int result = new SurveyService().reviveSurvey(sNum);
			 if(result >0) {
					ArrayList<Survey> sList = new SurveyService().selectDeletedSurvey(userId);
					request.setAttribute("sList", sList);
					request.setAttribute("blist", blist); // 메인화면 공지사항
					request.getRequestDispatcher("views/survey/deletedSurvey.jsp").forward(request, response);
//				 request.setAttribute("msg", "복구 되었습니다. 확인하시려면 작성중인 설문으로 이동해주세요.");
//				 request.getRequestDispatcher("views/survey/deletedSurvey.jsp").forward(request, response);
			 }else {
				 request.setAttribute("msg", "설문 수정실패");
				 view = request.getRequestDispatcher("views/common/errorPage.jsp");	
			 }
		}else if(request.getParameter("ud") != null){
			 int result = new SurveyService().deleteSurvey(sNum);
			 if(result >0) {
					ArrayList<Survey> sList = new SurveyService().selectDeletedSurvey(userId);
					request.setAttribute("sList", sList);
					request.setAttribute("blist", blist); // 메인화면 공지사항
					request.getRequestDispatcher("views/survey/deletedSurvey.jsp").forward(request, response);
//				 request.setAttribute("msg", "복구 되었습니다. 확인하시려면 작성중인 설문으로 이동해주세요.");
//				 request.getRequestDispatcher("views/survey/deletedSurvey.jsp").forward(request, response);
				 
			 }else {
				 request.setAttribute("msg", "설문 삭제 실패");
				 view = request.getRequestDispatcher("views/common/errorPage.jsp");	
			 }
		}else {
			 request.setAttribute("msg", "잘못된 동작을 실행 하셨습니다. 관리자에게 문의하세요");
			 view = request.getRequestDispatcher("views/common/errorPage.jsp");				
		}
		/*
		 * int result = new SurveyService().reviveSurvey(sNum);
		 * 
		 * if(result >0) { request.setAttribute("msg",
		 * "복구 되었습니다. 확인하시려면 작성중인 설문으로 이동해주세요.");
		 * request.getRequestDispatcher("views/survey/deletedSurvey.jsp").forward(
		 * request, response); } else { System.out.println("실패"); }
		 */
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
