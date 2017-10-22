<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="SuitcaseShop.customer.CustomerDBBean" %>
<%@ page import="SuitcaseShop.customer.CustomerDataBean" %>
<%@ page import="java.sql.Timestamp" %>

<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>

<%
String id = request.getParameter("id");
String passwd = request.getParameter("passwd");
String name = request.getParameter("name");
String address= request.getParameter("address");
String tel = request.getParameter("tel");

CustomerDBBean memberPro = CustomerDBBean.getInstance();
CustomerDataBean member = new CustomerDataBean();
member.setId(id);
member.setPasswd(passwd);
member.setName(name);
member.setReg_date(new Timestamp(System.currentTimeMillis()));
member.setAddress(address);
member.setTel(tel);

int check = memberPro.userCheck(id, passwd);

if(check == -1) {	
	memberPro.insertMember(member);
%>
<script>
	alert("회원 가입이 완료 되었습니다.");
	location.href="../shopMain.jsp";
</script>
<%	
} else { %>
<script>
	alert("아이디가 이미 존재합니다.");
	history.go(-1);
</script>
<%} %>
</body>
</html>