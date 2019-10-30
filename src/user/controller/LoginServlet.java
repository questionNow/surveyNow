package user.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.jni.User;

import survey.model.service.SurveyService;
import survey.model.vo.Survey;
import user.model.service.UserService;
import user.model.vo.UserInfo;

import board.model.service.BoardService;
import board.model.vo.Board;

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
       request.setCharacterEncoding("UTF-8");   // 로그인에서는 필요없음(한글 쓸일 없으니까)
       
       //String userId = request.getParameter("userId");
       //String userPwd = request.getParameter("userPwd");
       
 // 홈버튼 클릭했을때 or 로그인페이지 호출했을때
 if(request.getParameter("userPwdType") != null) {
    
    
          String userId = request.getParameter("userId");
          String userPwd = request.getParameter("userPwdV");

          System.out.println("userId : " + userId);
          System.out.println("userPwd : " + userPwd); 
          //System.out.println("userPwdV : " + userPwdV); 
                 
                 UserInfo user = new UserInfo(userId, userPwd);
                 UserInfo loginUser = new UserService().loginUser(user);
                 
          System.out.println("loginUser : " + loginUser);   

                 // 오늘 출석체크 유무
                int result = new UserService().loginAtCheck(userId);
                
                String attcheck = ""; 
                
                if(result > 0) {
                   attcheck = "Y";
                } else {
                   attcheck = "N";
                }
                 
          // 메인화면에 설문가능한 내역 출력 -------------------------------------------------------------------------
                   // 당장은 survey에서 빼오는걸로 하는데 .. 
                   // user_info 테이블이랑 엮어야함
                 ArrayList<Survey> rlist = new UserService().selectSurveyList(userId);
          // 메인화면에 설문가능한 내역 출력 -------------------------------------------------------------------------
                 
          // 메인화면 공지사항 ---------------------------------------------------------------------------------------------
                 
                 BoardService bService = new BoardService();
                 String tableName = "board";
                 int listCount = bService.getListCount(tableName);
                 
                 ArrayList<Board> blist = bService.mainBoardList();
                 
          // 메인화면 공지사항 ---------------------------------------------------------------------------------------------       
                 
                 response.setContentType("text/html;charset=utf-8");
                 RequestDispatcher view = null;
                 
                 if (loginUser != null) { // 성공일 경우

                      HttpSession session = request.getSession();

                      session.setAttribute("loginUser", loginUser);
                       PrintWriter out = response.getWriter();
                       
                       session.setAttribute("loginUser", loginUser);
                       request.setAttribute("rlist", rlist); // 메인화면에 설문내역 출력
                       request.setAttribute("blist", blist); // menubar에 공지사항 출력
                       request.setAttribute("attcheck", attcheck); // 메인화면 출석체크 유무 
                       
                      // usertpye 구분해서 로그인하는 것
                      int usertype = UserService.userType(userId);
                      if (usertype == 2) {
                         view = request.getRequestDispatcher("views/common/mainLoing.jsp");
                      } else if (usertype == 1) {
                         view = request.getRequestDispatcher("views/common/adminMain.jsp");
                      }

                   } else {// 실패할 경우
                       PrintWriter out = response.getWriter();
                       out.println("<script> alert('로그인을 다시 시도해주세요!!!'); location.href='views/common/loginPage.jsp'; </script>");
                       out.flush();
                       out.close();
                    } 
                    view.forward(request, response);   
          
}else {// 아래는 기존에 로그인방식임
   
   
   
          String userId = request.getParameter("userId");
          String userPwd = request.getParameter("userPwd");
          
          
          System.out.println("userId : " + userId);
          System.out.println("userPwd : " + userPwd); 
          //System.out.println("userPwdV : " + userPwdV); 
                 
                 UserInfo user = new UserInfo(userId, userPwd);
                 UserInfo loginUser = new UserService().loginUser(user);
                 
          System.out.println("loginUser : " + loginUser);   

                 // 오늘 출석체크 유무
                int result = new UserService().loginAtCheck(userId);
                
                String attcheck = ""; 
                
                if(result > 0) {
                   attcheck = "Y";
                } else {
                   attcheck = "N";
                }
                 
          // 메인화면에 설문가능한 내역 출력 -------------------------------------------------------------------------
                   // 당장은 survey에서 빼오는걸로 하는데 .. 
                   // user_info 테이블이랑 엮어야함
                ArrayList<Survey> sList = new SurveyService().selectSurveys(userId);

          // 메인화면에 설문가능한 내역 출력 -------------------------------------------------------------------------
                 
          // 메인화면 공지사항 ---------------------------------------------------------------------------------------------
                 
                 BoardService bService = new BoardService();
                 String tableName = "board";
                 int listCount = bService.getListCount(tableName);
                 
                 ArrayList<Board> blist = bService.mainBoardList();
                 
          // 메인화면 공지사항 ---------------------------------------------------------------------------------------------       
                 
                 response.setContentType("text/html;charset=utf-8");
                 RequestDispatcher view = null;
                 
                 if (loginUser != null) { // 성공일 경우

                      HttpSession session = request.getSession();

                      session.setAttribute("loginUser", loginUser);
                       PrintWriter out = response.getWriter();
                       
                       session.setAttribute("loginUser", loginUser);
                       request.setAttribute("sList", sList); // 메인화면에 설문내역 출력
                       request.setAttribute("blist", blist); // menubar에 공지사항 출력
                       request.setAttribute("attcheck", attcheck); // 메인화면 출석체크 유무 
                       
                      // usertpye 구분해서 로그인하는 것
                      int usertype = UserService.userType(userId);
                      if (usertype == 2) {
                         view = request.getRequestDispatcher("views/common/mainLoing.jsp");
                      } else if (usertype == 1) {
                         view = request.getRequestDispatcher("views/common/adminMain.jsp");
                      }

                   } else {// 실패할 경우
                       PrintWriter out = response.getWriter();
                       out.println("<script> alert('로그인을 다시 시도해주세요!!!'); location.href='views/common/loginPage.jsp'; </script>");
                       out.flush();
                       out.close();
                    }
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



