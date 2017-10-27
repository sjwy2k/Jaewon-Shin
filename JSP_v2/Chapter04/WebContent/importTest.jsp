<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>import 속성 테스트</title>
</head>
<body>
<%
SimpleDateFormat date = new SimpleDateFormat();

%>

<h1>현재 시간은 <%=new SimpleDateFormat().format(new Date()) %> 입니다</h1>
<%-- <h1>현재 시간은 <%=new SimpleDateFormat().format(System.currentTimeMillis()) %> 입니다</h1> --%>
<h1>현재 시간은 <%=date.format(System.currentTimeMillis()) %></h1>
</body>
</html>
