package qna.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import qna.model.service.QnAService;
import qna.model.vo.QnA;

/**
 * Servlet implementation class AnswerInsertServlet
 */
@WebServlet("/myanswer.qn")
public class MyAnswerInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyAnswerInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		int qnaNum = Integer.valueOf(request.getParameter("qnaNum"));
		String adminId = request.getParameter("adminId");
		String acontent = request.getParameter("acontent");
		
		QnAService qService = new QnAService();
		
		int result = qService.answerInsert(qnaNum, adminId, acontent);
		QnA qna = qService.selectQnA(qnaNum);
		if(result > 0) {
			request.setAttribute("qna", qna);
			request.getRequestDispatcher("views/qna/MyQnADetailView.jsp").forward(request, response);
		} else {
			request.setAttribute("msg", "문의사항 답변 입력 실패!");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
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
