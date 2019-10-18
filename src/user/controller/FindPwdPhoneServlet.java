package user.controller;

import java.io.IOException;

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
			System.out.println("없는 회원 정보");
			view = request.getRequestDispatcher("views/common/errorPage.jsp");
			request.setAttribute("msg", "입력하신 정보에 맞는 비밀번호를 찾을 수 없습니다.");
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
