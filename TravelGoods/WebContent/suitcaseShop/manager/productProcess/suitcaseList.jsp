<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="SuitcaseShop.manager.ShopSuitcaseDBBean" %>
<%@ page import="SuitcaseShop.manager.ShopSuitcaseDataBean" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.SimpleDateFormat" %>

<%@ include file="../../etc/color.jspf" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>등록된 상품 목록</title>
<link href="../../etc/suitcaseList.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="<%=bodyback_c %>">
<div class="container">
<%! // 편리한 시간표시 - 24h
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd kk:mm");
%>

<%
String managerId = ""; // 관리자 인증 - 세션

try {
	managerId = (String)session.getAttribute("managerId");
	if(managerId==null || managerId.equals("")) {
		response.sendRedirect("../logon/managerLoginForm.jsp");		
	} else {
%>



<%
	List<ShopSuitcaseDataBean> suitcaseList = null;
	int number = 0;
	String suitcase_kind = "";
	
	suitcase_kind = request.getParameter("suitcase_kind");
	
	ShopSuitcaseDBBean suitcaseProcess = ShopSuitcaseDBBean.getInstance();
	int count = suitcaseProcess.getSuitcaseCount();
	
	// 입력된 상품 정보가 존재한다면
	if(count > 0) { 		//DBBean의 입력된 상품목록을 조회
		suitcaseList = suitcaseProcess.getSuitcases(suitcase_kind); 
	}
%>

<%
	String suitcase_kindName="";
	
	if(suitcase_kind.equals("100")){
		suitcase_kindName="20인치";
	} else if(suitcase_kind.equals("200")){
		suitcase_kindName="24인치";
	} else if(suitcase_kind.equals("300")){
		suitcase_kindName="28인치";
	} else if(suitcase_kind.equals("all")){
		suitcase_kindName="전체";
	}
%>

<a href="../managerMain.jsp">관리자 메인으로</a> &nbsp;

<p>
	<%=suitcase_kindName %> 분류의 목록 : 
	<% if(suitcase_kind.equals("all")) {%>
	<%=count %>개
	<%} else { %> 
		<%=suitcaseList.size() %>개 
	<%} %>
</p>

<table>
	<tr>
		<td align="center" bgcolor="<%=value_c %>">
			<a href="suitcaseRegisterForm.jsp">상품 등록</a>
		</td>
	</tr>
</table>

<%
	if(count == 0) { // 상품 목록이 없다면
%>
<table>
	<tr align="center">
		<td>등록된 상품이 없습니다.<td>
	</tr>
</table>
<%	} else { %>
<table class="list">
	<tr height="30" bgcolor="<%=value_c %>">
		<td align="center" width="50">번호</td>
		<td align="center" width="50">캐리어 종류</td>
		<td align="center" width="200">상품 이름</td>
		<td align="center" width="30">가격</td>
		<td align="center" width="30">수량</td>
		<td align="center" width="30">제조사</td>
		<td align="center" width="90">제조국가</td>
		<td align="center" width="100">제조일</td>
		<td align="center" width="30">상품 이미지</td>
		<td align="center" width="30">할인율</td>
		<td align="center" width="100">상품 등록일</td>
		<td align="center" width="30">수정</td>
		<td align="center" width="30">삭제</td>
	</tr>
	<%
		for(int i = 0; i < suitcaseList.size(); i++) {
			ShopSuitcaseDataBean suitcase = (ShopSuitcaseDataBean)suitcaseList.get(i);
	%>
	<tr height="30">
		<td width="30"><%=++number %></td>
		<td width="50"><%=suitcase.getSuitcase_kind() %></td>
		<td width="100"><%=suitcase.getSuitcase_title() %></td>
		<td width="50"><%=suitcase.getSuitcase_price() %></td>
		<td width="100">
		<% if(suitcase.getSuitcase_count()==0) { %>
			<font color="red"><b><%="재고 없음" %></b></font>
		<% } else { %>
			<%=suitcase.getSuitcase_count() %>
		<% }%>
		</td>
		<td width="70"><%=suitcase.getManufacturer() %></td>
		<td width="90"><%=suitcase.getProduct_con() %></td>
		<td width="100"><%=suitcase.getProduct_date() %></td>
		<td width="50"><%=suitcase.getSuitcase_image() %></td>
		<td width="50"><%=suitcase.getDiscount_rate() %></td>
		<td width="50"><%=sdf.format(suitcase.getReg_date()) %></td>
		<td width="50">
		<a href="suitcaseUpdateForm.jsp?suitcase_id=<%=suitcase.getSuitcase_id() %>&
						suitcase_kind=<%=suitcase.getSuitcase_kind() %>">수정
		</a>
		</td>
		<td width="50">
		<a href="suitcaseDeleteForm.jsp?suitcase_id=<%=suitcase.getSuitcase_id() %>&
						suitcase_kind=<%=suitcase.getSuitcase_kind() %>">삭제
		</a>
		</td>
	</tr>
		<%} %>
</table>
	<%} %>
<br>
<a href="../managerMain.jsp">관리자 메인으로</a>
</div>
</body>
</html>
<%
	}
} catch(Exception e) {
	e.printStackTrace();
}
%> 