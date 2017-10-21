<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.Timestamp" %>
<%@ include file="../../etc/color.jspf" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품등록</title>
<link href="../../etc/style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="../../etc/script.js"></script>
</head>
<body bgcolor="<%=bodyback_c %>">
<%
String managerId = ""; //세션 저장
try {
	managerId = (String)session.getAttribute("managerId");
	if(managerId==null || managerId.equals("")) {
		response.sendRedirect("../logon/managerLoginForm.jsp");		
	} else {
%>

<p>캐리어 상품 등록</p>
<br>
<div class="container">
<form method="post" name="writeform" 
action="suitcaseRegisterPro.jsp" enctype="multipart/form-data"> 
<table style="align:center">		<!-- 이미지 파일 등록 -->
	<tr>
		<td align="right" colspan="2" bgcolor="<%=value_c %>">
			<a href="../managerMain.jsp">관리자 메인으로</a>
		</td>
	</tr>
	<tr>
		<td width="100" bgcolor="<%=value_c %>">분류 선택</td>
		<td width="400" align="left">
			<select name="suitcase_kind"> 
				<option value="100">20인치</option>
				<option value="200">24인치</option>
				<option value="300">28인치</option>
				<option value="400">유/아동용</option>
				<option value="500">여행가방 악세서리</option>
			</select>
		</td>
	</tr>
	<tr>
		<td width="100" bgcolor="<%=value_c %>">상품명</td>
		<td width="400" align="left">
			<input type="text" size="50" maxlength="50" name="suitcase_title">
		</td>
	</tr>
	<tr>
		<td width="100" bgcolor="<%=value_c %>">가격</td>
		<td width="400" align="left">
			<input type="text" size="10" maxlength="9" name="suitcase_price">원
		</td>
	</tr>
	<tr>
		<td width="100" bgcolor="<%=value_c %>">수량</td>
		<td width="400" align="left">
			<input type="text" size="10" maxlength="5" name="suitcase_count">개
		</td>
	</tr>
	<tr>
		<td width="100" bgcolor="<%=value_c %>">제조사</td>
		<td width="400" align="left">
			<input type="text" size="20" maxlength="30" name="manufacturer">
		</td>
	</tr>
	<tr>
		<td width="100" bgcolor="<%=value_c %>">제조국가</td>
		<td width="400" align="left">
			<input type="text" size="20" maxlength="30" name="product_con">
		</td>
	</tr>
	<tr>
		<td width="100" bgcolor="<%=value_c %>">제조일</td>
		<td width="400" align="left">
			<select name="product_year">
				<%
				Timestamp nowTime = new Timestamp(System.currentTimeMillis());
				int lastYear = Integer.parseInt(nowTime.toString().substring(0, 4));
				for(int i = lastYear; i >= 2000; i--) {
				%>
					<option value="<%=i %>"><%=i %></option>
				<%} %>
			</select>년
			<select name="product_month">
				<%
				for(int i = 1; i <= 12; i++) {
				%>
					<option value="<%=i %>"><%=i %></option>
				<%} %>
			</select>월
		</td>
	</tr>
	<tr>
		<td width="100" bgcolor="<%=value_c %>">이미지</td>
		<td width="400" align="left">
			<input type="file" name="suitcase_image">
		</td>
	</tr>
	<tr>
		<td width="100" bgcolor="<%=value_c %>">상품 소개</td>
		<td width="400" align="left">
			<textarea name="suitcase_content" rows="14" cols="40"></textarea>
		</td>
	</tr>
	<tr>
		<td width="100" bgcolor="<%=value_c %>">할인율</td>
		<td width="400" align="left"> <!-- maxlength는 2자리로, 할인율 과도입력방지-->
			<input type="text" size="5" maxlength="2" name="discount_rate">
		</td>
	</tr>
	<tr>
		<td colspan=2 bgcolor="<%=value_c %>" align="center">
			<input type="button" value="상품 등록" onclick="checkForm(this.form)">
			<input type="reset" value="다시 작성"> 
		</td>
	</tr>
</table>
</form>
</div>
<%
	}
}catch(Exception e) {
	e.printStackTrace();
}
%>
</body>
</html>
