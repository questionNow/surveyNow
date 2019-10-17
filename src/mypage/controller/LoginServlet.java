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
		 * <�������� �����ϴ� ��ü>
		 * 
		 * application > session > request > page
		 * application : ���ø����̼�(���α׷�) ���� ���� ����
		 * session : �ش� �������� �����ִ� ���� ����(�ð� ���� ������(��,��))
		 * request : ��ûó���� �Ǵ� ���� ����
		 * page : �ش� �������� Ȱ��ȭ �Ǿ� �ִ� ���� ����
		 * 
		 * <request�� response>
		 * 
		 * request : ������ ��û�ϴ� ��� �������� ����
		 * response : ������ Ŭ���̾�Ʈ���� �������ִ� �������� ���� ����(���񽺸� ��û�� Ŭ���̾�Ʈ�� ip�� url�� ���� ����, �������� ����(500, 400, 400))
		 * -> ������ ������ �Դٸ� ���ٸ� �����ν� Ŭ���̾�Ʈ�� ���� ��Ȯ�� ���� ����
		 * 
		 */
		
		/*
		 * <post�� get��� ����>
		 * 
		 * request�� response�� �� �� head�� body�� ������ �ִ�.
		 * post : body�� ��ϵǼ� ����(url�� ������ ����(����!))
		 * 		    ��Ʈ��������� �����͸� ����
		 * 		    ���������� �� ���� � ������� ������ �� ����
		 * 		   ���۰��� ���� ������ ����!!
		 * 
		 * get : head�� ��ϵǼ� ����(url�� ����)
		 * 		  ��û url�� �Ķ���Ͱ��� �ٿ��� ����
		 * 		 url��
		 *    ������ �����ϱ� ������ form�� ������� �ʾƵ� �Ķ���͸� ���� ����
		 * 		  ���۰��� ���� ������ �ִ�!!(255byte)	
		 * 
		 */
		
		//1. ���� ���� �ѱ��� ���� ��� ���ڵ� ó�� �ؾ��Ѵ�. (doPost������ ������ �ؾߵ� ������ doGet������ ���ص� ��)
		request.setCharacterEncoding("UTF-8"); // �α��ο����� �ʿ����(�ѱ� ���� �����ϱ�)
		
		//2. ���� �� ������ ������ ����ϱ� �Ǵ� ��ü�� �����ϱ�
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		Member member = new Member(userId, userPwd);
		
		//3. ���� Ŭ������ �ش� �޼ҵ带 �����ϰ�, �� ó�� ����� ����
		Member loginUser = new MemberService().loginMember(member);
		
		System.out.println(loginUser);
		
		//4. ���� ���� �ѱ��� ���� ��� ���ڵ� ó���� �ؾ��Ѵ�.
		//   ���� �������� ������ html������ �ؼ��ض�
		response.setContentType("text/html;charset=utf-8");
		
		// 5. ���� ��û�� �ش��ϴ� ����� ������ ����/���п� ���� �� ������(����)�� �����ؼ� ������
		if(loginUser != null) { //������ ���
			// �ش� Ŭ���̾�Ʈ�� ���� ���� ��ü�� ������
			HttpSession session = request.getSession();   // session��ü�� request���� �����ϴ� getSession()�̶�� �޼ҵ�� ���� �� ����
			
			session.setAttribute("loginUser", loginUser);  //�̸��� loginUser���ؼ� �Ӽ����� ������
			
			/* session.setMaxInactiveInterval(10); */ //�ʴ����� session��ü �����ð� ����  
			
			response.sendRedirect("/views/mypage/myPageMain.jsp");	 
		}else { // ������ ���
			request.setAttribute("msg", "�α��� ����");
		
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
