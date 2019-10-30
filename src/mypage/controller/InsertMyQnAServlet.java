package mypage.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mypage.model.service.MyPageService;
import qna.model.vo.QnA;
import user.model.service.UserService;
import user.model.vo.UserInfo;





/**
 * Servlet implementation class InsertBoardServlet
 */
@WebServlet("/myinsert.ms")
public class InsertMyQnAServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	
	
    public InsertMyQnAServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		
		 String userPwd = request.getParameter("userPwd");
		
		String qnaTitle = request.getParameter("qnaTitle");
		String qnaContent = request.getParameter("qnaContent");
		String qnaType = request.getParameter("qnaType");
		
			HttpSession session = request.getSession(); // request객체가 session 객체를 만드는 메소드를 지니고 있다.
		
		  UserInfo UserInfo = (UserInfo)session.getAttribute("loginUser"); // BOARD 테이블에
		  //BWRITER 컬럼에 추가할 회원 번호를 알아내기 위해 다음과 같이 작업하자 // int 값이지만 Board라는 vo클래스의 bWirter필드에 담기 위해 다음과 같이 함 
		  String userId = UserInfo.getUserId();  
		  
		  QnA qna = new QnA();
		  qna.setUserId(userId);
		  qna.setQnaTitle(qnaTitle); 
		  qna.setQnaConent(qnaContent);
		  qna.setQnaType(qnaType); 
		
		  System.out.println("userId : " + userId);
		  System.out.println("qnaTitle : " +qnaTitle);
		  System.out.println("qnaContent : " +qnaContent);
		  System.out.println("qnaType : " +qnaType);
		
		int result = new MyPageService().insertMyQnA(qna);
		
		
		
		if(result>0) {
			UserInfo user = new UserInfo(userId, userPwd);
			UserInfo loginUser = new UserService().loginUser(user);
			System.out.println("userid + userpwd111 :" + userId + userPwd);
			System.out.println("user111" + user);
			// usertype 구분해서 로그인하는 것
			int usertype = UserService.userType(userId);

			if (usertype == 2) {
			
			request.getRequestDispatcher("views/common/mainLoing.jsp").forward(request,response);
			} else if (usertype == 1) {
			request.getRequestDispatcher("views/common/adminMain.jsp").forward(request, response);
		}
		}
		
		// 게시글이 잘 저장되고 첫페이지를 뿌려주면 boardListView.jsp가서 detail 관련코드 (상세보기)
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
