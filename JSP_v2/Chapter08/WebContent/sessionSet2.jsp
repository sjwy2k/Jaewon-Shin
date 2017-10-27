<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
<%session.setAttribute("name2", "Session Test 2!"); %>
<script>
	location.href="sessionTest.jsp";
</script>
</body>
</html>