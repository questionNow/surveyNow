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
import board.model.vo.Board;
import board.model.vo.PageInfo;

/**
 * Servlet implementation class BoardListServlet
 */
@WebServlet("/list.bo")
public class BoardListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BoardService bService = new BoardService();
		
		String tableName = "board";
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
		
		String bCategory = request.getParameter("bCategory");
		
		ArrayList<Board> nlist = bService.selectNoticeList(currentPage, limit, bCategory);
		ArrayList<Board> elist = bService.selectEventList(currentPage, limit, bCategory);
		
		RequestDispatcher view = null;
		if(nlist !=null && elist != null) {
			view = request.getRequestDispatcher("views/board/boardListView.jsp");
			request.setAttribute("nlist", nlist);
			request.setAttribute("elist", elist);	
			request.setAttribute("pi", pi);		
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
