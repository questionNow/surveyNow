package product.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.service.BoardService;
import board.model.vo.Board;
import board.model.vo.PageInfo;
import product.model.service.ProductService;

/**
 * Servlet implementation class ProductListServlet
 */
@WebServlet("/list.pro")
public class ProductListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ProductService pService = new ProductService();

		//1. 우선 사진 게시판 리스트 정보를 불러오자
		ArrayList prolist1 = pService.selectList1(1);
		ArrayList prolist2 = pService.selectList2(1);
		ArrayList prolist3 = pService.selectList3(1);
		ArrayList prolist4 = pService.selectList4(1);
		ArrayList prolist5 = pService.selectList5(1);
		ArrayList prolist6 = pService.selectList6(1);
		ArrayList prolist7 = pService.selectList7(1);
		
		
		//2. 사진 리스트도 불러오자
		ArrayList photolist = pService.selectList1(2);
		
		if(prolist1 != null && prolist2 != null && prolist3 != null && prolist4 != null && prolist5 != null && prolist6 != null && prolist7 != null 
				&& photolist != null) {
			request.setAttribute("prolist1", prolist1);
			request.setAttribute("prolist2", prolist2);
			request.setAttribute("prolist3", prolist3);
			request.setAttribute("prolist4", prolist4);
			request.setAttribute("prolist5", prolist5);
			request.setAttribute("prolist6", prolist6);
			request.setAttribute("prolist7", prolist7);
			request.setAttribute("photolist", photolist);
			request.getRequestDispatcher("views/product/userProductListView.jsp").forward(request, response);
		}else {
			request.setAttribute("msg","사진 게시판 조회 실패!!");
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
