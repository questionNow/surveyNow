package user.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import board.model.service.BoardService;
import board.model.vo.Board;
import survey.model.vo.Survey;
import user.model.service.UserService;
import user.model.vo.UserInfo;

/**
 * Servlet implementation class AttendanceCheck
 */
@WebServlet("/attendance.ck")
public class AttendanceCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AttendanceCheck() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 request.setCharacterEncoding("UTF-8");	// 로그인에서는 필요없음(한글 쓸일 없으니까)
		 
		 String userId = request.getParameter("userId");
		 String userPwd = request.getParameter("userPwd");

		 //UserInfo user = new UserInfo(userId, userPwd);
		 int result2 = new UserService().attendanceCheck(userId);
		 RequestDispatcher view = null;
		 
System.out.println("춣석체크 result : " + result2);

		 if(result2 > 0) {	//성공일 경우
// 메인화면 공지사항 / 설문 ---------------------------------------------------------------------------------------------
			 
			 BoardService bService = new BoardService();
			 //String tableName = "board";
			 //int listCount = bService.getListCount(tableName);
			 
			 ArrayList<Board> blist = bService.mainBoardList(); 					//-공지사항
			 ArrayList<Survey> rlist = new UserService().selectSurveyList(userId);	//-설문
// 메인화면 공지사항 / 설문  ---------------------------------------------------------------------------------------------		 
			 
			 // 오늘 출석체크 유무
				int result = new UserService().loginAtCheck(userId);
				
				String attcheck = ""; 
System.out.println("오늘 출석 했냐? : " + result);
				if(result > 0) {
					attcheck = "Y";
				} else {
					attcheck = "N";
				}

			 
			 request.setAttribute("rlist", rlist); // 메인화면에 설문내역 출력
			 request.setAttribute("blist", blist); // menubar에 공지사항 출력
			 request.setAttribute("attcheck", attcheck); // 메인화면 출석체크 유무
			 
			 view = request.getRequestDispatcher("views/common/mainLoing.jsp");
			 //request.getRequestDispatcher("views/common/mainLoing.jsp").forward(request, response);
			  
		 }else {//실패할 경우
			 request.setAttribute("msg", "로그인 실패");
			 view = request.getRequestDispatcher("views/common/errorPage.jsp");
			 //view.forward(request, response);
		 }
		 view.forward(request, response);
		 		 
		 //int result = new BoardService().insertBoard(b);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
