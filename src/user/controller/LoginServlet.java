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
		String userId = request.getParameter("userId");
	       String userPwd = request.getParameter("userPwd");
	       
	       UserInfo user = new UserInfo(userId, userPwd);
	       UserInfo loginUser = new UserService().loginUser(user);
	       
	       response.setContentType("text/html;charset=utf-8");
	       RequestDispatcher view = null;
	       
	       if(loginUser != null) {   //성공일 경우
	          
	          HttpSession session = request.getSession();   
	          
	          session.setAttribute("loginUser", loginUser);

	         // usertpye 구분해서 로그인하는 것
	          int usertype = UserService.userType(userId);
	          
	          if(usertype == 2) {
	             view = request.getRequestDispatcher("views/common/mainLoing.jsp");
	          }      
	          else if(usertype == 1) {
	             view = request.getRequestDispatcher("views/common/adminMain.jsp");
	          }
	   
	       }else {//실패할 경우
	          request.setAttribute("msg", "로그인 실패");
	          view = request.getRequestDispatcher("views/common/errorPage.jsp");
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
