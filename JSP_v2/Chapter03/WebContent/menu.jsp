<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 페이지</title>
</head>
<body>
<%
String id = (String)session.getAttribute("id");
if(id==null) {
%>
<a href="login.jsp">로그인</a>
<%
} else {
%>
<h1><%=id %>님 환영합니다.</h1>
<%	
}
%>
</body>
</html>