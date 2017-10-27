<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<%request.setCharacterEncoding("utf-8"); %>
<%
	String id = (String)session.getAttribute("id");
	if(id == null || (!id.equals("admin"))) {
		out.println("<script>");
		out.println("location.href='loginForm.jsp'");
		out.println("</script>");
	}
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	try{
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
		
		conn = ds.getConnection();
		
		String sql = "SELECT * FROM member";
		pstmt = conn.prepareStatement(sql);
		
		rs = pstmt.executeQuery();	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원관리시스템 관리자모드(회원 목록 보기)</title>
<style type="text/css">
	table {
		margin : 0 auto;
		width : 400px;
		border : 1px solid black;
		text-align : center;
	}
	
	.td_title {
		font-weight : bold;
		font-size : x-large;
	}
</style>
</head>
<body>
<table border="1">
	<tr>
		<td colspan="3" class="td_title">회원 목록</td>
	</tr>
	<%while(rs.next()) { %>
	<tr>
		<td>			
			<a href="member_info.jsp?id=<%=rs.getString("id")%>"><%=rs.getString("id")%></a>
		</td>
		<td>			
			<a href="member_updateForm.jsp?id=<%=rs.getString("id")%>">수정</a>
		</td>
		<td>			
			<a href="member_delete.jsp?id=<%=rs.getString("id")%>">삭제</a>
		</td>
	</tr>
	<%} %>	
</table>
<%} catch(Exception e) {
	e.printStackTrace();
} finally {
	try { rs.close(); pstmt.close(); conn.close(); } catch(Exception e) { e.printStackTrace(); }
}
%>
</body>
</html>