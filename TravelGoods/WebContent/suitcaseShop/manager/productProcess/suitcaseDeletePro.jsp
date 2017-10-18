<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="SuitcaseShop.manager.ShopSuitcaseDBBean" %>
<%request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>삭제처리</title>
</head>
<body>
<%
int suitcase_id = Integer.parseInt(request.getParameter("suitcase_id"));
String suitcase_kind = request.getParameter("suitcase_kind");

ShopSuitcaseDBBean suitcaseProcess = ShopSuitcaseDBBean.getInstance();
suitcaseProcess.deleteSuitcase(suitcase_id);

response.sendRedirect("suitcaseList.jsp?suitcase_kind="+suitcase_kind);
%>
</body>
</html>