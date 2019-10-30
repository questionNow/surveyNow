package board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.service.BoardService;
import board.model.vo.PageInfo;
import board.model.vo.Reply;
import user.model.service.UserService;
import user.model.vo.UserInfo;

/**
 * Servlet implementation class ReplyListServlet
 */
@WebServlet("/list.re")
public class ReplyListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReplyListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BoardService bService = new BoardService();

		String tableName = "reply";
		int listCount = bService.getListCount(tableName);
		
		int currentPage;	
		int limit;			
		int maxPage;	
		int startPage;	
		int endPage;	
		
		currentPage = 1;	
	
		if(request.getParameter("currentPage")!=null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		limit = 10;
	
		maxPage=(int)((double)listCount/limit + 0.9);
		
		startPage = (((int)((double)currentPage/limit+0.9))-1)*limit + 1;
		
		endPage = startPage + limit - 1;
	
		if(maxPage < endPage)
			endPage = maxPage;

		PageInfo pi = new PageInfo(currentPage, listCount, limit, maxPage, startPage, endPage);
		
		ArrayList<Reply> list = bService.selectReplyList(currentPage, limit);
		RequestDispatcher view = null;
		if(list !=null) {
			view = request.getRequestDispatcher("views/board/replyListView.jsp");
			request.setAttribute("list", list);	// 현재 페이지에 화면에 뿌려질 게시글이 담긴 객체
			request.setAttribute("pi", pi);		// 페이지에 관련된 정보가 담긴 객체
		}else {
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
