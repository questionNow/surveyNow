package survey.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import user.model.service.UserService;
import user.model.vo.UserInfo;

/**
 * Servlet implementation class DoPurchaseServlet
 */
@WebServlet("/DoPurchase.sv")
public class DoPurchaseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DoPurchaseServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String sNums = request.getParameter("sNums");
		System.out.println("doPurch Servlet : " + sNums);
		int price = Integer.valueOf(request.getParameter("price"));
		String userId = request.getParameter("userId");
		
		UserInfo userInfo = new UserService().selectMember(userId);
		
		
		request.setAttribute("sNums", sNums);
		request.setAttribute("userInfo", userInfo);
		request.setAttribute("price", price);
		
		request.getRequestDispatcher("views/survey/Purchase.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
