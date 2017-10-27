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
	
	String id2 = request.getParameter("id");
	String pass = request.getParameter("pass");
	String name = request.getParameter("name");
	int age = Integer.parseInt(request.getParameter("age"));
	String gender = request.getParameter("gender");
	String email = request.getParameter("email");
	
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	try{
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
		
		conn = ds.getConnection();		
		String sql = 
"UPDATE member SET password=?, name=?, age=?, gender=?, email=? WHERE id=?";
		
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, pass);
		pstmt.setString(2, name);
		pstmt.setInt(3, age);
		pstmt.setString(4, gender);
		pstmt.setString(5, email);
		pstmt.setString(6, id2);
		
		int result = pstmt.executeUpdate();
		
		pstmt.executeUpdate();
		
		out.println("<script>");
		out.println("location.href='member_list.jsp'");
		out.println("alert('회원 "+ id2 + "의 정보를 수정하셨습니다.')");
		out.println("</script>");
		
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 삭제 처리</title>
</head>
<body>

<%} catch(Exception e) {
	e.printStackTrace();
} finally {
	try { pstmt.close(); conn.close(); } catch(Exception e) { e.printStackTrace(); }
}
%>
</body>
</html>