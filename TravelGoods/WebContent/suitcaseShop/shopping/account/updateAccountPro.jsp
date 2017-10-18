<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="SuitcaseShop.account.BankDataBean" %>
<%@ page import="SuitcaseShop.account.BankDBBean" %>
<%@ page import="java.sql.Timestamp" %>
<% request.setCharacterEncoding("utf-8");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Suitcase Shopping Mall</title>
</head>
<body>

<%
String buyer = (String)session.getAttribute("id");
String accountList = request.getParameter("accountList");
int index = (int)accountList.indexOf(" ");
String account = accountList.substring(0, index);

String update_account = request.getParameter("update_account");
String update_bank = request.getParameter("update_bank");

BankDBBean bankProcess = BankDBBean.getInstance();
BankDataBean member = new BankDataBean();
member.setId(buyer);
member.setAccount(update_account);
member.setBank(update_bank);
member.setReg_date(new Timestamp(System.currentTimeMillis()));

bankProcess.updateAccount(member, account);

response.sendRedirect("../buy/buyForm.jsp");
%>

</body>
</html>