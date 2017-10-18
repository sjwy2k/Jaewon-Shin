<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="SuitcaseShop.cart.CartDataBean" %>
<%@ page import="SuitcaseShop.cart.CartDBBean" %>
<%@ page import="SuitcaseShop.buy.BuyDBBean" %>

<%@ page import="SuitcaseShop.manager.ShopSuitcaseDBBean" %>
<%@ page import="java.util.List" %>
<%@ page import="java.sql.Timestamp" %>

<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구매 처리</title>
</head>
<body>
<%
String account = request.getParameter("account");
String deliveryName = request.getParameter("deliveryName");
String deliveryTel = request.getParameter("deliveryTel");
String deliveryAddress = request.getParameter("deliveryAddress");
String buyer = (String)session.getAttribute("id");

CartDBBean cartProcess = CartDBBean.getInstance();
List<CartDataBean> cartLists = cartProcess.getCart(buyer);

BuyDBBean buyProcess = BuyDBBean.getInstance();
buyProcess.insertBuy(
	cartLists, buyer, account, 
	deliveryName, deliveryTel, deliveryAddress);

response.sendRedirect("../buy/buyList.jsp");
%>
</body>
</html>