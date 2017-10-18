<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="SuitcaseShop.account.BankDataBean" %>
<%@ page import="SuitcaseShop.account.BankDBBean" %>
<%@ page import="SuitcaseShop.customer.CustomerDataBean" %>
<%@ page import="SuitcaseShop.customer.CustomerDBBean" %>
<% request.setCharacterEncoding("utf-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제 계좌 삭제 처리</title>
</head>
<body>

<%
String buyer = (String)session.getAttribute("id");
String accountList = request.getParameter("accountList");
String passwd = request.getParameter("passwd");

int index = accountList.indexOf(" ");
String account = accountList.substring(0, index);

CustomerDBBean memberProcess = CustomerDBBean.getInstance();
int checkNum = memberProcess.userCheck(buyer, passwd);

if(checkNum != 1) {
%>
<script type="text/javascript">
	alert("비밀번호를 잘못 입력 하셨습니다.");
	history.go(-1);
</script>
<%} else { 

BankDBBean bankProcess = BankDBBean.getInstance();
bankProcess.deleteAccount(buyer, account);
%>
<script type="text/javascript">
	alert("계좌를 삭제했습니다.");
</script>
<%
response.sendRedirect("../buy/buyForm.jsp");
}
%>
</body>
</html>