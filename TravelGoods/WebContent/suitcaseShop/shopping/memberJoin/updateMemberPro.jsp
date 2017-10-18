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
String managerId2 = request.getParameter("id2");
String managerPasswd = request.getParameter("passwd");

ManagerDBBean managerPro = ManagerDBBean.getInstance();
ManagerDataBean manager = new ManagerDataBean();
manager.setManagerId(managerId);
manager.setManagerPasswd(managerPasswd);

managerPro.updateManager(manager, managerId2);
%>
<script>
	alert("관리자 계정이 수정되었습니다.");
	location.href="managerIdList.jsp";
</script>
</body>
</html>