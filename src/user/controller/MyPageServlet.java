package user.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import user.model.service.UserService;
import user.model.vo.UserInfo1;

/**
 * Servlet implementation class MyPageServlet
 */
@WebServlet("/mypage.me")
public class MyPageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyPageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 회원정보 조회용 컨트롤러
System.out.println("mypage.me");
		//쿼리 스트림 값을 가져올 때는 인코딩 필요 없음
		String userId = request.getParameter("userId");
		
		UserInfo1 user = new UserService().selectMember(userId);
		
		RequestDispatcher view = null;
		if(user != null) {
			view = request.getRequestDispatcher("views/user/memberView.jsp");
			request.setAttribute("user", user);
		}else {
			view = request.getRequestDispatcher("views/user/errorPage.jsp");
			request.setAttribute("msg", "조회에 실패했습니다."); 
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
