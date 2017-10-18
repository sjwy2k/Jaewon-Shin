<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="SuitcaseShop.cart.CartDBBean" %>
<%@ include file="../../etc/color.jspf" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>삭제 처리 페이지</title>
</head>
<body>
<%
String list = request.getParameter("list");
String buyer = (String)session.getAttribute("id");
String suitcase_kind = request.getParameter("suitcase_kind");

if(session.getAttribute("id")==null) {
	response.sendRedirect("shopMain.jsp");
} else {
	CartDBBean suitcasePro = CartDBBean.getInstance();
	
	if(list.equals("all")) {
		suitcasePro.deleteAll(buyer);
	} else {
		suitcasePro.deleteList(Integer.parseInt(list));
	}
	
	response.sendRedirect("cartList.jsp?suitcase_kind="+suitcase_kind);
}
%>
</body>
</html>