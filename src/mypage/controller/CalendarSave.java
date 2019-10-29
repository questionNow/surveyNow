package mypage.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mypage.model.service.MyPageService;
import mypage.model.vo.attendence;

/**
 * Servlet implementation class CalendarController
 */
@WebServlet("/caledarsave.cs")
public class CalendarSave extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CalendarSave() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		
		String userId = request.getParameter("userId");
		
		ArrayList<attendence> calendarSave = new MyPageService().calendarSave(userId);
		
//		System.out.println(result);
		
		PrintWriter out = response.getWriter();
		
System.out.println("calendarSave : " + calendarSave);	

		if(calendarSave != null) {
			request.setAttribute("calendarSave", calendarSave);
			
			request.getRequestDispatcher("views/mypage/MyPageMain.jsp").forward(request, response);
		}else {
			request.setAttribute("msg", "게시판 상세조회 실패!");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
		
		/*
		 * if(result > 0) { out.append("fail"); // print 대신 append 해도 된다. }else {
		 * out.append("success"); } out.flush(); out.close();
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
