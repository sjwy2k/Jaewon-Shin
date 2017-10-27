<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 관리 시스템 메인 페이지</title>
</head>
<body>
<%
	String id = (String)session.getAttribute("id");

	if(id == null) {
		out.println("<script>");
		out.println("location.href='loginForm.jsp'");
		out.println("</script>");
	} else {		
%>

<h3><%=id %>로 로그인하셨습니다.</h3>
<%
	 if(id.equals("admin")) {
%>
		<a href="member_list.jsp">관리자모드 접속(회원 목록 보기)</a>
<%}

}
%>



</body>
</html>