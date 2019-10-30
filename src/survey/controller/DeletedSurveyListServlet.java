package survey.controller;

import java.io.IOException;
import java.util.ArrayList;

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
 * Servlet implementation class DeletedSurveyList
 */
@WebServlet("/surveyDeletedList.sv")
public class DeletedSurveyListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeletedSurveyListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = request.getParameter("userId");

		ArrayList<Survey> sList = new SurveyService().selectDeletedSurvey(userId);
		
//str 메인화면 공지사항 ---------------------------------------------------------------------------------------------
		 BoardService bService = new BoardService();
		 String tableName = "board";
		 int listCount = bService.getListCount(tableName);
		  
		 ArrayList<Board> blist = bService.mainBoardList();
		 request.setAttribute("blist", blist);
//end 메인화면 공지사항 ---------------------------------------------------------------------------------------------	
		
		request.setAttribute("sList", sList);
		request.getRequestDispatcher("views/survey/deletedSurvey.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
