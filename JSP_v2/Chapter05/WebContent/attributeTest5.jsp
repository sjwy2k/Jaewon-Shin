<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>page영역 request영역</title>
</head>
<body>
<%
pageContext.setAttribute("pageScope", "pageValue");
request.setAttribute("requestScope", "requestValue");
%>
<jsp:forward page="attributeTest5Result.jsp"></jsp:forward>
</body>
</html>