<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../etc/color.jspf" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style type="text/css"> 
	 .gap {
	 	margin-top : 20px;
	 	padding : 10px;
	 }
</style>
</head>
<body bgcolor="<%=bodyback_c%>">
<%
String id = (String)session.getAttribute("id");
try{
	if(session.getAttribute("id") == null) { %>
		
		<br>
		<a href="../shopping/list.jsp?suitcase_kind=all">전체목록보기</a>&nbsp;
		<br>
		<div class="gap">
		<input type="button" value="로그인" 
			onclick="javascript:window.location='../shopping/memberJoin/index.html'">		
		<input type="button" value="회원가입" 
			onclick="javascript:window.location='../shopping/memberJoin/joinMemberForm.jsp'">
		</div>
		<br>	
		<font color="red">* 반드시 로그인을 하셔야 쇼핑몰을 이용하실 수 있습니다.*</font>
	<%} else {%>
	<a href="../shopping/list.jsp?suitcase_kind=all">전체목록보기</a>&nbsp;
	<a href="../shopping/cart/cartList.jsp?suitcase_kind=all">장바구니보기</a>&nbsp;
	<a href="../shopping/buy/buyList.jsp">구매목록보기</a>&nbsp;
	
	<br><br>
	<b><%=session.getAttribute("id") %></b> 님, 즐거운 쇼핑시간이 되세요.
	
	<input type="button" value="로그아웃"
		onclick="javascript:window.location='../shopping/logout.jsp'">
	<input type="button" value="마이페이지"
		onclick="javascript:window.location='../shopping/memberJoin/updateMemberForm.jsp?id=<%=id %>'">
	<%}	
} catch(Exception e) {
	e.printStackTrace();
}
%>
</body>
</html>