<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<% 
	Connection conn = null;
	String sql="INSERT INTO student(num, name) VALUES(?, '홍길동')";
	PreparedStatement pstmt = null;
	try {
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
		conn = ds.getConnection();
		pstmt = conn.prepareStatement(sql);
		
		for(int i = 8; i <= 11; i++) {
			pstmt.setInt(1, i);
			if(pstmt.executeUpdate() != 0) {
				out.println("<h3>"+i+"번 레코드가 성공적으로 등록되었습니다.</h3>");
			}
		}
	} catch(Exception e) {
		out.println("<h3>레코드 등록에 실패하였습니다.</h3>");
		e.printStackTrace();
	} finally {
		try{ pstmt.close(); conn.close(); } catch(Exception e) { e.printStackTrace(); }
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