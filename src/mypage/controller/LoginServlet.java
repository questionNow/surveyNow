package mypage.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mypage.model.service.MemberService;
import mypage.model.vo.Member;



/**
 * Servlet implementation class LoginServlet
 */
@WebServlet(urlPatterns = "/login.me", name = "LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*
		 * <정보들을 저장하는 객체>
		 * 
		 * application > session > request > page
		 * application : 어플리케이션(프로그램) 들어가는 동안 유지
		 * session : 해당 브라우저가 켜져있는 동안 유지(시간 지정 가능함(분,초))
		 * request : 요청처리가 되는 동안 유지
		 * page : 해당 페이지가 활성화 되어 있는 동안 유지
		 * 
		 * <request와 response>
		 * 
		 * request : 서버에 요청하는 모든 정보들을 보관
		 * response : 서버가 클라이언트에게 전달해주는 페이지에 대한 정보(서비스를 요청한 클라이언트의 ip나 url에 대해 보관, 응답결과도 보관(500, 400, 400))
		 * -> 쌍으로 서버로 왔다리 갔다리 함으로써 클라이언트에 대한 정확한 정보 제공
		 * 
		 */
		
		/*
		 * <post와 get방식 차이>
		 * 
		 * request와 response는 둘 다 head와 body로 나뉘어 있다.
		 * post : body에 기록되서 전달(url에 보이지 않음(보안!))
		 * 		    스트림방식으로 데이터를 전송
		 * 		    웹브라우저나 웹 서버 등에 상관없이 전송할 수 있음
		 * 		   전송값의 길이 제한이 없다!!
		 * 
		 * get : head에 기록되서 전달(url에 보관)
		 * 		  요청 url에 파라미터값을 붙여서 전송
		 * 		 url기
		 *    반으로 전송하기 때문에 form을 사용하지 않아도 파라미터를 전송 가능
		 * 		  전송값의 길이 제한이 있다!!(255byte)	
		 * 
		 */
		
		//1. 전송 값에 한글이 있을 경우 인코딩 처리 해야한다. (doPost에서는 무조건 해야됨 하지만 doGet에서는 안해도 됨)
		request.setCharacterEncoding("UTF-8"); // 로그인에서는 필요없음(한글 쓸일 없으니까)
		
		//2. 전송 값 꺼내서 변수에 기록하기 또는 객체에 저장하기
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		Member member = new Member(userId, userPwd);
		
		//3. 서비스 클래스의 해당 메소드를 실행하고, 그 처리 결과를 받음
		Member loginUser = new MemberService().loginMember(member);
		
		System.out.println(loginUser);
		
		//4. 보낼 값에 한글이 있을 경우 인코딩 처리를 해야한다.
		//   지금 내보내는 내용을 html문으로 해석해라
		response.setContentType("text/html;charset=utf-8");
		
		// 5. 서비스 요청에 해당하는 결과를 가지고 성공/실패에 대한 뷰 페이지(파일)을 선택해서 내보냄
		if(loginUser != null) { //성공일 경우
			// 해당 클라이언트에 대한 세션 객체를 생성함
			HttpSession session = request.getSession();   // session객체는 request에서 제공하는 getSession()이라는 메소드로 만들 수 있음
			
			session.setAttribute("loginUser", loginUser);  //이름은 loginUser라해서 속성으로 담아줘라
			
			/* session.setMaxInactiveInterval(10); */ //초단위로 session객체 유지시간 설정  
			
			response.sendRedirect("/views/mypage/myPageMain.jsp");	 
		}else { // 실패할 경우
			request.setAttribute("msg", "로그인 실패");
		
			RequestDispatcher view = request.getRequestDispatcher("views/common/errorPage.jsp");
			view.forward(request, response); 
					
		}
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
