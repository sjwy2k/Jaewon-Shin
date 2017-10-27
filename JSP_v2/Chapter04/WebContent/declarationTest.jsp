<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>선언문 테스트</title>
</head>
<body>
<h1><%=getStr() %></h1>
<%!
private String getStr() {
	str+="테스트입니다.";
	return str;
}
private String str = "선언문 ";
%>

<%-- <%
private String str = "선언문 ";
private String getStr() {
	str+="테스트입니다.";
	return str;
}
%>
<h1><%=getStr() %></h1> --%>
</body>
</html>