package mypage.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mypage.model.service.MyPageService;
import mypage.model.vo.QnA;
import user.model.vo.UserInfo;





/**
 * Servlet implementation class InsertBoardServlet
 */
@WebServlet("/insert.bo")
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
		  qna.setQnaContent(qnaContent);
		  qna.setQnaType(qnaType); 
		
		  System.out.println("userId : " + userId);
		  System.out.println("qnaTitle : " +qnaTitle);
		  System.out.println("qnaContent : " +qnaContent);
		  System.out.println("qnaType : " +qnaType);
		
		int result = new MyPageService().insertMyQnA(qna);
		
		
		if(result>0) {
			/* response.sendRedirect("/list.bo?currentPage=1"); */
			request.setAttribute("msg","문의 성공");
			request.getRequestDispatcher("views/common/successPage.jsp").forward(request,response);
		}else {
			request.setAttribute("msg","문의 실패!!");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
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
