package user.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import user.model.service.UserService;
import user.model.vo.UserInfo;

/**
 * Servlet implementation class FindPwdPhoneServlet
 */
@WebServlet("/findPwdPhone.find")
public class FindPwdPhoneServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FindPwdPhoneServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String userId = request.getParameter("userId");
		String userName = request.getParameter("userName");
		String phone = request.getParameter("phone");
		
		UserInfo findData = new UserInfo();
		findData.setUserId(userId);
		findData.setUserName(userName);
		findData.setPhone(phone);
		
		UserInfo findPwd = new UserService().findPwdPhone(findData);
		System.out.println(findPwd);
		response.setContentType("text/html;charset=utf-8");
		RequestDispatcher view = null;
		
		if(findPwd.getUserPwd() != null) {
			System.out.println(findPwd.getUserPwd());
			view = request.getRequestDispatcher("views/user/successPwd.jsp");
			request.setAttribute("UserInfo", findPwd);
		} else {
			PrintWriter out = response.getWriter();
			out.println("<script> alert('입력하신 정보에 맞는 회원이 없습니다!!!'); location.href='views/user/findPw.jsp'; </script>");
			out.flush();
			out.close();
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
