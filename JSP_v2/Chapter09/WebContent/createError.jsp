<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
<%
String name = request.getParameter("name");
if(name == null) {
	throw new NullPointerException();
}
%>
</body>
</html>