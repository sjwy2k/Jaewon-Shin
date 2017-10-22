<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../etc/color.jspf" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 삭제</title>
<link href="../etc/deleteForm.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="../etc/script.js" >
</script>
</head>
<body bgcolor="<%=bodyback_c %>">
<div class="container">
<%
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
%>
<header>
<h1>글삭제</h1>
</header>
<section>
<form method="post" name="deleteform" action="deletePro.jsp?pageNum=<%=pageNum%>"
		onsubmit="return deleteSave()">
	<table>
		<tr height="30">
			<td align="center" bgcolor="<%=value_c %>" class="menu">
				<b>비밀번호를 입력해 주세요.</b>
			</td>
		</tr>
		<tr height="30">
			<td align="center"> 비밀번호 : 
				<input type="password" name="passwd" size="8" maxlength="12">
				<input type="hidden" name="num" value="<%=num %>">
			</td>
		</tr>
		<tr height="30">
			<td align=center bgcolor="<%=value_c %>" class="menu">
				<input type="submit" value="글삭제">
				<input type="button" value="글목록"
				onclick="document.location.href='list.jsp?pageNum=<%=pageNum %>'">
			</td>
		</tr>
	</table>
</form>
</section>
<footer></footer>
</div>
</body>
</html>

