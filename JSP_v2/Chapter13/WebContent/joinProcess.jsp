<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>

<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	String name = request.getParameter("name");
	int age = Integer.parseInt(request.getParameter("age"));
	String gender = request.getParameter("gender");
	String email = request.getParameter("email");
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	try {
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
		conn = ds.getConnection();
		String sql = "INSERT INTO member VALUES(?,?,?,?,?,?)";
		
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, pass);
		pstmt.setString(3, name);
		pstmt.setInt(4, age);
		pstmt.setString(5, gender);
		pstmt.setString(6, email);
		
		int result = pstmt.executeUpdate();
		
		if(result != 0) {
			out.println("<script>");			
			out.println("location.href='loginForm.jsp'");
			out.println("alert('회원가입에 성공하셨습니다.')");
			out.println("</script>");
		}
		
		out.println("<script>");
		out.println("location.href='joinForm.jsp'");
		out.println("alert('회원가입에 실패하셨습니다. 다시 작성해 주세요.')");
		out.println("</script>");
		
	} catch(Exception e) {
		e.printStackTrace();
	} finally {
		try { pstmt.close(); conn.close(); } catch(Exception e) { e.printStackTrace(); }
	}
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 관리 시스템 회원 가입 처리</title>
</head>
<body>

</body>
</html>