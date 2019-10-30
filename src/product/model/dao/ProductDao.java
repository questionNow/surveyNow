package product.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import board.model.vo.Board;
import product.model.vo.BuyProduct;
import product.model.vo.Product;
import product.model.vo.ProductPhoto;

import static common.JDBCTemplate.*;

public class ProductDao {

	public int insertProduct(Connection conn, Product p) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = "INSERT INTO product VALUES(SEQ_product.nextval, ?, ?, ?, ?, ?)";
		
		try {
			pstmt=conn.prepareStatement(query);
			pstmt.setString(1, p.getCategorId());
			pstmt.setString(2, p.getProName());
			pstmt.setInt(3, p.getpPrice());
			pstmt.setString(4, p.getProText());
			pstmt.setInt(5, p.getProCount());

			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int insertProductImg(Connection conn, ArrayList<ProductPhoto> fileList) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = "INSERT INTO productphoto VALUES(seq_productphoto.nextval, SEQ_product.currval, ?,?,?)";
		
		try {
			pstmt= conn.prepareStatement(query);
			for(int i=0; i<fileList.size(); i++) {
				ProductPhoto pp = fileList.get(i);
				
				pstmt.setString(1, pp.getPhotoName());
				pstmt.setString(2, pp.getPhotoChangeName());
				pstmt.setString(3, pp.getPhotoPath());
				
				result += pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		if(result == fileList.size())
			return result;
		else 
			return 0;
	}

//	public int insertProImg(Connection conn, ArrayList<ProductPhoto> fileList) {
//		PreparedStatement pstmt = null;
//		int result = 0;
//		
//		String query = "INSERT INTO productphoto VALUES(SEQ_productphoto.nextval, seq_product.currval, ?, ?, ?)";
//		
//		try {
//			for(int i=0; i<fileList.size();i++) {
//				ProductPhoto pp = fileList.get(i);
//				
//				pstmt=conn.prepareStatement(query);
//				pstmt.setString(1, pp.getPhotoName());
//				pstmt.setString(2, pp.getPhotoChangeName());
//				pstmt.setString(3, pp.getPhotoPath());
//				
//				result += pstmt.executeUpdate();
//			}
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}finally {
//			close(pstmt);
//		}
//		
//		// fileList가 가진 파일 갯수만큼의 행이 모두 insert가 되었다면
//		if(result == fileList.size())
//			return result;
//		else
//			return 0;
//	}

	public ArrayList selectProductList(Connection conn) {
		Statement stmt = null;
		ResultSet rs = null;
		
		ArrayList list = null;
		String query = "SELECT * FROM product";
	
		try {
			stmt = conn.createStatement();
			rs= stmt.executeQuery(query);
			list = new ArrayList();
			
			while(rs.next()) {
				list.add(new Product(rs.getInt("pronum"),
						 			 rs.getString("categoryid"),
						 			 rs.getString("proname"),
						 			 rs.getInt("pprice"),
						 			 rs.getString("protext"),
						 			 rs.getInt("procount")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(stmt);
			close(rs);
		}

		return list;
	}

	public ArrayList selectPhotoList(Connection conn) {
		Statement stmt = null;
		ResultSet rs = null;
		
		ArrayList list = null;
		
		String query = "SELECT * FROM productphoto";
		
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(query);
			
			list=new ArrayList();
			
			while(rs.next()) {
				list.add(new ProductPhoto(rs.getInt("pronum"),
										  rs.getString("photochangename")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
		}
		
		return list;
	}

	public int getListCount(Connection conn, String tableName) {
		Statement stmt = null;
		ResultSet rs = null;
		
		int listCount = 0;
		
		String query = "SELECT COUNT(*) FROM " + tableName;
		
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(query);
			
			if(rs.next()) {
				listCount=rs.getInt(1);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(stmt);
			close(rs);
		}
		return listCount;
	}

	public ArrayList<BuyProduct> selectList(Connection conn, int currentPage, int limit) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		ArrayList<BuyProduct>list = null;
		
		String query = "SELECT ROWNUM, bnum, pronum, buyid, bcount, totalprice, bdate FROM buyproduct WHERE ROWNUM BETWEEN ? AND ? ORDER BY 1 DESC";
		
		int startRow = (currentPage-1)*limit +1;	
		int endRow = startRow + limit -1;
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rs=pstmt.executeQuery();
			
			list = new ArrayList<BuyProduct>();
			
			while(rs.next()) {
				BuyProduct b = new BuyProduct(rs.getInt("bnum"),
											  rs.getInt("pronum"),
											  rs.getString("buyid"),
											  rs.getInt("bcount"),
											  rs.getInt("totalprice"),
											  rs.getDate("bdate"));
				
				list.add(b);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}

		return list;
	}

	public Product selectProduct(Connection conn, int pronum) {
		Statement stmt = null;
		ResultSet rs = null;
		
		String query = "SELECT * FROM product WHERE pronum = "+ pronum;
		
		Product p = null;
		
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(query);
			
			if(rs.next()) {
				p = new Product(rs.getInt("pronum"),
							    rs.getString("categoryid"),
							    rs.getString("proname"),
							    rs.getInt("pprice"),
							    rs.getString("protext"),
							    rs.getInt("procount"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
		}
		
		return p;
	}

	public ProductPhoto selectProductPhoto(Connection conn, int pronum) {
		Statement stmt = null;
		ResultSet rs = null;
		
		String query = "SELECT * FROM productphoto WHERE pronum = " + pronum;
		
		ProductPhoto pp = null;
	
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(query);
			
			if(rs.next()) {
				pp = new ProductPhoto(rs.getInt("photonum"),
									  rs.getInt("pronum"),
									  rs.getString("photoname"),
									  rs.getString("photochangename"),
									  rs.getString("photopath"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
		}
		
		return pp;
	}

	public int deleteProduct(Connection conn, int pronum) {
		Statement stmt = null;
		int result = 0;
		
		String query = "DELETE FROM product WHERE pronum = " + pronum;
		
		try {
			stmt = conn.createStatement();
			result = stmt.executeUpdate(query);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
		}
		
		return result;
	}
	
	public int deleteProImg(Connection conn, int pronum) {
		Statement stmt = null;
		int result = 0;
		
		String query = "DELETE FROM productphoto WHERE pronum = " + pronum;
		
		try {
			stmt = conn.createStatement();
			result = stmt.executeUpdate(query);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
		}
		
		return result;
	}

	public int updateProduct(Connection conn, Product p) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = "UPDATE product SET categoryid = ?, proname = ?, pprice = ?, protext = ?, procount = ? WHERE pronum = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, p.getCategorId());
			pstmt.setString(2, p.getProName());
			pstmt.setInt(3, p.getpPrice());
			pstmt.setString(4, p.getProText());
			pstmt.setInt(5, p.getProCount());
			pstmt.setInt(6, p.getProNum());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int updateProductImg(Connection conn, ArrayList<ProductPhoto> fileList, Product p) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = "INSERT INTO productphoto VALUES(seq_productphoto.nextval, ?,?,?,?)";
		
		try {
			pstmt= conn.prepareStatement(query);
			for(int i=0; i<fileList.size(); i++) {
				ProductPhoto pp = fileList.get(i);
				
				pstmt.setInt(1, p.getProNum());
				pstmt.setString(2, pp.getPhotoName());
				pstmt.setString(3, pp.getPhotoChangeName());
				pstmt.setString(4, pp.getPhotoPath());
			
				
				result += pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		if(result == fileList.size())
			return result;
		else 
			return 0;
	}

	public int deleteProImg(Connection conn, Product p) {
		Statement stmt = null;
		int result = 0;
		
		String query = "DELETE FROM productphoto WHERE pronum = "+p.getProNum();
		
		try {
			stmt = conn.createStatement();
			result = stmt.executeUpdate(query);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
		}
		
		return result;
	}
}
