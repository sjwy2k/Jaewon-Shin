<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="SuitcaseShop.customer.CustomerDBBean" %>
<%@ page import="SuitcaseShop.customer.CustomerDataBean" %>

<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>

<%
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	
	CustomerDBBean memberPro = CustomerDBBean.getInstance();
	CustomerDataBean member = new CustomerDataBean();
	member.setId(id);
	member.setPasswd(passwd);
	
	System.out.println(id);
	System.out.println(passwd);

	int check = memberPro.deleteMember(id, passwd);
	if(check == 1) {
		session.invalidate();
%>
	<script>
		alert("쇼핑몰에서 성공적으로 탈퇴했습니다.");
		location.href="../shopMain.jsp";
	</script>
<% } else { %>
	<script>
		alert("아이디가 존재하지 않습니다");
		history.go(-1);
	</script>
<%	}	%>

</body>
</html>