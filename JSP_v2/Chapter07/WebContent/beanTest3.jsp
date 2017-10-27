<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JavaBean Test</title>
</head>
<body>
<jsp:useBean id="beantest" class="test.BeanTest" scope="page" />
<jsp:setProperty name="beantest" property="name" param="name" />

<b>자바빈 사용 예제</b>
<h3><%=beantest.getName() %></h3>
</body>
</html>