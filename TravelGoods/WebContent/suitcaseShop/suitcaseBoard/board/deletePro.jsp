<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="SuitcaseShop.board.BoardDBBean" %>
<%@ page import="SuitcaseShop.board.BoardDataBean" %>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글삭제 처리</title>
</head>
<body>
<%
int num = Integer.parseInt(request.getParameter("num"));
String pageNum = request.getParameter("pageNum");
String passwd = request.getParameter("passwd");

BoardDBBean dbPro = BoardDBBean.getInstance();
int check = dbPro.deleteArticle(num, passwd);

if(check == 1) {
	response.sendRedirect("list.jsp?pageNum="+pageNum);
}
%> 
<script type="text/javascript">
	alert("비밀번호가 맞지 않습니다.");
	history.go(-1);
</script>
</body>
</html>