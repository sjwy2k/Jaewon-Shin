<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="SuitcaseShop.manager.ManagerDBBean" %>
<%@ page import="SuitcaseShop.manager.ManagerDataBean" %>

<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>

<%
String managerId = request.getParameter("id");
String managerPasswd = request.getParameter("passwd");

ManagerDBBean managerPro = ManagerDBBean.getInstance();
ManagerDataBean manager = new ManagerDataBean();
manager.setManagerId(managerId);

managerPro.deleteManager(managerId, managerPasswd);
%>
<script>
	alert("관리자 계정이 삭제되었습니다.");
	location.href="managerIdList.jsp";
</script>
</body>
</html>