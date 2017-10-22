package SuitcaseShop.account;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import java.util.ArrayList;
import java.util.List;

import SuitcaseShop.common.JDBCUtil; // 자카르타 JDBC Driver 설정

public class BankDBBean {
	private static BankDBBean instance = new BankDBBean();
	
	public static BankDBBean getInstance() {
		return instance;
	}
	
	private BankDBBean() { }
		
	// bank 테이블에 계좌를 등록
	public void insertAccount(BankDataBean member) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		
		
		try {
			conn = JDBCUtil.getConnection();
			sql = "insert into bank (id, account, bank, reg_date) values(?, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getAccount());
			pstmt.setString(3, member.getBank());
			pstmt.setTimestamp(4, member.getReg_date());
			
			pstmt.executeUpdate();
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs, pstmt, conn);
		}
	}
	
	// bank 테이블에 있는 전체 레코드를 조회하는 메서드
	public List<String> getAccount(String id) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<String> accountList = null;
		String sql = "";
		
		try {
			conn = JDBCUtil.getConnection();
			
			sql = "select account, bank, name from member "
				+ "m inner join bank b on m.id = b.id "
				+ "where m.id=? "
				+ "order by b.reg_date desc";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			accountList = new ArrayList<String>();
			
			while(rs.next()) {
				String account = new String(rs.getString("account")+" "
					+ rs.getString("bank")+" " + rs.getString("name"));
				accountList.add(account);				
			}			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs, pstmt, conn);
		}
		
		return accountList;
	}
	
	public void updateAccount(BankDataBean member, String account) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "";
		
		try {
			conn = JDBCUtil.getConnection();
						
			sql = "update bank set account=?, bank=?, reg_date=? "
					+ "where id=? and account=?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getAccount());
			pstmt.setString(2, member.getBank());
			pstmt.setTimestamp(3, member.getReg_date());
			pstmt.setString(4, member.getId());
			pstmt.setString(5, account);
			
			pstmt.executeUpdate();			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs, pstmt, conn);
		}
	}	
	
	public void deleteAccount(String id, String account) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "";
		
		try {
			conn = JDBCUtil.getConnection();
						
			sql = "delete from bank where id=? and account=?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, account);
			
			pstmt.executeUpdate();		
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(pstmt, conn);
		}
	}
}
