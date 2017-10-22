package SuitcaseShop.manager;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import SuitcaseShop.common.JDBCUtil; // 자카르타 JDBC Driver 설정

public class ShopSuitcaseDBBean {
	
	private static ShopSuitcaseDBBean instance = new ShopSuitcaseDBBean();
	
	public static ShopSuitcaseDBBean getInstance() {
		return instance;		
	}
	
	private ShopSuitcaseDBBean() { }
		
	public int managerCheck(String id, String passwd) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null; 
		String dbpasswd = "";
		int x = -1;
		String sql = "";
		
		try {
			conn = JDBCUtil.getConnection();
			sql = "select managerPasswd from manager where managerId = ?";			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dbpasswd = rs.getString("managerPasswd");
				if(dbpasswd.equals(passwd)) {
					x = 1;
				} else {
					x = 0;
				}
			} else {
				x = -1;
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs, pstmt, conn);	
		}
		
		return x;
	}
	
	public void insertSuitcase(ShopSuitcaseDataBean suitcase) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = ""; 
		
		try {
			conn = JDBCUtil.getConnection();
			
			sql = "insert into suitcase values(suitcase_id.nextval,?,?,?,?,?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, suitcase.getSuitcase_kind());
			pstmt.setString(2, suitcase.getSuitcase_title());
			pstmt.setInt(3, suitcase.getSuitcase_price());
			pstmt.setShort(4, suitcase.getSuitcase_count());
			pstmt.setString(5, suitcase.getManufacturer());
			pstmt.setString(6, suitcase.getProduct_con());
			pstmt.setString(7, suitcase.getProduct_date());
			pstmt.setString(8, suitcase.getSuitcase_image());
			pstmt.setString(9, suitcase.getSuitcase_content());
			pstmt.setByte(10, suitcase.getDiscount_rate());
			pstmt.setTimestamp(11, suitcase.getReg_date());
			
			pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(pstmt, conn);	
		}
	}
	
	public int getSuitcaseCount() throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int x = 0;
		String sql = "";
		
		try {
			conn = JDBCUtil.getConnection();
			sql = "select count(*) from suitcase";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				x = rs.getInt(1);
			} 
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs, pstmt, conn);
		}
		
		return x;
	}
	
	public List<ShopSuitcaseDataBean> getSuitcases(String suitcase_kind) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<ShopSuitcaseDataBean> suitcaseList = null;
		
		String sql1 = "";
		String sql2 = "";
		
		try {
			conn = JDBCUtil.getConnection();
			sql1 = "select * from suitcase order by reg_date desc";
			sql2 = "select * from suitcase "
					+ "where suitcase_kind = ? order by reg_date desc";
			
			if(suitcase_kind.equals("all")) {
				pstmt = conn.prepareStatement(sql1);
			} else {
				pstmt = conn.prepareStatement(sql2);
				pstmt.setString(1, suitcase_kind);
			}
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				suitcaseList = new ArrayList<ShopSuitcaseDataBean>();
				do {
					ShopSuitcaseDataBean suitcase = new ShopSuitcaseDataBean();
					
					suitcase.setSuitcase_id(rs.getInt("suitcase_id"));
					suitcase.setSuitcase_kind(rs.getString("suitcase_kind"));
					suitcase.setSuitcase_title(rs.getString("suitcase_title"));
					suitcase.setSuitcase_price(rs.getInt("suitcase_price"));
					suitcase.setSuitcase_count(rs.getShort("suitcase_count"));
					suitcase.setManufacturer(rs.getString("manufacturer"));
					suitcase.setProduct_con(rs.getString("product_con"));
					suitcase.setProduct_date(rs.getString("product_date"));
					suitcase.setSuitcase_image(rs.getString("suitcase_image"));
					suitcase.setDiscount_rate(rs.getByte("discount_rate"));
					suitcase.setReg_date(rs.getTimestamp("reg_date"));
					
					suitcaseList.add(suitcase);
				} while(rs.next());
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs, pstmt, conn);
		}
		
		return suitcaseList;
	}
	
	public ShopSuitcaseDataBean[] getSuitcases(String suitcase_kind, int count) 
			throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ShopSuitcaseDataBean[] suitcaseList = null;
		int i = 0;
		String sql = "";
		
		try {
			conn = JDBCUtil.getConnection();
			
			//MySQL
			/*sql = "select * from suitcase where suitcase_kind = ? order by reg_date desc limit ?,?";*/
			//Oracle
			sql = "select * from "
					+ "(select rownum as rnum, bo.* "
					+ "from (select * from suitcase where suitcase_kind = ? order by reg_date desc) bo) "
					+ "where rnum between ? and ?";
						
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, suitcase_kind);
			pstmt.setInt(2, 1);
			pstmt.setInt(3, count);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				suitcaseList = new ShopSuitcaseDataBean[count];
				do {
					ShopSuitcaseDataBean suitcase = new ShopSuitcaseDataBean();
					suitcase.setSuitcase_id(rs.getInt("suitcase_id"));
					suitcase.setSuitcase_kind(rs.getString("suitcase_kind"));
					suitcase.setSuitcase_title(rs.getString("suitcase_title"));
					suitcase.setSuitcase_price(rs.getInt("suitcase_price"));
					suitcase.setSuitcase_count(rs.getShort("suitcase_count"));
					suitcase.setManufacturer(rs.getString("manufacturer"));
					suitcase.setProduct_con(rs.getString("product_con"));
					suitcase.setProduct_date(rs.getString("product_date"));
					suitcase.setSuitcase_image(rs.getString("suitcase_image"));
					suitcase.setDiscount_rate(rs.getByte("discount_rate"));
					suitcase.setReg_date(rs.getTimestamp("reg_date"));
					
					suitcaseList[i] = suitcase;
					
					i++;
				} while(rs.next());
			}			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs, pstmt, conn);	
		}
		
		return suitcaseList;
	}
	
	public ShopSuitcaseDataBean getSuitcase(int suitcaseId) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		ShopSuitcaseDataBean suitcase = null;
		String sql = "";
		
		try {
			conn = JDBCUtil.getConnection();
			
			sql = "select * from suitcase where suitcase_id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, suitcaseId);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				suitcase = new ShopSuitcaseDataBean();
								
				suitcase.setSuitcase_kind(rs.getString("suitcase_kind"));
				suitcase.setSuitcase_title(rs.getString("suitcase_title"));
				suitcase.setSuitcase_price(rs.getInt("suitcase_price"));
				suitcase.setSuitcase_count(rs.getShort("suitcase_count"));
				suitcase.setManufacturer(rs.getString("manufacturer"));
				suitcase.setProduct_con(rs.getString("product_con"));
				suitcase.setProduct_date(rs.getString("product_date"));
				suitcase.setSuitcase_image(rs.getString("suitcase_image"));
				suitcase.setSuitcase_content(rs.getString("suitcase_content"));
				suitcase.setDiscount_rate(rs.getByte("discount_rate"));
				
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs, pstmt, conn);	
		}
		
		return suitcase;
	}
	
	public void updateSuitcase(ShopSuitcaseDataBean suitcase, int suitcaseId) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "";
		
		try {
			conn = JDBCUtil.getConnection();
			
			sql = "update suitcase set suitcase_kind = ?, suitcase_title = ?, suitcase_price = ?, suitcase_count = ?,"
					+ "manufacturer = ?, product_con = ?, product_date = ?, suitcase_image = ?,"
					+ "suitcase_content = ?, discount_rate = ? where suitcase_id = ?";
			
			pstmt = conn.prepareStatement(sql);
						
			pstmt.setString(1, suitcase.getSuitcase_kind());
			pstmt.setString(2, suitcase.getSuitcase_title());
			pstmt.setInt(3, suitcase.getSuitcase_price());
			pstmt.setShort(4, suitcase.getSuitcase_count());
			pstmt.setString(5, suitcase.getManufacturer());
			pstmt.setString(6, suitcase.getProduct_con());
			pstmt.setString(7, suitcase.getProduct_date());
			pstmt.setString(8, suitcase.getSuitcase_image());
			pstmt.setString(9, suitcase.getSuitcase_content());
			pstmt.setByte(10, suitcase.getDiscount_rate());
			pstmt.setInt(11, suitcaseId);
			
			pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(pstmt, conn);	
		}
	}
	
	public void deleteSuitcase(int suitcaseId) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		
		try {
			conn = JDBCUtil.getConnection();
			
			sql = "delete from suitcase where suitcase_id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, suitcaseId);
			
			pstmt.executeUpdate();
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs, pstmt, conn);	
		}
	}

}
