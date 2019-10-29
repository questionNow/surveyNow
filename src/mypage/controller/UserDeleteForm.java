package mypage.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import mypage.model.service.MyPageService;
import user.model.vo.UserInfo;

/**
 * Servlet implementation class UserDeleteForm
 */
@WebServlet("/userdeleteform.df")
public class UserDeleteForm extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserDeleteForm() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 String userId = request.getParameter("userId");
		
		 
		 
		 UserInfo user = new MyPageService().UserDeleteForm(userId);
		
		// 받은 결과에 따라 성공/실패에 따른 페이지 내보내기
		String page="";	// 반환할 jsp의 경로(화면에 보여줄 view)를 저장할 String
		if(user != null) {	// 성공 했을 때
			page = "views/mypage/UserDelete.jsp";
			request.setAttribute("user", user);
		}else {		// 실패 했을 때
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "조회 실패");
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
