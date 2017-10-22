<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="SuitcaseShop.board.BoardDBBean" %>
<%@ page import="java.sql.Timestamp" %>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글작성 처리 페이지</title>
</head>
<body>
<jsp:useBean id="article" class="SuitcaseShop.board.BoardDataBean" scope="page">
	<jsp:setProperty name="article" property="*" />
</jsp:useBean>

<%
article.setReg_date(new Timestamp(System.currentTimeMillis()));
article.setIp(request.getRemoteAddr());

BoardDBBean dbPro = BoardDBBean.getInstance();
dbPro.insertArticle(article);

response.sendRedirect("list.jsp");
%>
</body>
</html>