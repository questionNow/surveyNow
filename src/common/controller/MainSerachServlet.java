package common.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.jni.User;

import survey.model.vo.Survey;
import common.model.service.MainSerachService;


import common.model.vo.MainSerachVo;

import board.model.vo.Board;
import survey.model.vo.Survey;
import qna.model.vo.QnA;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/searchList.sv") 
//@WebServlet(urlPatterns = "/login.me", name = "LoginServlet")

public class MainSerachServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
        
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MainSerachServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 request.setCharacterEncoding("UTF-8");
		 String serachText = request.getParameter("serachText");
		 
System.out.println("SERVLET - serachText : " + serachText);
		 
//		 MainSerach user = new MainSerach(serachText);
		 
		 ArrayList<Board> allMenuBoard = new MainSerachService().allSearchBoard(serachText);
		 ArrayList<QnA> allMenuQna = new MainSerachService().allSearchQna(serachText);
		 ArrayList<Survey> allMenuSurvey = new MainSerachService().allSearchSurvey(serachText);
		 
		 response.setContentType("text/html;charset=utf-8");
		 RequestDispatcher view = null;

 


		  
		 
//		 if(allMenuBoard != null) {	//성공일 경우
	     if(allMenuBoard != null || allMenuQna != null || allMenuSurvey != null) {//성공일 경우
	    	 
System.out.println("allMenuBoard : " + allMenuBoard);
System.out.println("allMenuQna : " + allMenuQna);
System.out.println("allMenuSurvey : " + allMenuSurvey);
	    	  
	    	 request.setAttribute("allMenuBoard", allMenuBoard);
	    	 request.setAttribute("allMenuQna", allMenuQna);
	    	 request.setAttribute("allMenuSurvey", allMenuSurvey);
	    	 
	    	 view = request.getRequestDispatcher("views/common/allMenuSearch.jsp");
	    	 
	    	 
	    	 
//			if(allMenuBoard != null) {
//				System.out.println("allMenuBoard : " + allMenuBoard);
//				request.setAttribute("allMenuBoard", allMenuBoard);
//				//view = request.getRequestDispatcher("views/common/allMenuSearch.jsp");
//			}
//			if(allMenuQna != null) {
//				System.out.println("allMenuQna : " + allMenuQna); 
//				request.setAttribute("allMenuQna", allMenuQna);
//				//view = request.getRequestDispatcher("views/common/allMenuSearch.jsp");
//			}
//			if(allMenuSurvey != null) {
//				System.out.println("allMenuSurvey : " + allMenuSurvey);
//				request.setAttribute("allMenuSurvey", allMenuSurvey);
//				//view = request.getRequestDispatcher("views/common/allMenuSearch.jsp");
//			}
//			view = request.getRequestDispatcher("views/common/allMenuSearch.jsp");
			 //request.getRequestDispatcher("views/common/mainLoing.jsp").forward(request, response);
			 
		 }else {//실패할 경우
			 request.setAttribute("msg", "조회 실패");
			 view = request.getRequestDispatcher("views/common/errorPage.jsp");
			 //view.forward(request, response);
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
