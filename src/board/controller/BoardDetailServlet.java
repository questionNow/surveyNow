package board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.service.BoardService;
import board.model.vo.Board;
import user.model.service.UserService;
/**
 * Servlet implementation class BoardDetailServlet
 */
@WebServlet("/detail.bo")
public class BoardDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int bnum = Integer.parseInt(request.getParameter("bnum"));

		Board board = new BoardService().selectBoard(bnum);

		if(request.getParameter("userTy") != null) {
			int userTy  = Integer.parseInt(request.getParameter("userTy"));
			String loginType = ""; 
            if (userTy == 2) {		// 유저
            	loginType = "Y"; 
            } else if (userTy == 1) {	// 관리자 
            	loginType = "N";
            }

    		if (board != null) {
    			request.setAttribute("board", board);
    			request.setAttribute("loginType", loginType); // 공지사항 화면 관리자/유저 구분
    			request.getRequestDispatcher("views/board/boardDetailView.jsp").forward(request, response);
    		} else {
    			request.setAttribute("msg", "게시판 상세조회 실패!");
    			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
    		}
            
		}else {
			String loginType2 = request.getParameter("loginType");
			String loginType = ""; 
            if (loginType2.equals("Y")) { 		// 유저
            	loginType = "Y"; 
            } else {	// 관리자
            	loginType = "N";
            } 
            
    		if (board != null) {
    			request.setAttribute("board", board);
    			request.setAttribute("loginType", loginType); // 공지사항 화면 관리자/유저 구분
    			request.getRequestDispatcher("views/board/boardDetailView.jsp").forward(request, response);
    		} else {
    			request.setAttribute("msg", "게시판 상세조회 실패!");
    			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
    		}
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
