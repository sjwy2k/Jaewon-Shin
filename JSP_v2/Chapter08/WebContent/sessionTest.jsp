<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Session Test</title>
</head>
<body>
<%
	String name, name2;
	
	if(session.getAttribute("name")!=null) {
		name = (String) session.getAttribute("name");
	} else {
		name = "세션 1 값 없음";
	}
	
	if(session.getAttribute("name2")!=null) {
		name2 = (String) session.getAttribute("name2");
	} else {
		name2 = "세션 2 값 없음";
	}
%>
<h2>세션 테스트</h2>
<input type="button" onclick="location.href='sessionSet.jsp'" value="세션 값 1번 저장">
<input type="button" onclick="location.href='sessionSet2.jsp'" value="세션 값 2번 저장">
<input type="button" onclick="location.href='sessionDel.jsp'" value="세션 값 1번 삭제">
<input type="button" onclick="location.href='sessionDel2.jsp'" value="세션 값 2번 삭제">
<input type="button" onclick="location.href='sessionInvalidate.jsp'" value="세션 초기화">
<h3><%=name %></h3>
<h3><%=name2 %></h3>
</body>
</html>