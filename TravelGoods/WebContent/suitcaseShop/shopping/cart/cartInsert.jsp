<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="SuitcaseShop.cart.CartDBBean" %>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
<%
String suitcase_kind = request.getParameter("suitcase_kind");
String buy_count = request.getParameter("buy_count");
String suitcase_id = request.getParameter("suitcase_id");
String suitcase_title = request.getParameter("suitcase_title");
String suitcase_image = request.getParameter("suitcase_image");
String buy_price = request.getParameter("buy_price");
String buyer = (String)session.getAttribute("id");
%>

<jsp:useBean id="cart" 
class="SuitcaseShop.cart.CartDataBean" scope="page">
</jsp:useBean>

<%
cart.setSuitcase_id(Integer.parseInt(suitcase_id));
cart.setSuitcase_image(suitcase_image);
cart.setSuitcase_title(suitcase_title);
cart.setBuy_count(Byte.parseByte(buy_count));
cart.setBuy_price(Integer.parseInt(buy_price));
cart.setBuyer(buyer);

CartDBBean suitcasePro = CartDBBean.getInstance();
suitcasePro.insertCart(cart);
response.sendRedirect("cartList.jsp?suitcase_kind="+suitcase_kind);
%>
</body>
</html>