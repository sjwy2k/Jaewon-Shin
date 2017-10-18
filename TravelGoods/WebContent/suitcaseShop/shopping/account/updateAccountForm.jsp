<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../etc/color.jspf" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제 계좌 수정 폼</title>
<link href="../etc/style.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="<%=bodyback_c %>">
<%
String buyer = (String)session.getAttribute("id");
String accountList = request.getParameter("accountList");

if(buyer == null) {
	response.sendRedirect("shopMain.jsp");
} else {
%>
<h3><%=buyer %>님의 계좌 수정</h3>
<form method="post" action="updateAccountPro.jsp">
<table align="center">
	<tr>
		<td width="200" align="center">결제 계좌</td>
		<td width="300" align="center" name="accountList"><%=accountList %></td>
		<input type="hidden" name="accountList" value="<%=accountList%>">
	</tr>
	<tr>
		<td width="200" align="center">수정할 계좌번호</td>
		<td width="300">
			<input type="text" name="update_account">
		</td>
	</tr>
	<tr>
		<td width="200" align="center">수정할 은행명</td>
		<td width="300">
			<input type="text" name="update_bank">
		</td>
	</tr>	
	<tr>
		<td colspan="2" align="center">
			<input type="submit" value="확인">&nbsp;
			<input type="button" value="취소"
			onclick="javascript:window.location='../buy/buyForm.jsp'">
		</td>		
	</tr>
</table>
</form>
<%} %>
</body>
</html>