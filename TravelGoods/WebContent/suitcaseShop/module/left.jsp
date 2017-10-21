<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>책분류 메뉴</title>
<link href="../etc/style.css" rel="stylesheet" type="text/css">
</head>
<body>
<p>책분류</p>
<br>
<a href="../shopping/list.jsp?suitcase_kind=all">전체목록보기</a><br>
<a href="../shopping/list.jsp?suitcase_kind=100">20인치 캐리어</a><br>
<a href="../shopping/list.jsp?suitcase_kind=200">24인치 캐리어</a><br>
<a href="../shopping/list.jsp?suitcase_kind=300">28인치 캐리어</a><br>
<a href="../shopping/list.jsp?suitcase_kind=400">유/아동용 캐리어</a><br>
<a href="../shopping/list.jsp?suitcase_kind=500">여행가방 악세서리</a><br>

<%
String buyer = (String) session.getAttribute("id");

if(buyer == null) {
%>	
<%} else {%>
<a href="../../ch13/board/list.jsp">게시판 보기</a>
<%}%>
</body>
</html>