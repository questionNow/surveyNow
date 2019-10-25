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
 * Servlet implementation class RegisterServlet
 */
@WebServlet(urlPatterns = "/register.user", name = "RegisterServlet")
public class RegisterServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

   /**
    * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      request.setCharacterEncoding("utf-8");
      
      String userId = request.getParameter("userId");
      String userPwd = request.getParameter("userPwd");
      String userName = request.getParameter("userName");
      int age = Integer.parseInt(request.getParameter("age"));
      String gender = request.getParameter("gender");
      String email = request.getParameter("email1") + request.getParameter("email2");
      String phone = request.getParameter("phone");
      String address = request.getParameter("postCode") + "@" + request.getParameter("extraAddress") + "@" + request.getParameter("address1") + "@" + request.getParameter("address2");
      String recommendId = request.getParameter("recommendId");
      String finalEducation = request.getParameter("finalEducation");
      String job = request.getParameter("job");
      String income = request.getParameter("income");
      String livingType = request.getParameter("livingType");
      String houseType = request.getParameter("houseType");
      String religion = request.getParameter("religion");
      String maritalStatus = request.getParameter("maritalStatus");
      String livingWith = request.getParameter("livingWith");
      String armyGo = request.getParameter("armyGo");
      String [] interestArr = request.getParameterValues("interest");

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
      System.out.println("관심분야 잘 나오나 test " + interest);
      
      UserInfo userInfo = new UserInfo(userId, userPwd, userName, age, gender, email, phone, address, recommendId,
                                     finalEducation, job, income, livingType, houseType, religion, maritalStatus,
                                     livingWith, armyGo, interest);
      
      int result = new UserService().registerUser(userInfo);
      
      String page = "";
      if(result > 0) {
         page = "views/user/successRegister.jsp";
      } else {
         page = "views/common/errorPage.jsp";
         request.setAttribute("msg", "회원 가입에 실패하였습니다. 다시 가입해주세요");
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