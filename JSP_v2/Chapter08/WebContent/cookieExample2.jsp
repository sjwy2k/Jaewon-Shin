<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠키를 이용한 화면 설정 예제</title>
</head>
<body>
<%
Cookie cookie = new Cookie("language", request.getParameter("language"));
cookie.setMaxAge(60*60*24);
response.addCookie(cookie);
%>
<script>
	location.href="cookieExample1.jsp"
</script>
</body>
</html>