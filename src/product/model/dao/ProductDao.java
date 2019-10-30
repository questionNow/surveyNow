package product.model.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import board.model.vo.Board;
import point.model.vo.Point;
import product.model.vo.BuyProduct;
import product.model.vo.Product;
import product.model.vo.ProductPhoto;

import static common.JDBCTemplate.*;

public class ProductDao {

	public int insertProduct(Connection conn, Product p) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = "INSERT INTO product VALUES(SEQ_product.nextval, ?, ?, ?, ?)";
		
		try {
			pstmt=conn.prepareStatement(query);
			pstmt.setString(1, p.getCategorId());
			pstmt.setString(2, p.getProName());
			pstmt.setInt(3, p.getpPrice());
			pstmt.setString(4, p.getProText());

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

	public ArrayList selectProductList1(Connection conn) {
		Statement stmt = null;
		ResultSet rs = null;
		
		ArrayList list = null;
		String query = "SELECT * FROM product WHERE categoryid = 'p01'";
	
		try {
			stmt = conn.createStatement();
			rs= stmt.executeQuery(query);
			list = new ArrayList();
			
			while(rs.next()) {
				list.add(new Product(rs.getInt("pronum"),
						 			 rs.getString("categoryid"),
						 			 rs.getString("proname"),
						 			 rs.getInt("pprice"),
						 			 rs.getString("protext")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(stmt);
			close(rs);
		}

		return list;
	}
	
	public ArrayList selectProductList2(Connection conn) {
		Statement stmt = null;
		ResultSet rs = null;
		
		ArrayList list = null;
		String query = "SELECT * FROM product WHERE categoryid = 'p02'";
	
		try {
			stmt = conn.createStatement();
			rs= stmt.executeQuery(query);
			list = new ArrayList();
			
			while(rs.next()) {
				list.add(new Product(rs.getInt("pronum"),
						 			 rs.getString("categoryid"),
						 			 rs.getString("proname"),
						 			 rs.getInt("pprice"),
						 			 rs.getString("protext")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(stmt);
			close(rs);
		}

		return list;
	}
	
	public ArrayList selectProductList3(Connection conn) {
		Statement stmt = null;
		ResultSet rs = null;
		
		ArrayList list = null;
		String query = "SELECT * FROM product WHERE categoryid = 'p03'";
	
		try {
			stmt = conn.createStatement();
			rs= stmt.executeQuery(query);
			list = new ArrayList();
			
			while(rs.next()) {
				list.add(new Product(rs.getInt("pronum"),
						 			 rs.getString("categoryid"),
						 			 rs.getString("proname"),
						 			 rs.getInt("pprice"),
						 			 rs.getString("protext")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(stmt);
			close(rs);
		}

		return list;
	}
	
	
	public ArrayList selectProductList4(Connection conn) {
		Statement stmt = null;
		ResultSet rs = null;
		
		ArrayList list = null;
		String query = "SELECT * FROM product WHERE categoryid = 'p04'";
	
		try {
			stmt = conn.createStatement();
			rs= stmt.executeQuery(query);
			list = new ArrayList();
			
			while(rs.next()) {
				list.add(new Product(rs.getInt("pronum"),
						 			 rs.getString("categoryid"),
						 			 rs.getString("proname"),
						 			 rs.getInt("pprice"),
						 			 rs.getString("protext")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(stmt);
			close(rs);
		}

		return list;
	}
	
	public ArrayList selectProductList5(Connection conn) {
		Statement stmt = null;
		ResultSet rs = null;
		
		ArrayList list = null;
		String query = "SELECT * FROM product WHERE categoryid = 'p05'";
	
		try {
			stmt = conn.createStatement();
			rs= stmt.executeQuery(query);
			list = new ArrayList();
			
			while(rs.next()) {
				list.add(new Product(rs.getInt("pronum"),
						 			 rs.getString("categoryid"),
						 			 rs.getString("proname"),
						 			 rs.getInt("pprice"),
						 			 rs.getString("protext")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(stmt);
			close(rs);
		}

		return list;
	}
	
	public ArrayList selectProductList6(Connection conn) {
		Statement stmt = null;
		ResultSet rs = null;
		
		ArrayList list = null;
		String query = "SELECT * FROM product WHERE categoryid = 'p06'";
	
		try {
			stmt = conn.createStatement();
			rs= stmt.executeQuery(query);
			list = new ArrayList();
			
			while(rs.next()) {
				list.add(new Product(rs.getInt("pronum"),
						 			 rs.getString("categoryid"),
						 			 rs.getString("proname"),
						 			 rs.getInt("pprice"),
						 			 rs.getString("protext")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(stmt);
			close(rs);
		}

		return list;
	}
	
	public ArrayList selectProductList7(Connection conn) {
		Statement stmt = null;
		ResultSet rs = null;
		
		ArrayList list = null;
		String query = "SELECT * FROM product WHERE categoryid = 'p07'";
	
		try {
			stmt = conn.createStatement();
			rs= stmt.executeQuery(query);
			list = new ArrayList();
			
			while(rs.next()) {
				list.add(new Product(rs.getInt("pronum"),
						 			 rs.getString("categoryid"),
						 			 rs.getString("proname"),
						 			 rs.getInt("pprice"),
						 			 rs.getString("protext")));
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
		
		String query = "SELECT ROWNUM, bnum, pronum, userid, price, buydate FROM productbuy WHERE ROWNUM BETWEEN ? AND ? ORDER BY 1 DESC";
		
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
											  rs.getString("userid"),
											  rs.getInt("price"),
											  rs.getDate("buydate"));
				
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
							    rs.getString("protext"));
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
		
		String query = "UPDATE product SET categoryid = ?, proname = ?, pprice = ?, protext = ? WHERE pronum = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, p.getCategorId());
			pstmt.setString(2, p.getProName());
			pstmt.setInt(3, p.getpPrice());
			pstmt.setString(4, p.getProText());
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
	
	public int selectPoint(int pronum) {
		Connection conn = getConnection();
		Statement stmt = null;
		ResultSet rs = null;
		
		String query = "SELECT pprice FROM product WHERE pronum = "+pronum;
		
		int point = 0;
		
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(query);
			
			if(rs.next()) {
				point = rs.getInt("pprice");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rs);
		}
		
		close(conn);
		
		return point;
	}

	public int buyProduct(Connection conn, BuyProduct bp) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = "INSERT INTO productbuy VALUES(seq_buyproduct.nextval, ?, ?, ?, SYSDATE)";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, bp.getPronum());
			pstmt.setString(2, bp.getUserid());
			pstmt.setInt(3, bp.getPrice());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int insertPoint(Connection conn, BuyProduct bp) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = "INSERT INTO point VALUES(seq_point.nextval, ?, ?, SYSDATE, ?)";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, bp.getUserid());
			pstmt.setInt(2, bp.getPrice());
			pstmt.setString(3, "상품구매");
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int selectPoint(String userId) {
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String query = "SELECT point FROM user_info WHERE userid=?";
		
		int num = 0;
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userId);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				num = rs.getInt("point");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		
		close(conn);
		
		return num;
	}
	
	public int minusPointUser(Connection conn, BuyProduct bp) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = "UPDATE user_info SET point = ? WHERE userid = ?";
		
		String userId = bp.getUserid();
		int point = bp.getPrice();
		int num = selectPoint(userId);
		System.out.println((-point) - (-num));
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, (-point) - (-num));
			pstmt.setString(2, userId);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
}
