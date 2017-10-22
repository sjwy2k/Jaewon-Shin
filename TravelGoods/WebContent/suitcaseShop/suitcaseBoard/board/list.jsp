<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="SuitcaseShop.board.BoardDBBean" %>
<%@ page import="SuitcaseShop.board.BoardDataBean" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ include file="../etc/color.jspf" %>
<!DOCTYPE html>
<html>
<head>
<link href="../etc/list.css" rel="stylesheet" type="text/css">
<meta charset="UTF-8">
<title>상품후기 게시판</title>
</head>
<body bgcolor="<%=bodyback_c %>">
<div class="container">
<%! 
	int pageSize = 10;
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd kk:mm"); 
%>
<%
	String pageNum = request.getParameter("pageNum");
	
	if(pageNum == null) {
		pageNum = "1";
	}
	
	int currentPage = Integer.parseInt(pageNum); // 현재 페이지 번호
	int startRow = (currentPage - 1) * pageSize + 1; // 현재 페이지의 시작번호
	int endRow = currentPage * pageSize; // 현재 페이지의 끝 번호
	int count = 0; // 전체 글 수
	int number = 0;
	List <BoardDataBean> articleList = null;
	
	BoardDBBean dbPro = BoardDBBean.getInstance();
	count = dbPro.getArticleCount();
	
	if(count > 0) {
		articleList = dbPro.getArticles(startRow, endRow);
	}
	
	number = count - (currentPage - 1) * pageSize;
%>
<header>
<h1>여행가방 상품 구매후기 게시판</h1>
<h2>글목록(전체 글 : <%=count %>)</h2>
<table class="new">
	<tr class="index">		
		<td align="right" bgcolor="<%=value_c %>">
			<a href="../../shopping/shopMain.jsp">메인페이지</a>
		</td>
		<td align="right" bgcolor="<%=value_c %>">
			<a href="writeForm.jsp">글쓰기</a>
		</td>		
	</tr>
</table>
</header>
<section>
<% 
	if(count == 0) { 
%>
<table class="menu">
	<tr height="30" bgcolor="<%=value_c %>" class="index">
		<td align="center" width="50">번 호</td>
		<td align="center" width="250">제 목</td>
		<td align="center" width="100">작성자</td>
		<td align="center" width="150">작성일</td>
		<td align="center" width="50">조 회</td>
		<td align="center" width="100">IP</td>
	</tr>
	<tr>		
		<td align="center" colspan="6">
			게시판에 저장된 글이 없습니다.
		</td>
	</tr>
</table>

<%	} else { // 1 %> 
<table class="mainboard">
	<tr height="30" bgcolor="<%=value_c %>" class="index">
		<td align="center" width="50">번 호</td>
		<td align="center" width="450">제 목</td>
		<td align="center" width="200">작성자</td>
		<td align="center" width="200">작성일</td>
		<td align="center" width="50">조 회</td>
		<td align="center" width="100">IP</td>
	</tr>
<%
		for(int i = 0; i < articleList.size(); i++) { // 2
			BoardDataBean article = articleList.get(i);
%>
	<tr height="30">
		<td width="50"><%=number-- %></td>
		<td width="250" align="left">
<%
			int wid = 0;
			if(article.getRe_level() > 0) { // 3
				wid = 5 * (article.getRe_level());
%>		
				<%
				for(int j = 0; j < wid; j++) {
					out.print("&nbsp");
				}
				%>
				<img src="../images/re.png">					
<% 
			} else {
%>
				<%-- <img src="../images/level.png" width="<%=wid %>" height="16"> --%>
<% 			
			} // 2
%>
				<a href="content.jsp?num=<%=article.getNum() %>&pageNum=<%=currentPage %>">
					<%=article.getSubject() %></a>
<% 
			if(article.getReadcount() >= 10) {
%>
			<img src="../images/hot.png" border="0" height="16">
<%
			}
%>
		</td>
		<td width="100" align="center">
			<a href="mailto:<%=article.getEmail() %>">
				<%=article.getWriter() %></a>
		</td>
		<td width="150"><%=sdf.format(article.getReg_date()) %></td>
		<td width="50"><%=article.getReadcount() %></td>
		<td width="100"><%=article.getIp() %></td>
	</tr>
<%
		} // 1
%>
</table>
<%
	} 
%>
<div class="pagenum">
<% // 페이지 수가 1 이상 출력이 필요할 때
	if(count > 0) {
		// pageCount - 전체 페이지 수
		int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
		int startPage = 1;
		// 시작페이지 번호 설정, pageBlock이 10이면, 1, 11, 21
		if(currentPage % 10 != 0) {
			startPage = (int)(currentPage/10)*10 + 1;
		} else {
			startPage = ((int)(currentPage/10)-1)*10 + 1;
		}
		
		int pageBlock = 10; // 한 페이지에 나타날 페이지의 수
		int endPage = startPage + pageBlock - 1; // 한 페이지에 나타날 마지막 페이지 번호
		//pageCount가 13이면, 마지막 페이지는 20이 아니라 13이 되게 함
		if(endPage > pageCount) { // 내가 빠트린 부분
			endPage = pageCount; 
		}
		// 시작페이지가 10보다 크면 [이전]이 나타나게 함
		if(startPage > 10) { %>
			<a href="list.jsp?pageNum=<%=startPage - 10 %>">[이전]</a>
<%
		}
		// 페이지 번호를 출력
		for(int i = startPage; i <= endPage; i++) { 
%>
			<a href="list.jsp?pageNum=<%=i %>">[<%=i %>]</a>
<%		}		
		// 마지막 페이지가 pageCount보다 작다면 [다음]이 나타나게끔 함
		if(endPage < pageCount) { %>
			<a href="list.jsp?pageNum=<%=startPage + 10 %>">[다음]</a>
<%
		}
	}
%>
</div>
</section>
<footer></footer>
</div>	
</body>
</html>