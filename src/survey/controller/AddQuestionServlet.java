package survey.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import oracle.net.aso.e;
import survey.model.vo.*;

/**
 * Servlet implementation class AddQuestionServlet
 */
@WebServlet("/addQuestion.sv")
public class AddQuestionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddQuestionServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 설문의 질문 수 받아오기
		int qNum = Integer.valueOf(request.getParameter("qNum"));
		qNum++;	// 질문 갯수 ++
		
		// 설문 - 질문에 보기 수 받아오기
		int aNum = Integer.valueOf(request.getParameter("aNum"));
		aNum++;	// 보기 갯수 ++
		
		HashMap m = new HashMap();
		m.put("survey", qNum);
		m.put("question", aNum);
		
		response.setContentType("application/json");
		new Gson().toJson(m,response.getWriter());
		
		
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
