package mypage.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mypage.model.service.MemberService;
import mypage.model.vo.Member;

/**
 * Servlet implementation class MyPageServlet
 */
@WebServlet("/myPage.me")
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
		// ȸ������ ��ȸ�� ��Ʈ�ѷ�
		
		
				// ���� ��Ʈ�� ���� ������ ���� ���ڵ� �ʿ� ����
		/* String userId = request.getParameter("userId"); */
				String userId = request.getParameter("userId");
				
				Member member = new MemberService().selectMember(userId);
				
				RequestDispatcher view = null;
				if(member !=null) {
					view = request.getRequestDispatcher("views/mypage/UserUpdateView.jsp");
					request.setAttribute("member", member);
				}else {
					view = request.getRequestDispatcher("views/common/errorPage.jsp");
					request.setAttribute("msg", "��ȸ�� �����߽��ϴ�.");
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
