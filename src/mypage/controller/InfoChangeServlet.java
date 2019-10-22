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
 * Servlet implementation class MyPageUpdateServlet
 */
@WebServlet(urlPatterns = "/infochange.ic", name = "infochange")
public class InfoChangeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public InfoChangeServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */

	// 마이페이지 개인정보 수정
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");

		String userId = request.getParameter("userId");
		String userName = request.getParameter("userName");
		int age = Integer.parseInt(request.getParameter("age"));
		String email = request.getParameter("email1") + request.getParameter("email2");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address1") + request.getParameter("address2");
		String finalEducation = request.getParameter("finalEducation");
		String job = request.getParameter("job");
		String income = request.getParameter("income");
		String livingType = request.getParameter("livingType");
		String houseType = request.getParameter("houseType");
		String religion = request.getParameter("religion");
		String maritalStatus = request.getParameter("maritalStatus");
		String livingWith = request.getParameter("livingWith");
		String armyGo = request.getParameter("armyGo");
		String[] interestArr = request.getParameterValues("interest");

		System.out.println("1 userId : " + userId);
		System.out.println("2 userName : " + userName);
		System.out.println("3 age : " + age);
		System.out.println("4 email : " + email);
		System.out.println("5 phone : " + phone);
		System.out.println("6 address : " + address);
		System.out.println("7 finalEducation : " + finalEducation);
		System.out.println("8 job : " + job);
		System.out.println("9 income : " + income);
		System.out.println("10 livingType : " + livingType);
		System.out.println("11 houseType : " + houseType);
		System.out.println("12 religion : " + religion);
		System.out.println("13 maritalStatus : " + maritalStatus);
		System.out.println("14 livingWith : " + livingWith);
		System.out.println("15 armyGo : " + armyGo);

		for (int i = 0; i < interestArr.length; i++) {
			System.out.println("16 interestArr" + "[" + i + "] : " + interestArr[i]);
		}

		String interest = "";

		if (interestArr != null) {
			for (int i = 0; i < interestArr.length; i++) {
				if (i == interestArr.length - 1) {
					interest += interestArr[i];
				} else {
					interest += interestArr[i] + " ,";
				}
			}
		}

		UserInfo userInfo = new UserInfo(userId, userName, age, email, phone, address, finalEducation, job, income,
				livingType, houseType, religion, maritalStatus, livingWith, armyGo, interest);

		int result = new MyPageService().InfoChange(userInfo);

		RequestDispatcher view = null;
		if (result > 0) {
			view = request.getRequestDispatcher("views/common/successPage.jsp");
			request.setAttribute("msg", "회원 수정 성공");
		} else {
			view = request.getRequestDispatcher("views/common/errorPage.jsp");
			request.setAttribute("msg", "회원 수정 실패");
		}
		view.forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
