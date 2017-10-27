<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;	
	String sql1 = "INSERT INTO student (num, name) VALUES (13, '홍길동')";
	String sql2 = "SELECT * FROM STUDENT WHERE num=12";		
	try {
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
		conn = ds.getConnection();
		
		conn.setAutoCommit(false);
		
		pstmt = conn.prepareStatement(sql1);
		pstmt.executeUpdate();
		
		pstmt = conn.prepareStatement(sql2);
		rs = pstmt.executeQuery();
		if(!rs.next()) {
			conn.rollback();
			out.println("<h3>데이터 삽입에 문제가 발생하여 롤백하였습니다.</h3>");
		} else {
			conn.commit();
			out.println("<h3>데이터 삽입의 모두 완료되었습니다.</h3>");
		}
		conn.setAutoCommit(true);
	} catch(Exception e) {
		out.println("<h3>데이터 삽입에 실패하였습니다.</h3>");
		e.printStackTrace();
	} finally {
		try { rs.close(); pstmt.close(); conn.close(); } catch(Exception e) { e.printStackTrace(); }
	}
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>

</body>
</html>