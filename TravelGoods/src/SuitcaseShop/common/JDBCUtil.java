package SuitcaseShop.common;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class JDBCUtil {
	
	// 1. 자카르타 JDBC 연결
	public static Connection getConnection() throws Exception {		
		Context initCtx = new InitialContext();
		Context envCtx = (Context)initCtx.lookup("java:comp/env");
		DataSource ds = (DataSource)envCtx.lookup("jdbc/basicjsp");
		return ds.getConnection();	
	}
		
	// 2. executeUpdate() Close
	public static void close(PreparedStatement pstmt, Connection conn) {
		
		if(pstmt != null) {
			try {
				if(!pstmt.isClosed()) {
					pstmt.close();
				}
			} catch(Exception e) {
				e.printStackTrace();
			} finally {
				pstmt = null;
			}
		}
		
		if(conn != null) {
			try {
				if(!conn.isClosed()) {
					conn.close();
				}
			} catch(Exception e) {
				e.printStackTrace();
			} finally {
				conn = null;
			}
		}
	}
	
	// 2. executeQuery() Close
	public static void close(ResultSet rs, PreparedStatement pstmt, Connection conn) {
		
		if(rs != null) {
			try {
				if(!rs.isClosed()) {
					pstmt.close();
				}
			} catch(Exception e) {
				e.printStackTrace();
			} finally {
				rs = null;
			}
		}
		
		if(pstmt != null) {
			try {
				if(!pstmt.isClosed()) {
					pstmt.close();
				}
			} catch(Exception e) {
				e.printStackTrace();
			} finally {
				pstmt = null;
			}
		}
		
		if(conn != null) {
			try {
				if(!conn.isClosed()) {
					conn.close();
				}
			} catch(Exception e) {
				e.printStackTrace();
			} finally {
				conn = null;
			}
		}
	}
}
