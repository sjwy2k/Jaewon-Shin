package SuitcaseShop.buy;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import SuitcaseShop.cart.CartDataBean;

public class BuyDBBean {
	private static BuyDBBean instance = new BuyDBBean();
	
	public static BuyDBBean getInstance() {
		return instance;
	}
	
	private BuyDBBean() { }
	
	private Connection getConnection() throws Exception {
		Context initCtx = new InitialContext();
		Context envCtx = (Context) initCtx.lookup("java:comp/env");
		DataSource ds = (DataSource)envCtx.lookup("jdbc/basicjsp");
		return ds.getConnection();
	}
	
	
	// 구매 테이블인 buy에 구매목록 등록, 5개의 SQL 쿼리
	public void insertBuy(
		List<CartDataBean> lists, String id, String account, 
		String deliveryName, String deliveryTel, String deliveryAddress
		) throws Exception{
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Timestamp reg_date = null;
		
		String sql = "";
		String maxDate = "";
		String number = "";
		String todayDate = "";
		String compareDate = "";
		long buyId = 0;
		short nowCount;
		
		try {
			conn = getConnection();
			reg_date = new Timestamp(System.currentTimeMillis());
			todayDate = reg_date.toString();
			compareDate = todayDate.substring(0, 4) + 
					todayDate.substring(5, 7) + todayDate.substring(8, 10);
			// 쿼리 1. 구매수량 조회			
			sql = "select max(buy_id) from buy";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			rs.next();
			if(rs.getLong(1) > 0) { // 구매아이디가 있다면..
				Long val = new Long(rs.getLong(1));
				maxDate = val.toString().substring(0, 8);
				number = val.toString().substring(8);
				if(compareDate.equals(maxDate)) {
					if(Integer.parseInt(number)+1 < 10000) {
						buyId = Long.parseLong(maxDate + (Integer.parseInt(number)+1+10000));
					} else {
						buyId = Long.parseLong(maxDate + (Integer.parseInt(number)+1));
					}
				} else {
					compareDate += "00001";
					buyId = Long.parseLong(compareDate);
				}
			} else {
				compareDate += "00001";
				buyId = Long.parseLong(compareDate);
			}
			// 구매가 시작되므로 여기서부터 트랜잭션 처리
			conn.setAutoCommit(false);
			
			for(int i = 0; i < lists.size(); i++) {
				// 해당 아이디에 대한 cart 테이블 레코드를 가져온 후 buy테이블에 추가
				CartDataBean cart = lists.get(i);
				// 쿼리 2. 추가하는 insert 쿼리
				sql = 
				"insert into buy("
				+ "buy_id, buyer, suitcase_id, suitcase_title, buy_price, buy_count, "
				+ "suitcase_image, buy_date, account, deliveryName, deliveryTel, deliveryAddress) "
				+ "values(?,?,?,?,?,?,?,?,?,?,?,?)";
				pstmt= conn.prepareStatement(sql);
				
				pstmt.setLong(1, buyId);
				pstmt.setString(2, id);
				pstmt.setInt(3, cart.getSuitcase_id());
				pstmt.setString(4, cart.getSuitcase_title());
				pstmt.setInt(5, cart.getBuy_price());
				pstmt.setByte(6, cart.getBuy_count());
				pstmt.setString(7, cart.getSuitcase_image());
				pstmt.setTimestamp(8, reg_date);
				pstmt.setString(9, account);
				pstmt.setString(10, deliveryName);
				pstmt.setString(11, deliveryTel);
				pstmt.setString(12, deliveryAddress);
				
				pstmt.executeUpdate();
				// 쿼리 3. 아이디에 해당하는 재고수량 조회
				sql = "select suitcase_count from suitcase where suitcase_id=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, cart.getSuitcase_id());
				
				rs = pstmt.executeQuery();
				
				rs.next();
				
				nowCount = (short)(rs.getShort(1) - cart.getBuy_count());
				// 쿼리 4. 재고량 갱신
				sql = "update suitcase set suitcase_count=? where suitcase_id = ?";
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setShort(1, nowCount);
				pstmt.setInt(2, cart.getSuitcase_id());
				
				pstmt.executeUpdate();
				
			}
			// 쿼리 5. 구매 완료 후 장바구니에 해당 구매품목 삭제.
			sql = "delete from cart where buyer=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
			pstmt.executeUpdate();
			
			conn.commit(); // 구매 승인 완료
			conn.setAutoCommit(true); // 다음 작업을 위한 트랜잭션 종료		
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			if(rs != null) {
				try { rs.close(); } catch(Exception e) { e.printStackTrace(); }
			}
			if(pstmt != null) {
				try { pstmt.close(); } catch(Exception e) { e.printStackTrace(); }
			}
			if(conn != null) {
				try { conn.close(); } catch(Exception e) { e.printStackTrace(); }
			}
		}
	}
	// id에 해당하는  buy 테이블의 레코드를 조회하는 메서드 
	public int getListCount(String id) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int x = 0;
		String sql = "";
		
		try {
			conn = getConnection();
						
			sql = "select count(*) from buy where buyer=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				x = rs.getInt(1);
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			if(rs != null) {
				try { rs.close(); } catch(Exception e) { e.printStackTrace(); }
			}
			if(pstmt != null) {
				try { pstmt.close(); } catch(Exception e) { e.printStackTrace(); }
			}
			if(conn != null) {
				try { conn.close(); } catch(Exception e) { e.printStackTrace(); }
			}
		}
		
		return x;
	}
	// buy 테이블의 전체 목록 조회.
	public int getListCount() throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int x = 0;
		String sql = "";
		
		try {
			conn = getConnection();
						
			sql = "select count(*) from buy";
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				x = rs.getInt(1);
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			if(rs != null) {
				try { rs.close(); } catch(Exception e) { e.printStackTrace(); }
			}
			if(pstmt != null) {
				try { pstmt.close(); } catch(Exception e) { e.printStackTrace(); }
			}
			if(conn != null) {
				try { conn.close(); } catch(Exception e) { e.printStackTrace(); }
			}
		}
		
		return x;
	}
	// id에 해당하는 buy 테이블의 구매목록을 조회
	public List<BuyDataBean> getBuyList(String id) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		BuyDataBean buy = null;
		List<BuyDataBean> lists = null;
		
		String sql = "";
		
		try {
			conn = getConnection();
						
			sql = "select * from buy where buyer = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			lists = new ArrayList<BuyDataBean>();
			while(rs.next()) {
				buy = new BuyDataBean();
				
				buy.setBuy_id(rs.getLong("buy_id"));
				buy.setSuitcase_id(rs.getInt("suitcase_id"));
				buy.setSuitcase_title(rs.getString("suitcase_title"));
				buy.setBuy_price(rs.getInt("buy_price"));
				buy.setBuy_count(rs.getByte("buy_count"));
				buy.setSuitcase_image(rs.getString("suitcase_image"));
				buy.setSanction(rs.getString("sanction"));
				
				lists.add(buy);
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			if(rs != null) {
				try { rs.close(); } catch(Exception e) { e.printStackTrace(); }
			}
			if(pstmt != null) {
				try { pstmt.close(); } catch(Exception e) { e.printStackTrace(); }
			}
			if(conn != null) {
				try { conn.close(); } catch(Exception e) { e.printStackTrace(); }
			}
		}
		
		return lists;
	}
	// buy 테이블의 구매목록 전체 조회
	public List<BuyDataBean> getBuyList() throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		BuyDataBean buy = null;
		List<BuyDataBean> lists = null;
		
		String sql = "";
		
		try {
			conn = getConnection();
						
			sql = "select * from buy";
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			lists = new ArrayList<BuyDataBean>();
			while(rs.next()) {
				buy = new BuyDataBean();
				
				buy.setBuy_id(rs.getLong("buy_id"));
				buy.setBuyer(rs.getString("buyer"));
				buy.setSuitcase_id(rs.getInt("suitcase_id"));
				buy.setSuitcase_title(rs.getString("suitcase_title"));
				buy.setBuy_price(rs.getInt("buy_price"));
				buy.setBuy_count(rs.getByte("buy_count"));
				buy.setSuitcase_image(rs.getString("suitcase_image"));
				buy.setBuy_date(rs.getTimestamp("buy_date"));
				buy.setAccount(rs.getString("account"));
				buy.setDeliveryName(rs.getString("deliveryName"));
				buy.setDeliveryTel(rs.getString("deliveryTel"));
				buy.setDeliveryAddress(rs.getString("deliveryAddress"));
				buy.setSanction(rs.getString("sanction"));
				
				lists.add(buy);
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			if(rs != null) {
				try { rs.close(); } catch(Exception e) { e.printStackTrace(); }
			}
			if(pstmt != null) {
				try { pstmt.close(); } catch(Exception e) { e.printStackTrace(); }
			}
			if(conn != null) {
				try { conn.close(); } catch(Exception e) { e.printStackTrace(); }
			}
		}
		
		return lists;
	}
}
