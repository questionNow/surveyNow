package point.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import board.model.service.BoardService;
import board.model.vo.Board;
import point.model.service.PointService;
import point.model.vo.Point;
import user.model.vo.UserInfo;

/**
 * Servlet implementation class PointPlusServlet
 */
@WebServlet("/insert.po")
public class PointInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PointInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		int chk = Integer.valueOf(request.getParameter("chk"));
		
		String content = request.getParameter("content");
		int point = Integer.valueOf(request.getParameter("point"));
		String userId= request.getParameter("userId");
		
		Point p = new Point();
		p.setpContent(content);
		p.setPoint(point);
		p.setUserId(userId);
		
		int result = 0;
		
		if(chk == 0)
			result = new PointService().plusPoint(p);
		else
			result = new PointService().minusPoint(p);
		
		if(result>0) {
			response.sendRedirect("/surveyNow/list.po?currentPage=1"); 
		}else {
			request.setAttribute("msg","포인트 추가 실패");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
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
