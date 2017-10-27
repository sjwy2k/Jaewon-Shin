<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Enumeration" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Request 예제2</title>
<style type="text/css">
	h1 {
		text-align : center;
	}
	
	table {
		margin : auto;
		width : 1000px;
		border : 1px solid red;
	}
</style>
</head>
<body>
	<h1>헤더정보 예제</h1>
	<table>
		<tr>
			<td width="200">헤더정보</td>
			<td>헤더값</td>
		</tr>
		<%
		Enumeration e = request.getHeaderNames();
		while(e.hasMoreElements()) {
			String headerName = (String)e.nextElement();
		%>
		<tr>
			<td><%=headerName %>
			<td><%=request.getHeader(headerName) %>
		</tr>
		<%} %>
	</table>
</body>
</html>