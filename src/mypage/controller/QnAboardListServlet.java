package mypage.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mypage.model.service.MyPageService;
import mypage.model.vo.Board;
import mypage.model.vo.PageInfo;

/**
 * Servlet implementation class BoardListServlet
 */
@WebServlet("/myqnalist.qna")
public class QnAboardListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QnAboardListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Servlet을 만들면 vo클래스가 필요하다는 생각을 하자! vo클래스의 객체를(request에 담긴 값으로 생성된)를 dao까지 넘길꺼니깐)
		
				// 두개의 서비스를 호출할꺼기 떄문에 서비스 객체를 참조형 변수로 담아두자
				MyPageService mService = new MyPageService();
				
				// 게시판 리스트 갯수 구하기
				int listCount = mService.getListCount();
				
				//----------페이징 처리 추가-----------
				// 페이지 수 처리용 변수 선언
				int currentPage;    // 현재 페이지를 표시할 변수
				int limit;          // 한 페이지에 게시글이 몇개가 보여질지와 한 페이지에서 처리 가능한 페이지 수
				int maxPage;        // 전체 페이지에서 가장 마지막 페이지
				int startPage;      // 한번에 표시될 페이지가 시작할 페이지
				int endPage;        // 한번에 표시될 페이지가 끝나는 페이지
				
				// ex) 총 123개의 게시글이 있다면..
				//		<<1 2 3 4 5 6 7 8 9 10>> 이후에도 페이지가 더 있어야 한다.
				//		<<11 12 13>>     <-- 여기서 11이 startPage, 13이 endPage, 13이 maxPage
				
				
				// * currentPage - 현재 페이지
				// 기본 게시판은 1페이지부터 시작함
				currentPage = 1;   // 1페이지를 default로 가져가자
				// 하지만, 페이지 전환시 전달받은 현재 페이지가 있을 시 해당 페이지를 currentPage로 적용
				if(request.getParameter("currentPage")!=null) {
					currentPage = Integer.parseInt(request.getParameter("currentPage"));
				}

				// * limit - 한 페이지에 보여질 목록 갯수
				limit = 10;
				
				// * maxPage - 총 페이지 수
				// 목록 수가 123개이면 13페이지가 마지막 페이지다
				// 짜투리 목록이 최소 1개일 때, 한 page로써 의미를 갖게 하기 위해서 0.9를 더해주자
				maxPage=(int)((double)listCount/limit + 0.9);
			
				// * startPage - 현재 페이지에 보여질 시작 페이지 수
				// 아래쪽에 페이지 수가 10개씩 보여지게 할 경우
				// 1, 11, 21, 31, ...
				startPage = (((int)((double)currentPage/limit+0.9))-1)*limit +1;
				
				
				// * endPage - 현재 페이지에서 보여질 마지막 페이지 수
				// 아래쪽에 페이지 수가 10개씩 보여지게 할 경우
				// 10, 20, 30, 40, ...
				endPage = startPage + limit -1;
				
				// 하지만!! 마지막 페이지 수가 총 페이지 수보다 클 경우
				// maxPage가 13이고, endpage가 20페이지일 경우
				if(maxPage < endPage) {
					endPage = maxPage;
				}
				
				// 자 위에서 계산된 모든 페이지 관련 변수들을 request에 담아서 보내야 될텐데 너무 많다!
				// 그래서 페이지 정보를 공휴할 vo 객체 pageInfo를 만들러 가자!(page정보만 지닌 객체를 만들어서 넘기기 위해)
				PageInfo pi = new PageInfo(currentPage, listCount, limit, maxPage, startPage, endPage);
				
				// 게시판 리스트 조회해오기
				ArrayList<Board> list = mService.selectList(currentPage, limit);
				
				RequestDispatcher view = null;
				if(list != null) {
					view = request.getRequestDispatcher("views/board/boardListView.jsp");
					request.setAttribute("list",list);     // 현재 페이지에 화면에 뿌려질 게시글이 담긴 객체
					request.setAttribute("pi",pi);		   // 페이지에 관련된 정보가 담긴 객체
				}else {
					view = request.getRequestDispatcher("views/common/errorPage.jsp");
					request.setAttribute("msg","게시판 리스트 조회 실패!");
				}
				view.forward(request, response);
				
				// boardListView.jsp 페이지 만들러 ㄱㄱ씽!
			}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
