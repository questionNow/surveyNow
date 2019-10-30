package product.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.FileRenamePolicy;

import common.MyFileRenamePolicy;
import product.model.service.ProductService;
import product.model.vo.Product;
import product.model.vo.ProductPhoto;

/**
 * Servlet implementation class ProductInsertServlet
 */
@WebServlet("/insert.pro")
public class ProductInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(ServletFileUpload.isMultipartContent(request)) {
			int maxSize = 1024 * 1024 * 10;
			
			String root = request.getSession().getServletContext().getRealPath("/");
			String savePath = root + "ProductImg/";
			
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			ArrayList<String> saveFiles = new ArrayList<String>();
			ArrayList<String> originFiles = new ArrayList<String>();
			
			Enumeration<String> files = multiRequest.getFileNames();
			while(files.hasMoreElements()) {
				String name = files.nextElement();
				
				if(multiRequest.getFilesystemName(name) != null) {
					saveFiles.add(multiRequest.getFilesystemName(name));
					originFiles.add(multiRequest.getOriginalFileName(name));
				}
			}
			
			String category = multiRequest.getParameter("category");
			String proName = multiRequest.getParameter("proName");
			int price = Integer.valueOf(multiRequest.getParameter("price"));
			int count = Integer.valueOf(multiRequest.getParameter("pCount"));
			String content = multiRequest.getParameter("content");
			
			Product p = new Product();
			p.setCategorId(category);
			p.setProName(proName);
			p.setpPrice(price);
			p.setProCount(count);
			p.setProText(content);
			
			ArrayList<ProductPhoto> fileList = new ArrayList<ProductPhoto>();
			for(int i=originFiles.size()-1; i>=0; i--) {
				ProductPhoto pp = new ProductPhoto();
				pp.setPhotoPath(savePath);
				pp.setPhotoName(originFiles.get(i));
				pp.setPhotoChangeName(saveFiles.get(i));
				
				fileList.add(pp);
			}
			
			int result = new ProductService().insertProduct(p, fileList);
			
			if(result > 0) {
				response.sendRedirect("/surveyNow/list.pro?currentPage=1");
			} else {
				for(int i=0; i<saveFiles.size(); i++) {
					File failedFile = new File(savePath + saveFiles.get(i));
					failedFile.delete();
				}
				request.setAttribute("msg", "상품 등록 실패");
				request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
			}
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
