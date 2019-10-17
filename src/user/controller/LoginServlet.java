package user.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.jni.User;

import user.model.service.UserService;
import user.model.vo.UserInfo;

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
		 
//		 String userId = "admin";
//		 String userPwd = "1234";
		 
		 UserInfo user = new UserInfo(userId, userPwd);
		 UserInfo loginUser = new UserService().loginUser(user);
// syso		 
//System.out.println(loginUser);
		
		 response.setContentType("text/html;charset=utf-8");
		 RequestDispatcher view = null;
		 
		 if(loginUser != null) {	//성공일 경우
			 
			 HttpSession session = request.getSession();	//session객체는 request에서 제공하는 getSession()이라는 메소드로 만들 수 있음
			 
			 session.setAttribute("loginUser", loginUser);

			 
//			 if() {
//				여기에 로그인 구분 줘야한다. (화면 따로 하려면) 
//					관리자 or 회원	? 
//			 }
			 
			/* view = request.getRequestDispatcher("views/common/mainNow(n).jsp"); */
			 view = request.getRequestDispatcher("views/common/mainLoing.jsp");
			 
			  
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
