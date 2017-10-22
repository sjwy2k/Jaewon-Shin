package SuitcaseShop.cart;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import SuitcaseShop.common.JDBCUtil; // 자카르타 JDBC Driver 설정


public class CartDBBean {
	
	private static CartDBBean instance = new CartDBBean();
	
	public static CartDBBean getInstance() {
		return instance;
	}
	
	private CartDBBean() { }
	
	
	public void insertCart(CartDataBean cart) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "";
		
		try {
			conn = JDBCUtil.getConnection();
			sql = 
"insert into cart(cart_id, suitcase_id, buyer, suitcase_title, "
+ "buy_price, buy_count, suitcase_image) values(cart_id.nextval,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, cart.getSuitcase_id());
			pstmt.setString(2, cart.getBuyer());
			pstmt.setString(3, cart.getSuitcase_title());
			pstmt.setInt(4, cart.getBuy_price());
			pstmt.setByte(5, cart.getBuy_count());
			pstmt.setString(6, cart.getSuitcase_image());
			
			pstmt.executeUpdate();			

		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(pstmt, conn);
		}
	}
	
	public int getListCount(String id) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int x = 0;
		String sql = "";
		
		try {
			conn = JDBCUtil.getConnection();
			
			sql = "select count(*) from cart where buyer=?";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				x= rs.getInt(1);
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs, pstmt, conn);
		}
		return x;
	}
	
	public List<CartDataBean> getCart(String id) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		CartDataBean cart = null;
		String sql = "";
		List<CartDataBean> lists = null;
		
		try {
			conn = JDBCUtil.getConnection();
			
			sql = "select * from cart where buyer = ?";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			lists = new ArrayList<CartDataBean>();
			
			while(rs.next()) {
				cart = new CartDataBean();
				
				cart.setCart_id(rs.getInt("cart_id"));
				cart.setSuitcase_id(rs.getInt("suitcase_id"));
				cart.setSuitcase_title(rs.getString("suitcase_title"));
				cart.setBuy_price(rs.getInt("buy_price"));
				cart.setBuy_count(rs.getByte("buy_count"));
				cart.setSuitcase_image(rs.getString("suitcase_image"));
				
				lists.add(cart);
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs, pstmt, conn);
		}
		return lists;
	}
	
	public void updateCount(int cart_id, byte count) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "";
		
		try {
			conn = JDBCUtil.getConnection();
			
			sql = "update cart set buy_count=? where cart_id=?";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setByte(1, count);
			pstmt.setInt(2, cart_id);
			
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(pstmt, conn);
		}
	}
	
	public void deleteList(int cart_id) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "";
		
		try {
			conn = JDBCUtil.getConnection();
			
			sql = "delete from cart where cart_id=?";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, cart_id);
			
			pstmt.executeUpdate();
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {			
			JDBCUtil.close(pstmt, conn);
		}
	}
	
	public void deleteAll(String id) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "";
		
		try {
			conn = JDBCUtil.getConnection();
			
			sql = "delete from cart where buyer=?";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, id);
			
			pstmt.executeUpdate();
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {			
			JDBCUtil.close(pstmt, conn);
		}
	}
}
