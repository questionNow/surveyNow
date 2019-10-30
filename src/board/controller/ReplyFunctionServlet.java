package board.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import board.model.service.BoardService;
import board.model.vo.Board;
import user.model.vo.UserInfo;
import user.model.vo.WarnUser;

/**
 * Servlet implementation class ReplyWranServlet
 */
@WebServlet(name = "func.re", urlPatterns = { "/func.re" })
public class ReplyFunctionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ReplyFunctionServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");

		BoardService bService = new BoardService();
		
		int replyNum = Integer.valueOf(request.getParameter("replyNum"));
		String userId = request.getParameter("userId");
		String warnText = request.getParameter("warnText");
		String text = request.getParameter("text");
		int chk = Integer.valueOf(request.getParameter("chk"));
		
		WarnUser u = new WarnUser();
		u.setWarnUser(userId);
		u.setWarnText(warnText + "(" + text + ")");
		
		
		int result = 0;
		if(chk == 0)
		{
			result = bService.reportReply(u);
			result = bService.deleteReply(replyNum, userId);
		} else {
			result = bService.deleteReply(replyNum, userId);
		}
		
		if(result>0) {
			response.sendRedirect("/list.po?currentPage=1"); 
		}else {
			request.setAttribute("msg","포인트 추가 실패");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
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
