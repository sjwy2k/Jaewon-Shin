<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 계정 수정 페이지</title>
<link href="../../etc/style.css" rel="stylesheet" type="text/css">
</head>
<body>
<%
String id = request.getParameter("id");
String passwd = request.getParameter("passwd");
%>
<div class="container">
<form method="post" action="updateManagerPro.jsp">
<h3>관리자 계정 수정</h3>
<label>아이디 : </label><input type="text" name="id" value="<%=id %>"><br>
<input type="hidden" name="id2" value="<%=id %>">
<label>비밀번호 : </label><input type="password" name="passwd" value="<%=passwd %>"><br>
<input type="submit" value="확인">&nbsp;
			<input type="button" value="취소"
			onclick="javascript:window.location='../managerMain.jsp'">
</form>
</div>
</html>