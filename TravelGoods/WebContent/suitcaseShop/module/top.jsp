<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../etc/color.jspf" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body bgcolor="<%=bodyback_c%>">
<%
try{
	if(session.getAttribute("id") == null) { %>
		<a href="../shopping/list.jsp?suitcase_kind=all">전체목록보기</a>&nbsp;
		<br>

		<form method="post" action="../shopping/loginPro.jsp">
			아이디 : <input type="text" name="id" size="15" maxlength="50">
			비밀번호 : <input type="password" name="passwd" size="15" maxlength="16">
			<input type="submit" value="로그인">
		</form>
		
		<font color="red">* 반드시 로그인을 하셔야 쇼핑몰을 이용하실 수 있습니다.*</font>
	<%} else {%>
	<a href="../shopping/list.jsp?suitcase_kind=all">전체목록보기</a>&nbsp;
	<a href="../shopping/cart/cartList.jsp?suitcase_kind=all">장바구니보기</a>&nbsp;
	<a href="../shopping/buy/buyList.jsp">구매목록보기</a>&nbsp;
	
	<br><br>
	<b><%=session.getAttribute("id") %></b> 님, 즐거운 쇼핑시간이 되세요.
	
	<input type="button" value="로그아웃"
		onclick="javascript:window.location='../shopping/logout.jsp'">
	<%}	
} catch(Exception e) {
	e.printStackTrace();
}
%>
</body>
</html>