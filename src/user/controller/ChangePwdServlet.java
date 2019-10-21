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
 * Servlet implementation class ChangePwdServlet
 */
@WebServlet(urlPatterns = "/changePwd.cp", name = "ChangePwdSerlvet")
public class ChangePwdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangePwdServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		System.out.println("Servlet 1st test : " + userPwd);
		System.out.println("Servlet 1st test : " + userId);
		
		UserInfo changeData = new UserInfo();  
		changeData.setUserId(userId);
		changeData.setUserPwd(userPwd);
		int findPwd = new UserService().changePwd(changeData);
		
		// int result = new UserService().changePwd(new UserInfo(findPwd));
		
		System.out.println("Servlet 2nd : " + findPwd);
		
		String page = "";
		if(findPwd > 0) {
			page = "views/common/loginPage.jsp";
		} else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "비밀번호 수정 실패");
		}
		
		RequestDispatcher view = request.getRequestDispatcher(page);
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
