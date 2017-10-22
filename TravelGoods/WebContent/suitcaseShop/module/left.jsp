<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여행가방 분류 메뉴</title>
<link href="../etc/style.css" rel="stylesheet" type="text/css">
</head>
<body>
<p>여행가방  분류</p>
<br>
<a href="../shopping/list.jsp?suitcase_kind=all">전체목록보기</a><br>
<a href="../shopping/list.jsp?suitcase_kind=100">20인치 캐리어</a><br>
<a href="../shopping/list.jsp?suitcase_kind=200">24인치 캐리어</a><br>
<a href="../shopping/list.jsp?suitcase_kind=300">28인치 캐리어</a><br>
<a href="../shopping/list.jsp?suitcase_kind=400">하드케이스</a><br>
<a href="../shopping/list.jsp?suitcase_kind=500">소프트케이스</a><br>
<a href="../suitcaseBoard/board/list.jsp">게시판 보기</a>
<%
String id = (String) session.getAttribute("id");

if(id == null) {
%>	
<%} else {%>
	<a href="../shopping/list.jsp?suitcase_kind=all">전체목록보기</a><br>
<%}%>
</body>
</html>