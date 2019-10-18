package user.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import user.model.service.UserService;
import user.model.vo.UserInfo;

/**
 * Servlet implementation class FindIdServlet
 */
@WebServlet("/findIdPhone.find")
public class FindIdPhoneServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FindIdPhoneServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String userName = request.getParameter("userName");
		String phone = request.getParameter("phone");
		
		System.out.println("servlet 첫번째 phonetest : " + phone);
		
		UserInfo findData = new UserInfo();  
		findData.setUserName(userName);
		findData.setPhone(phone);
		UserInfo findId = new UserService().findIdPhone(findData);
		System.out.println("servlet 첫번째 id test : " + findId.getUserId());
		
		response.setContentType("text/html;charset=utf-8");
		String page = "";
		
		if(findId.getUserId() != null) {
			System.out.println("아이디는 : " + findId.getUserId() + "입니다.");
			page = "views/user/successId.jsp";
		} else {
			System.out.println("없는 회원 정보");
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "입력하신 정보에 맞는 아이디가 없습니다.");
		}	      
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
