<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="SuitcaseShop.board.BoardDBBean" %>
<%@ page import="java.sql.Timestamp" %>

<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글수정 처리</title>
</head>
<body>
<jsp:useBean id="article" class="SuitcaseShop.board.BoardDataBean" scope="page">
	<jsp:setProperty name="article" property="*"/>
</jsp:useBean>

<%
	String pageNum = request.getParameter("pageNum");
	
	BoardDBBean dbPro = BoardDBBean.getInstance();
	int check = dbPro.updateArticle(article);
	
	if(check==1) {
		response.sendRedirect("list.jsp?pageNum="+pageNum);
	}
%>

		<script type="text/javascript">
			alert("비밀번호가 맞지 않습니다.");
			history.go(-1);
		</script>

</body>
</html>