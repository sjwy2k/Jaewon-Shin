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
<title>회원 관리 시스템 수정 페이지</title>
<style type="text/css">
	table {
		margin : auto;
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
<form name="updateform" action="member_updatePro.jsp" method="post">
<table border="1">
	<tr>
		<td colspan="2" class="td_title">회원 수정 페이지</td>
	</tr>
	<tr>
		<td><label for="id">아이디 : </label></td>
		<td><input type="text" name="id" id="id" 
		value="<%=rs.getString("id") %>" style="background:grey;" readonly></td>
	</tr>
	<tr>
		<td><label for="pass">비밀번호 : </label></td>
		<td><input type="password" name="pass" id="pass" 
		value="<%=rs.getString("password") %>"></td>
	</tr>
	<tr>
		<td><label for="name">이름 : </label></td>
		<td><input type="text" name="name" id="name"
		value="<%=rs.getString("name") %>"></td>
	</tr>
	<tr>
		<td><label for="age">나이 : </label></td>
		<td><input type="text" name="age" id="age"
		value="<%=rs.getString("age") %>"></td>
	</tr>
	<tr>
		<td><label for="gender1">성별 : </label></td>
		<td>
			<input type="radio" name="gender" value="남" checked id="gender1">남자
			<input type="radio" name="gender" value="여" id="gender2">남자
		</td>
	</tr>
	<tr>
		<td><label for="email">이메일 주소 : </label></td>
		<td><input type="text" name="email" id="email"
		value="<%=rs.getString("email") %>"></td>
	</tr>
	<tr>
		<td colspan="2">
			<a href="javascript:updateform.submit()">회원 수정</a>
			<a href="javascript:updateform.reset()">다시 작성</a>
		</td>		
	</tr>
</table>
</form>

<%} catch(Exception e) {
	e.printStackTrace();
} finally {
	try { rs.close(); pstmt.close(); conn.close(); } catch(Exception e) { e.printStackTrace(); }
}
%>
</body>
</html>