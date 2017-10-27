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
	
	String info_id = request.getParameter("id");
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	try{
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
		
		conn = ds.getConnection();
		String sql = "SELECT * FROM member WHERE id=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, info_id);
		
		rs = pstmt.executeQuery();	
		rs.next();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원관리시스템 관리자모드(회원 정보 보기)</title>
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
		<td colspan="2" class="td_title">회원 가입 페이지</td>
	</tr>
	<tr>
		<td>아이디 : </td>
		<td><%=rs.getString("id") %></td>
	</tr>
	<tr>
		<td>비밀번호 : </td>
		<td><%=rs.getString("password") %></td>
	</tr>
	<tr>
		<td>이름 : </td>
		<td><%=rs.getString("name") %></td>
	</tr>
	<tr>
		<td>나이 : </td>
		<td><%=rs.getString("age") %></td>
	</tr>
	<tr>
		<td>성별 : </td>
		<td><%=rs.getString("gender") %></td>
	</tr>
	<tr>
		<td>이메일 주소 : </td>
		<td><%=rs.getString("email") %></td>
	</tr>
	<tr>
		<td colspan="2"><a href="member_list.jsp">리스트로 돌아가기</a></td>
	</tr>
</table>
<%} catch(Exception e) {
	e.printStackTrace();
} finally {
	try { rs.close(); pstmt.close(); conn.close(); } catch(Exception e) { e.printStackTrace(); }
}
%>
</body>
</html>