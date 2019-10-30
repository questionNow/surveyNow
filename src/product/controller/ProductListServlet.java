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
@WebServlet(name = "list.pro", urlPatterns = { "/list.pro" })
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
		ArrayList prolist = pService.selectList(1);
		
		//2. 사진 리스트도 불러오자
		ArrayList photolist = pService.selectList(2);
		
		if(prolist != null && photolist != null) {
			request.setAttribute("prolist", prolist);
			request.setAttribute("photolist", photolist);
			request.getRequestDispatcher("views/product/productListView.jsp").forward(request, response);
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
