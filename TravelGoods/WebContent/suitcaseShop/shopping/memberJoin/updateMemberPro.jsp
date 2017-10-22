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

String passwd = request.getParameter("passwd");
String name = request.getParameter("name");
String address = request.getParameter("address");
String tel = request.getParameter("tel");
String id = request.getParameter("id");


CustomerDBBean memberPro = CustomerDBBean.getInstance();
CustomerDataBean member = new CustomerDataBean();

member.setPasswd(passwd);
member.setName(name);
member.setAddress(address);
member.setTel(tel);
member.setId(id);

memberPro.updateMember(member);
%>
<script>
	alert("회원 정보가 수정되었습니다.");
	location.href="../shopMain.jsp";
</script>
</body>
</html>