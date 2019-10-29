package mypage.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mypage.model.service.MyPageService;

/**
 * Servlet implementation class UserDelete
 */
@WebServlet("/userdelete.ud")
public class UserDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserDelete() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
			String userId = request.getParameter("userId");
			String userPwd = request.getParameter("userPwd");
			
			System.out.println("userId : " + userId);
			System.out.println("userPwd : " + userPwd);
			
			int result = new MyPageService().Userdelete(userId);
		
			String page="";	// 반환할 jsp의 경로(화면에 보여줄 view)를 저장할 String
			if(result > 0) {	// 성공 했을 때
				request.getSession().invalidate(); // 로그인한 사람의 정보가 담긴 Session을 무효화
				page = "views/common/successPage.jsp";
				request.setAttribute("msg", "회원 탈퇴 성공!");
				}else {		// 실패 했을 때
					page = "views/common/errorPage.jsp";
					request.setAttribute("msg", "회원 탈퇴 실패!");
				}
		// 넘어갈 view와 넘겨줄 request객체를 같이 보낼려면 forwarding 처리를 해야함
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
