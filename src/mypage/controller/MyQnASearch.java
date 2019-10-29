package mypage.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import qna.model.service.QnAService;
import qna.model.vo.QnA;

/**
 * Servlet implementation class MyQnASearch
 */
@WebServlet("/MyQnASearch.qs")
public class MyQnASearch extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyQnASearch() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 String userId = request.getParameter("userId");
		 int qnaNum = Integer.valueOf(request.getParameter("qnaNum"));
		 String qnaType = request.getParameter("qnaType");
			String qnaTitle = request.getParameter("qnaTitle");
			
			
			
		  QnAService qnaService = new QnAService();

		ArrayList<QnA> list = qnaService.MyQnASearch(qnaNum,qnaType,qnaTitle);

		RequestDispatcher view = null;
		if (list != null) {
			view = request.getRequestDispatcher("views/qna/MyqnaListView.jsp");
			request.setAttribute("list", list); // 현재 페이지에 화면에 뿌려질 게시글이 담긴 객체
			
			 /* request.setAttribute("pi", pi); // 페이지에 관련된 정보가 담긴 객체 */
			 		} else {
			view = request.getRequestDispatcher("/views/common/errorPage.jsp");
			request.setAttribute("msg", "게시판 리스트 조회 실패!");
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
