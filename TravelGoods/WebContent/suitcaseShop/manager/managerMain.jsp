<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../etc/color.jspf" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여행용품 관리 페이지</title>
<link href="../etc/style.css" rel="stylesheet" type="text/css">
</head>
<body>
<div class="container">
<%
String managerId="";

try {
	managerId = (String)session.getAttribute("managerId");
	
	if(managerId == null || managerId.equals("")) {
		response.sendRedirect("logon/managerLoginForm.jsp");
	} else { 
%>
<form method="post" action="logon/managerLogout.jsp">
	<p><%=managerId %> 로그인</p>
	<b>관리작업중..</b><br><input type="submit" value="로그아웃">
	
	<input type="button" value="계정 추가 생성" onclick="javascript:window.location='managerJoin/joinManagerForm.jsp'">
	<input type="button" value="생성된 관리자계정 조회" onclick="javascript:window.location='managerJoin/managerIdList.jsp'">
</form>
<table>
	<tr><td align="center" bgcolor="<%=value_c %>">상품관련 작업</td></tr>
	<tr><td align="center" bgcolor="<%=bar %>">
		<a href='productProcess/suitcaseRegisterForm.jsp'>상품등록</a>
	</td></tr>
	<tr><td align="center" bgcolor="<%=bar %>">
		<a href='productProcess/suitcaseList.jsp?suitcase_kind=all'>상품수정/삭제</a>
	</td></tr>
</table><br><br>
<table>
	<tr><td align="center" bgcolor="<%=value_c %>">구매된 상품관련 작업</td></tr>
	<tr><td align="center" bgcolor="<%=bar %>">
		<a href='orderedProduct/orderedList.jsp'>전체구매목록 확인</a>
	</td></tr>
</table>
</div>
</body>
</html>
<%
	}
} catch(Exception e) {
	e.printStackTrace();
}
%>