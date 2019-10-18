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
 * Servlet implementation class FindIdServlet
 */
@WebServlet("/findIdEmail.find")
public class FindIdEmailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FindIdEmailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String userName = request.getParameter("userName");
		String email = request.getParameter("email1") + request.getParameter("email2");
		
		System.out.println("servlet 첫번째 emailtest : " + email );
		
		UserInfo findData = new UserInfo();  
		findData.setUserName(userName);
		findData.setEmail(email);
		UserInfo findId = new UserService().findIdEmail(findData);
		System.out.println("servlet 첫번째 id test : " + findId.getUserId());
		
		response.setContentType("text/html;charset=utf-8");
		RequestDispatcher view = null;
		
		if(findId.getUserId() != null) {
			System.out.println("아이디는 : " + findId.getUserId() + "입니다.");
			view = request.getRequestDispatcher("views/user/successId.jsp");
			request.setAttribute("UserInfo", findId);
		} else {
			System.out.println("없는 회원 정보");
			view = request.getRequestDispatcher("views/common/errorPage.jsp");
			request.setAttribute("msg", "입력하신 정보에 맞는 아이디가 없습니다.");
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
