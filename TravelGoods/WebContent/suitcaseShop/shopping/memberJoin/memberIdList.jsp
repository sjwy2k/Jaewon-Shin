<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="SuitcaseShop.manager.ManagerDBBean" %>
<%@ page import="SuitcaseShop.manager.ManagerDataBean" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 계정 목록</title>
<link href="../../etc/style.css" rel="stylesheet" type="text/css">
</head>
<body>
<%
ManagerDataBean managerList = null;
ManagerDBBean managerPro = ManagerDBBean.getInstance();

List<ManagerDataBean> managerLists = null;
managerLists = managerPro.getManagers();
%>
<div class="container">
	<table>		
		<tr>
			<td>아이디</td>
			<td>비밀번호</td>
			<td>수정/삭제</td>
		</tr>
<%
	for(int i = 0; i < managerLists.size(); i++) {
		managerList = (ManagerDataBean)managerLists.get(i);
%>
		<tr height="30">
			<td width="400"><%=managerList.getManagerId() %></td>
			<td width="100"><%=managerList.getManagerPasswd() %></td>
			<td width="200">
				<a href=
"updateManagerForm.jsp?id=<%=managerList.getManagerId()%>&passwd=<%=managerList.getManagerPasswd()%>">수정</a>&nbsp;&nbsp;/
				<a href=
"deleteManagerPro.jsp?id=<%=managerList.getManagerId()%>&passwd=<%=managerList.getManagerPasswd()%>">삭제</a>
			</td>
		</tr>
<%	} %>
		<tr>
			<td colspan="3">
				<input type="button" value="돌아가기" onclick="javascript:window.location='../managerMain.jsp'">
			</td>
		</tr>
	</table>
</div>
</body>
</html>