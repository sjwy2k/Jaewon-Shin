<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="SuitcaseShop.cart.CartDBBean" %>

<%@ include file="../../etc/color.jspf" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수정 처리 페이지</title>
</head>
<body>
<%
String cart_id = request.getParameter("cart_id");
String buy_count = request.getParameter("buy_count");
String suitcase_kind = request.getParameter("suitcase_kind");

if(session.getAttribute("id")==null) {
	response.sendRedirect("shopMain.jsp");
} else {
	CartDBBean suitcasePro = CartDBBean.getInstance();
	suitcasePro.updateCount(Integer.parseInt(cart_id), Byte.parseByte(buy_count));
	response.sendRedirect("cartList.jsp?suitcase_kind="+suitcase_kind);
}
%>
</body>
</html>