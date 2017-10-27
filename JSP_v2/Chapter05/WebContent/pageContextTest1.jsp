<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>pageContext 테스트</title>
</head>
<body>
<%
pageContext.forward("pageContextTest2.jsp");
%>
</body>
</html>