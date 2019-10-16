package user.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.jni.User;

import user.model.service.UserService;
import user.model.vo.UserInfo1;

/**
 * Servlet implementation class LoginServlet
 */
//@WebServlet("/login.user")
@WebServlet(urlPatterns = "/login.me", name = "LoginServlet")

public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1. 전송 값에 한글이 있을 경우 인코딩 처리 해야한다. (doPost에서는 무조건 해야됨 하지만 doGet에서는 안해도 됨)
		 request.setCharacterEncoding("UTF-8");	// 로그인에서는 필요없음(한글 쓸일 없으니까)
		 
		//2. 전송 값 꺼내서 변수에 기록하기 또는 객체에 저장하기
		 String userId = request.getParameter("userId");
		 String userPwd = request.getParameter("userPwd");
		 
//		 String userId = "admin";
//		 String userPwd = "1234";
		 
		 UserInfo1 user = new UserInfo1(userId, userPwd);
		//3. 서비스 클래스의 해당 메소드를 실행하고, 그 처리 결과를 받음
		 UserInfo1 loginUser = new UserService().loginUser(user);
// syso		 
//System.out.println(loginUser);
		
		 //4. 보낼 값에 한글이 있을 경우 인코딩 처리를 해야한다.
		 // 지금 내보내는 내용을 html문으로 해성해라
		 response.setContentType("text/html;charset=utf-8");
		 RequestDispatcher view = null;
		 
		 //5. 서비스 요청에 해당하는 결과를 가지고 성공/실패에 대한 뷰 페이지(파일)을 선택해서 내보냄
		 if(loginUser != null) {	//성공일 경우
			 
			 // 해당 클라이언트에 대한 세션 객체를 생성함
			 HttpSession session = request.getSession();	//session객체는 request에서 제공하는 getSession()이라는 메소드로 만들 수 있음
			 
			 session.setAttribute("loginUser", loginUser);
			 // session에 정보를 담으면 브라우저를 종료하지 않는 이상 데이터가 사라지지 않는다.
			 // session을 사용하면 sendRedirect()로 페이지만 호출하면 된다.
			 
			 //20190927 session객체 유지 시간 조절하기
			 //session.setMaxInactiveInterval(10); // 초단위로 session객체 유지시간 설정
			 
			 //response.sendRedirect("index.jsp"); //Servlet에서 페이지 넘김 : response.sendRedirect();
			 
			 
//			 if() {
//				여기에 로그인 구분 줘야한다. (화면 따로 하려면) 
//					관리자 or 회원	? 
//			 }
			 
			 view = request.getRequestDispatcher("views/common/mainNow(n).jsp");
			 
			 
			 
		 }else {//실패할 경우
			 request.setAttribute("msg", "로그인 실패");
			 // request는 호출이 끝난 경우 데이터가 사라진다.??
			 // request는 페이지 넘길때 같이 넘겨줘야한다.
			 
			 // request사용시 RequestDispatcher을 사용하여 view 에 대한 정보를 불러온다.
			 // view에 대한 정보는 RequestDispatcher
			 view = request.getRequestDispatcher("views/common/errorPage.jsp");
			 //view.forward(request, response);
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
