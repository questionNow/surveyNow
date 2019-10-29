package mypage.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.GregorianCalendar;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mypage.model.service.MyPageService;
import mypage.model.vo.PageInfo;
import user.model.vo.Point;



/**
 * Servlet implementation class BoardListServlet
 */
@WebServlet("/mypoint.mp")
public class MyPointServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyPointServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String userId = request.getParameter("userId");
		
		
		System.out.println("id : " + userId);
		
		// 게시판 리스트 조회해오기
		ArrayList<Point> pointlist = new MyPageService().selectPointList(userId);
		
		RequestDispatcher view = null;
		
		
		System.out.println("pointlist : " + pointlist);
		

		if(pointlist != null) {
			request.setAttribute("pointlist", pointlist);
			view = request.getRequestDispatcher("views/mypage/MyPagePointList.jsp");
		}else {	
			view = request.getRequestDispatcher("views/common/errorPage.jsp");
			request.setAttribute("msg", "공지사항 조회 실패");
			
			
		}
		 view.forward(request, response);
		
		// boardListView.jsp 페이지 만들러 ㄱㄱ씽!
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
