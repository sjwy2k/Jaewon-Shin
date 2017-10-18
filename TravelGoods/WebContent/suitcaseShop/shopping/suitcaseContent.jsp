<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="SuitcaseShop.manager.ShopSuitcaseDBBean" %>
<%@ page import="SuitcaseShop.manager.ShopSuitcaseDataBean" %>
<%@ page import="java.text.NumberFormat" %>

<%@ include file="../etc/color.jspf"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Suitcase Shopping Mall</title>
<link href="../etc/style.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="<%=bodyback_c %>">
<%
String suitcase_kind = request.getParameter("suitcase_kind");
String suitcase_id = request.getParameter("suitcase_id");
String id = "";
int buy_price=0;

try{
	if(session.getAttribute("id")==null) {
		id = "not";
	} else {
		id = (String)session.getAttribute("id");
	}
} catch(Exception e) {
	e.printStackTrace();
} %>

<%
ShopSuitcaseDataBean suitcaseList = null;
String suitcase_kindName="";
ShopSuitcaseDBBean suitcaseProcess = ShopSuitcaseDBBean.getInstance();

suitcaseList = suitcaseProcess.getSuitcase(Integer.parseInt(suitcase_id));

if(suitcase_kind.equals("100")) {
	suitcase_kindName="문학서적";
} else if(suitcase_kind.equals("200")) {
	suitcase_kindName="외국어서적";
} else if(suitcase_kind.equals("300")) {
	suitcase_kindName="컴퓨터서적";
} else if(suitcase_kind.equals("all")) {
	suitcase_kindName="전체";
}
%>
<div class="container">
<form name="inform" method="post" action="cart/cartInsert.jsp">
<table>
	<tr>
		<td rowspan="6" width="150">
		<img src="../../imageFile/<%=suitcaseList.getSuitcase_image() %>"
		border="0" width="150" height="200"></td>
		<td>
			<font size="+1"><b><%=suitcaseList.getSuitcase_title() %></b></font>
		</td>
	</tr>
	<tr><td width="500">제조사 : <%=suitcaseList.getManufacturer() %></td></tr>
	<tr><td width="500">제조국가 : <%=suitcaseList.getProduct_con() %></td></tr>
	<tr><td width="500">생산일 : <%=suitcaseList.getProduct_date() %></td></tr>
	<tr><td width="500">정가 
: <del><b><%=NumberFormat.getInstance().format(suitcaseList.getSuitcase_price())%></b></del>원<br>
						할인가 : <b><font color="red" size="5">
 <%=NumberFormat.getInstance().format((int)(suitcaseList.getSuitcase_price()*
((double)(100-suitcaseList.getDiscount_rate())/100))) %></font></b>원
		</td>
	</tr>
	<tr>
		<td width="500">수량 : <input type="text" size="5" name="buy_count" value="1">개
		<%if(id.equals("not")) {
			if(suitcaseList.getSuitcase_count()==0) {
		%>
			<font color="red"><b>일시품절</b></font>
		<%} else {%>
			<font color="red">로그인 하셔야 구매가 가능합니다.</font><br>
		<%}
		} else {
			if(suitcaseList.getSuitcase_count()==0) {
		%>
			<font color="red"><b>일시품절</b></font>			
		<%} else {%>
		<input type="hidden" name="suitcase_id" value="<%=suitcase_id%>">
		<input type="hidden" name="suitcase_image" value="<%=suitcaseList.getSuitcase_image()%>">
		<input type="hidden" name="suitcase_title" value="<%=suitcaseList.getSuitcase_title()%>">
		<input type="hidden" name="buy_price" value="<%=suitcaseList.getSuitcase_price()%>">
		<input type="hidden" name="suitcase_kind" value="<%=suitcaseList.getSuitcase_kind()%>">
		<input type="submit" value="장바구니에 담기">
		<%}} %>
		<input type="button" value="목록으로" 
		onclick="javascript:window.location='list.jsp?suitcase_kind=<%=suitcase_kind %>'">
		<input type="button" value="메인으로" 
		onclick="javascript:window.location='shopMain.jsp'">
		</td>
	</tr>
	<tr>
		<td colspan="2" align="center">
		<br><%=suitcaseList.getSuitcase_content() %></td>
	</tr>
</table>
</form>
</div>
</body>
</html>

