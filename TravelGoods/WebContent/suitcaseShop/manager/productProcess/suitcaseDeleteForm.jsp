<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../etc/color.jspf" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 삭제</title>
<link href="../../etc/style.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="<%=bodyback_c %>">
<%
String managerId = "";
try {
	managerId = (String)session.getAttribute("managerId");
	if(managerId==null || managerId.equals("")) {
		response.sendRedirect("../logon/managerLoginForm.jsp");
	} else {
		int suitcase_id = Integer.parseInt(request.getParameter("suitcase_id"));
		String suitcase_kind = request.getParameter("suitcase_kind");
%>
<p>상품 삭제</p>
<br>
<form method="post" name="delForm" 
		action="suitcaseDeletePro.jsp?suitcase_id=<%=suitcase_id %>&suitcase_kind=<%=suitcase_kind %>">
	<table>
		<tr>
			<td align="right" bgcolor="<%=bodyback_c%>">
				<a href="../managerMain.jsp">관리자 메인으로</a>
				<a href="suitcaseList.jsp?suitcase_kind=<%=suitcase_kind %>">목록으로</a>
			</td>
		</tr>
		
		<tr height="30">
			<td align="center" bgcolor="<%=value_c%>">
				<input type="submit" value="삭제">
			</td>
		</tr>
	</table>
</form>
</body>
</html>
<%
	}
}catch(Exception e) {
	e.printStackTrace();
}
%>