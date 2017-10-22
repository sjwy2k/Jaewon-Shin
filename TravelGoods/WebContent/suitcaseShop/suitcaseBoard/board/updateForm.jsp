<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="SuitcaseShop.board.BoardDBBean" %>
<%@ page import="SuitcaseShop.board.BoardDataBean" %>
<%@ include file="../etc/color.jspf" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 수정</title>
<link href="../etc/updateForm.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="../etc/scirpt.js"></script>
</head>
<body bgcolor="<%=bodyback_c %>">
<div class="container">
<header>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
	try {
		BoardDBBean dbPro = BoardDBBean.getInstance();
		BoardDataBean article = dbPro.updateGetArticle(num);
%>
<h1>글수정</h1>
</header>
<section>
<br>
<form method="post" name="writeform" 
	action="updatePro.jsp?pageNum=<%=pageNum %>" onsubmit="return writeSave()">
	<table>
		<tr>
			<td width="100" bgcolor="<%=value_c %>" align="center" class="menu">이름</td>
			<td align="left" width="330">
				<input type="text" size="10" maxlength="10" name="writer"
				value="<%=article.getWriter() %>" style="ime-mode:active;">
				<input type="hidden" name="num" value="<%=article.getNum() %>">
			</td>
		</tr>
		<tr>
			<td width="100" bgcolor="<%=value_c %>" align="center" class="menu">제목</td>
			<td align="left" width="330">
				<input type="text" size="40" maxlength="50" name="subject"
				value="<%=article.getSubject() %>" style="ime-mode:active;">
		</tr>
		<tr>
			<td width="100" bgcolor="<%=value_c %>" align="center" class="menu">Email</td>
			<td align="left" width="330">
				<input type="text" size="40" maxlength="30" name="email"
				value="<%= article.getEmail() %>" style="ime-mode:inactive;">
		</tr>
		<tr>
			<td width="100" bgcolor="<%=value_c %>" align="center" class="menu">내 용</td>
			<td align="left" width="330"><textarea name="content" 
			rows="13" cols="40" style="ime-mode:active;"><%=article.getContent() %></textarea>
		</tr>
		<tr>
			<td width="100" bgcolor="<%=value_c %>" align="center" class="menu">비밀번호</td>
			<td align="left" width="330">
				<input type="password" size="8" maxlength="12" 
				name="passwd" style="ime-mode:inactive;">
			</td>
		</tr>
		<tr>
			<td colspan=2 bgcolor="<%=value_c %>" align="center" class="menu">
				<input type="submit" value="글수정">
				<input type="reset" value="다시작성">
				<input type="button" value="목록보기"
				onclick="document.location.href='list.jsp?pageNum=<%=pageNum %>'">
			</td>
		</tr>
	</table>
</form>
<%
	} catch(Exception e) { }
%>
</section>
<footer></footer>
</div>
</body>
</html>