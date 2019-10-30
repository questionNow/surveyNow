package product.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import board.model.dao.BoardDao;
import board.model.vo.Board;
import product.model.dao.ProductDao;
import product.model.vo.BuyProduct;
import product.model.vo.Product;
import product.model.vo.ProductPhoto;

import static common.JDBCTemplate.*;

public class ProductService {

	public int insertProduct(Product p, ArrayList<ProductPhoto> fileList) {
		Connection conn = getConnection();
	
		ProductDao dao = new ProductDao();
		
		int r1 = dao.insertProduct(conn, p);
		int r2 = dao.insertProductImg(conn, fileList);
		
		int result = 0;
		
		if(r1 > 0 && r2 > 0) {
			commit(conn);
			result = 1;
		} else 
			rollback(conn);
		
		close(conn);
		
		return result;
	}

	public int getListCount(String tableName) {
		Connection conn = getConnection();
		
		int listCount = new ProductDao().getListCount(conn, tableName);
		
		close(conn);
		
		return listCount;
	}

	public ArrayList selectList(int flag) {
		Connection conn = getConnection();
		ArrayList list = null;
		
		ProductDao pDao = new ProductDao();
		
		if(flag == 1) {
			list = pDao.selectProductList(conn);
		}else {
			list = pDao.selectPhotoList(conn);
		}
		
		close(conn);
		
		return list;
	}
	
	public ArrayList<BuyProduct> selectList(int currentPage, int limit) {
		Connection conn = getConnection();
		
		ArrayList<BuyProduct> list = new ProductDao().selectList(conn, currentPage, limit);
		
		close(conn);
		
		return list;
	}

	public Product selectProdutc(int pronum) {
		Connection conn = getConnection();
		
		Product p = new ProductDao().selectProduct(conn, pronum);
		
		close(conn);
		
		return p;
	}
	
	public ProductPhoto selectProdutcPhoto(int pronum) {
		Connection conn = getConnection();
		
		ProductPhoto pp = new ProductDao().selectProductPhoto(conn, pronum);
		
		close(conn);
		
		return pp;
	}

	public int deleteProduct(int pronum) {
		Connection conn = getConnection();
		
		int result = 0;
		
		int r1 = new ProductDao().deleteProduct(conn, pronum);
		int r2 = new ProductDao().deleteProImg(conn, pronum);
		if(r1 > 0 && r2 > 0){
			commit(conn);
			result = 1;
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	public int updateProduct(Product p, ArrayList<ProductPhoto> fileList) {
		Connection conn = getConnection();
		int r1 = 0;
		int r2 = 0;
		int r3 = 0;
		int result = 0;
		
			r1 = new ProductDao().updateProduct(conn, p);
			r2 = new ProductDao().deleteProImg(conn, p);
			r3 = new ProductDao().updateProductImg(conn, fileList, p);
		
		if(r1 > 0 && r2 > 0 && r3 > 0) {
			commit(conn);
			result = 1;
		} else 
			rollback(conn);
		
		close(conn);
		
		return result;
	}
}
