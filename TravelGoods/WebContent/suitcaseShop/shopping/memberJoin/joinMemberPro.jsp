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
manager.setManagerPasswd(managerPasswd);

int check = managerPro.confirmManagerId(managerId);

if(check == -1) {	
	managerPro.insertManager(manager);
%>
<script>
	alert("관리자 계정이 생성되었습니다.");
	location.href="../managerMain.jsp";
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