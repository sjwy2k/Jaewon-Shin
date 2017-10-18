<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 계정 생성 페이지</title>
<link href="../../etc/style.css" rel="stylesheet" type="text/css">
</head>
<body>
<div class="container">
<form method="post" action="joinManagerPro.jsp">
<h3>관리자 계정 생성</h3>
<label>아이디 : </label><input type="text" name="id"><br>
<label>비밀번호 : </label><input type="password" name="passwd"><br>
<input type="submit" value="확인">&nbsp;
			<input type="button" value="취소"
			onclick="javascript:window.location='../managerMain.jsp'">
</form>
</div>
</body>
</html>