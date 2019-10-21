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
    
    // 마이페이지 !
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		

		//쿼리 스트림 값을 가져올 때는 인코딩 필요 없음
		String userId = request.getParameter("userId");
		
		UserInfo user = new MyPageService().selectMember(userId);
		
		RequestDispatcher view = null;
		
				
		
		// 마이페이지로 이동
		if(user != null) {
			view = request.getRequestDispatcher("views/mypage/MyPageMain.jsp");
			
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
