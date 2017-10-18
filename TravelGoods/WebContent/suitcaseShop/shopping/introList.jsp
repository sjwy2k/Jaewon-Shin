<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="SuitcaseShop.manager.ShopSuitcaseDBBean" %>
<%@ page import="SuitcaseShop.manager.ShopSuitcaseDataBean" %>
<%@ page import="java.text.NumberFormat" %>

<%@ include file="../etc/color.jspf" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Suitcase Shopping Mall</title>
<link href="../etc/style.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="<%=bodyback_c %>"> 
<h3>신상품소개</h3>
<%
ShopSuitcaseDataBean[] suitcaseLists = null;
int number = 0;
String suitcase_kindName = "";

ShopSuitcaseDBBean suitcasePro = ShopSuitcaseDBBean.getInstance();

for(int i = 1; i <= 3; i++) {	
	suitcaseLists = suitcasePro.getSuitcases(i+"00", 3);
	if(suitcaseLists[0].getSuitcase_kind().equals("100")) {
		suitcase_kindName="20인치";
	} else if(suitcaseLists[0].getSuitcase_kind().equals("200")) {
		suitcase_kindName="24인치";
	} else if(suitcaseLists[0].getSuitcase_kind().equals("300")) {
		suitcase_kindName="28인치";
	}
%>
<br><font size="+1"><b><%=suitcase_kindName %> 분류의 신상품목록 : 
	<a href="list.jsp?suitcase_kind=<%=suitcaseLists[0].getSuitcase_kind()%>">더보기</a>
</b></font>
<br>
<%
	for(int j = 0; j < suitcaseLists.length; j++) {
%>
	<table>
		<tr>
			<td colspan="2" width="450">
				<a
href="suitcaseContent.jsp?suitcase_id=<%=suitcaseLists[j].getSuitcase_id()%>&suitcase_kind=<%=suitcaseLists[0].getSuitcase_kind()%>">
				<img src="../../imageFile/<%=suitcaseLists[j].getSuitcase_image()%>"
					border="0" width="98%" height="600"></a></td>
		</tr>
		<tr height="30" bgcolor="<%=value_c %>">
			<td width="350">
				<font size="+1">
					<b><a
href="suitcaseContent.jsp?suitcase_id=<%=suitcaseLists[j].getSuitcase_id()%>&suitcase_kind=<%=suitcaseLists[0].getSuitcase_kind()%>">
					<%=suitcaseLists[j].getSuitcase_title()%>
					</a></b>
				</font>
			</td>
			<td rowspan="4" width="100">
			<%if(suitcaseLists[j].getSuitcase_count() == 0) {%>
				<font color="red"><b>일시품절</b></font>
			<%} else { %>
				<font color="blue"><b>★신상품★</b></font>
			<%} %>
			</td>
		</tr>
		<tr height="30" bgcolor="<%=value_c%>">
			<td width="350">제조사: <%=suitcaseLists[j].getManufacturer() %></td>
		</tr>
		<tr height="30" bgcolor="<%=value_c%>">
			<td width="350">제조국가 : <%=suitcaseLists[j].getProduct_con() %></td>
		</tr>
		<tr height="30" bgcolor="<%=value_c%>">
			<td width="350">정가 
: <b><del><%=NumberFormat.getInstance().format(suitcaseLists[j].getSuitcase_price())%></del></b>원<br>
							판매가 : <b><font color="red" size="5">
 <%=NumberFormat.getInstance().format((int)(suitcaseLists[j].getSuitcase_price()*
((double)(100-suitcaseLists[j].getDiscount_rate())/100))) %></font></b>원
			</td>
		</tr>
	</table>
	<br>
<%	}
}
%>
</body>
</html>