package user.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8"); // 로그인에서는 필요없음(한글 쓸일 없으니까)

		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");

		UserInfo user = new UserInfo(userId, userPwd);
		UserInfo loginUser = new UserService().loginUser(user);

		response.setContentType("text/html;charset=utf-8");
		RequestDispatcher view = null;		 
		
		
		if (loginUser != null) { // 성공일 경우

			HttpSession session = request.getSession();

			session.setAttribute("loginUser", loginUser);

			// usertpye 구분해서 로그인하는 것
			int usertype = UserService.userType(userId);

			if (usertype == 2) {
				view = request.getRequestDispatcher("views/common/mainLoing.jsp");
			} else if (usertype == 1) {
				view = request.getRequestDispatcher("views/common/adminMain.jsp");
			}

		} else {// 실패할 경우
			PrintWriter out = response.getWriter();
			out.println("<script> alert('로그인을 다시 시도해주세요!!!'); location.href='views/common/loginPage.jsp'; </script>");
			out.flush();
			out.close();
		}
		
		view.forward(request, response);

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
