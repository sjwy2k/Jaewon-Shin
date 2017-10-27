<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JavaBean Test</title>
</head>
<body>
<%request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="beantest" class="test.BeanTest2" scope="page" />
<jsp:setProperty name="beantest" property="*" />
<h1>자바빈 속성 값 출력</h1>

<%-- <b>이름 : </b><%=beantest.getName() %><br>
<b>주소 : </b><%=beantest.getAddr() %><br>
<b>이메일 주소 : </b><%=beantest.getEmail() %><br>
<b>생년월일 : </b><%=beantest.getBirthday() %><br> --%>

<b>이름 : </b><jsp:getProperty name="beantest" property="name" /><br>
<b>주소 : </b><jsp:getProperty name="beantest" property="addr" /><br>
<b>이메일 주소 : </b><jsp:getProperty name="beantest" property="email" /><br>
<b>생년월일 : </b><jsp:getProperty name="beantest" property="birthday" /><br>

</body>
</html>