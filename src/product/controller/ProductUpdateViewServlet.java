package product.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.service.BoardService;
import board.model.vo.Board;
import product.model.service.ProductService;
import product.model.vo.Product;
import product.model.vo.ProductPhoto;

/**
 * Servlet implementation class ProductUpdateViewServlet
 */
@WebServlet("/updateView.pro")
public class ProductUpdateViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductUpdateViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int pronum = Integer.valueOf(request.getParameter("pronum"));
		
		String str = null;
		
		Product product = new ProductService().selectProdutc(pronum);
		ProductPhoto proPhoto = new ProductService().selectProdutcPhoto(pronum);
		
		RequestDispatcher view = null;
		if(product != null) {
			view=request.getRequestDispatcher("views/product/productUpdateView.jsp");
			request.setAttribute("product", product);
			request.setAttribute("proPhoto", proPhoto);
			request.setAttribute("str", str);
		}else {
			view=request.getRequestDispatcher("views/common/errorPage.jsp");
			request.setAttribute("msg", "게시글 수정 실패");
		}
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
