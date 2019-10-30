package user.controller;

import java.io.IOException;
import java.io.PrintWriter;
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
import user.model.service.UserService;
import user.model.vo.UserInfo;

import board.model.service.BoardService;
import board.model.vo.Board;

/**
 * Servlet implementation class LoginServlet
 */
//@WebServlet("/login.user") 
@WebServlet(urlPatterns = "/login.me", name = "LoginServlet")

public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
        
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 request.setCharacterEncoding("UTF-8");	// 로그인에서는 필요없음(한글 쓸일 없으니까)
		 
		 String userId = request.getParameter("userId");
		 String userPwd = request.getParameter("userPwd");

		 UserInfo user = new UserInfo(userId, userPwd);
		 UserInfo loginUser = new UserService().loginUser(user);
		 
		 // 오늘 출석체크 유무
		int result = new UserService().loginAtCheck(userId);
		
		String attcheck = ""; 
System.out.println("오늘 출석 했냐? : " + result);
		
		if(result > 0) {
			attcheck = "Y";
		} else {
			attcheck = "N";
		}
		 
// 메인화면에 설문가능한 내역 출력 -------------------------------------------------------------------------
			// 당장은 survey에서 빼오는걸로 하는데 .. 
			// user_info 테이블이랑 엮어야함
		 ArrayList<Survey> rlist = new UserService().selectSurveyList(userId);

// 메인화면에 설문가능한 내역 출력 -------------------------------------------------------------------------
		 
// 메인화면 공지사항 ---------------------------------------------------------------------------------------------
		 
		 BoardService bService = new BoardService();
		 String tableName = "board";
		 int listCount = bService.getListCount(tableName);
		 
		 ArrayList<Board> blist = bService.mainBoardList();
		 
// 메인화면 공지사항 ---------------------------------------------------------------------------------------------		 
		 
		 response.setContentType("text/html;charset=utf-8");
		 RequestDispatcher view = null;
		
		 if(loginUser != null) {	//성공일 경우
			 PrintWriter out = response.getWriter();

			 HttpSession session = request.getSession();	//session객체는 request에서 제공하는 getSession()이라는 메소드로 만들 수 있음
			 session.setAttribute("loginUser", loginUser);
			 request.setAttribute("rlist", rlist); // 메인화면에 설문내역 출력
			 request.setAttribute("blist", blist); // menubar에 공지사항 출력
			 request.setAttribute("attcheck", attcheck); // 메인화면 출석체크 유무
	         // usertpye 구분해서 로그인하는 것---------------------------------------------
			 

//	         int usertype = UserService.userType(userId);
//
//	         if (usertype == 2) {
//	            view = request.getRequestDispatcher("views/common/mainLoing.jsp");
//	         } else if (usertype == 1) {
//	            view = request.getRequestDispatcher("views/common/adminMain.jsp");
//	         }
			 
	         // usertpye 구분해서 로그인하는 것---------------------------------------------
	         
			 view = request.getRequestDispatcher("views/common/mainLoing.jsp");
			 //request.getRequestDispatcher("views/common/mainLoing.jsp").forward(request, response);
			  
		 }else {//실패할 경우
			 request.setAttribute("msg", "로그인 실패");
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
