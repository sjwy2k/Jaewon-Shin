<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="SuitcaseShop.board.BoardDBBean" %>
<%@ page import="SuitcaseShop.board.BoardDataBean" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ include file="../etc/color.jspf" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<link href="../etc/content.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="<%=bodyback_c %>">
<div class="container">
<%
int num = Integer.parseInt(request.getParameter("num"));
String pageNum = request.getParameter("pageNum");

SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd kk:mm");

try {
	BoardDBBean dbPro = BoardDBBean.getInstance();
	BoardDataBean article = dbPro.getArticle(num);
	int ref = article.getRef();
	int re_step = article.getRe_step();
	int re_level = article.getRe_level();

%>	
<form>
	<header>
		<h1>글내용 보기</h1>	
	</header>
	<section>
	<table>
		<tr height="30">
			<td align="center" width="125" bgcolor="<%=value_c %>" class="menu">글번호</td>
			<td align="center" width="125" class="content"><%=article.getNum() %></td>
			<td align="center" width="125" bgcolor="<%=value_c %>" class="menu">조회수</td>
			<td align="center" width="125" class="content"><%=article.getReadcount() %></td>
		</tr>
		<tr height="30">
			<td align="center" width="125" bgcolor="<%=value_c %>" class="menu">작성자</td>
			<td align="center" width="125" class="content"><%=article.getWriter() %></td>
			<td align="center" width="125" bgcolor="<%=value_c %>" class="menu">작성일</td>
			<td align="center" width="125" class="content"><%=sdf.format(article.getReg_date()) %></td>
		</tr>
		<tr height="30">
			<td align="center" width="125" bgcolor="<%=value_c %>" class="menu">글제목</td>
			<td align="left" width="125" colspan="3" class="content"><%=article.getSubject() %></td>
		</tr>
		<tr height="30">
			<td align="center" width="125" bgcolor="<%=value_c %>" class="menu">글내용</td>
			<td align="left" width="125" height="300" colspan="3" class="content">
			<pre><%=article.getContent().replaceAll("\r\n", "<br/>") %></pre>
			</td>
		</tr>
		<tr height="30">
			<td colspan="4" bgcolor="<%=value_c%>" align="right" class="button">
				<input type="button" value="글수정"
onclick="document.location.href='updateForm.jsp?num=<%=article.getNum() %>&pageNum=<%=pageNum %>'">
				&nbsp;&nbsp;&nbsp;&nbsp;
				 <input type="button" value="글삭제"
onclick="document.location.href='deleteForm.jsp?num=<%=article.getNum() %>&pageNum=<%=pageNum %>'">
				&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="button" value="댓글쓰기"
onclick="document.location.href='writeForm.jsp?num=<%=article.getNum()%>&ref=<%=ref%>&re_step=<%=re_step%>
&re_level=<%=re_level %>'">
				&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="button" value="글목록"
onclick="document.location.href='list.jsp?pageNum=<%=pageNum %>'">
			</td>
		</tr>	
	</table>
	</section>	
<%
} catch(Exception e) { }
%>
	<footer></footer>	
</form>
</div>
</body>
</html>