package product.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import board.model.service.BoardService;
import board.model.vo.Board;
import point.model.vo.Point;
import product.model.dao.ProductDao;
import product.model.service.ProductService;
import product.model.vo.BuyProduct;
import user.model.vo.UserInfo;

/**
 * Servlet implementation class ProductBuyServlet
 */
@WebServlet("/buy.pro")
public class ProductBuyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductBuyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		int pronum = Integer.valueOf(request.getParameter("pronum"));
		int price = new ProductDao().selectPoint(pronum);
		HttpSession session = request.getSession();
		
		UserInfo loginUser = (UserInfo)session.getAttribute("loginUser");
		String userId = String.valueOf(loginUser.getUserId());	
		
		BuyProduct bp = new BuyProduct();
		bp.setPronum(pronum);
		bp.setUserid(userId);
		bp.setPrice(price);

		int result = new ProductService().buyProduct(bp);
		
		if(result>0) {
			response.sendRedirect("/surveyNow/list.pro?currentPage=1"); 
		}else {
			request.setAttribute("msg","게시판 작성 실패");
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
