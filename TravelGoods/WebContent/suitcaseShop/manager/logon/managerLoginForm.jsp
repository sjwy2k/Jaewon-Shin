<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품관리 페이지</title>
<link href="../../etc/style.css" rel="stylesheet" type="text/css">
</head>
<body>
<div class="container">
<h2>상품관리 페이지</h2>
<form method="post" action="managerLoginPro.jsp">
	<label>아이디 : </label><input type="text" name="id" maxlength="50"
				style="ime-mode:inactive;" autocomplete="false"><br>
	<label>비밀번호 : </label><input type="password" name="passwd" maxlength="16"
				style="ime-mode:inactive;" autocomplete="false"><br>
	<input type="submit" value="로그인">
	<input type="button" value="계정 생성" onclick="javascript:window.location='../managerJoin/joinManagerForm.jsp'">
	<input type="button" value="계정 조회" onclick="javascript:window.location='../managerJoin/managerIdList.jsp'">
</form>
</div>
</body>
</html>