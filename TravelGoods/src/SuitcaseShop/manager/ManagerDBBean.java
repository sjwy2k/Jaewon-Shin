package SuitcaseShop.manager;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import SuitcaseShop.common.JDBCUtil; // 자카르타 JDBC Driver 설정

import SuitcaseShop.manager.ManagerDataBean;

public class ManagerDBBean {
	
private static ManagerDBBean instance = new ManagerDBBean();
	
	public static ManagerDBBean getInstance() {
		return instance;		
	}
	
	private ManagerDBBean() { }
		
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
	
	public List<ManagerDataBean> getManagers() throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<ManagerDataBean> managerList = null;
		
		String sql = "";
		
		try {
			conn = JDBCUtil.getConnection();
			sql = "select * from manager order by managerId desc";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				managerList = new ArrayList<ManagerDataBean>();
				do {
					ManagerDataBean manager = new ManagerDataBean();
					
					manager.setManagerId(rs.getString("managerId"));
					manager.setManagerPasswd(rs.getString("managerPasswd"));
					
					managerList.add(manager);
				} while(rs.next());
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs, pstmt, conn);	
		}
		
		return managerList;
	}
	
	
	public void insertManager(ManagerDataBean manager) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "";
		
		try {
			conn = JDBCUtil.getConnection();
			sql = "insert into manager values(?,?)";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, manager.getManagerId());
			pstmt.setString(2, manager.getManagerPasswd());
			
			pstmt.executeUpdate();
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(pstmt, conn);
		}
	}
	
	public int confirmManagerId(String managerId) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int x = -1;
		String sql = "";
		
		try {
			conn = JDBCUtil.getConnection();
			sql = "select managerId from manager where managerId=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, managerId);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				x = 1;
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
	
	public ManagerDataBean getManager(String managerId) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ManagerDataBean manager = null;
		String sql = "";
		
		try {
			conn = JDBCUtil.getConnection();
			sql = "select * from manager where managerId=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, managerId);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				manager = new ManagerDataBean();
				
				manager.setManagerId(rs.getString("managerId"));
				manager.setManagerPasswd(rs.getString("managerPasswd"));

			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs, pstmt, conn);
		}
		return manager;
	}
	
	public void updateManager(ManagerDataBean manager, String managerId) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		String sql = "";
		
		try {
			conn = JDBCUtil.getConnection();
			sql = "update manager set managerPasswd=?, managerId=? "
					+ "where managerId=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, manager.getManagerPasswd());
			pstmt.setString(2, manager.getManagerId());
			pstmt.setString(3, managerId);
			
			pstmt.executeUpdate();
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(pstmt, conn);
		}
	}
	
	public int deleteManager(String managerId, String managerPasswd) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String dbpasswd = "";
		int x = -1;
		String sql = "";
		
		try {
			conn = JDBCUtil.getConnection();
			sql = "select managerPasswd from manager where managerId=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, managerId);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dbpasswd = rs.getString("managerPasswd");
				if(dbpasswd.equals(managerPasswd)) {
					sql = "delete from manager where managerId=?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, managerId);
					pstmt.executeUpdate();
					x = 1;
				}
			} else {
				x = 0;
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs, pstmt, conn);
		}
		return x;
	}
	
}
