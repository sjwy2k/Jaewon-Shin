<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="SuitcaseShop.manager.ShopSuitcaseDBBean" %>
<%@ page import="SuitcaseShop.manager.ShopSuitcaseDataBean" %>
<%@ page import="java.util.List" %>
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
<%
String suitcase_kind = request.getParameter("suitcase_kind");

List<ShopSuitcaseDataBean> suitcaseLists = null;
ShopSuitcaseDataBean suitcaseList = null;
String suitcase_kindName="";

ShopSuitcaseDBBean suitcasePro = ShopSuitcaseDBBean.getInstance();

suitcaseLists = suitcasePro.getSuitcases(suitcase_kind);
if(suitcase_kind.equals("100")) {
	suitcase_kindName="20인치";
} else if(suitcase_kind.equals("200")) {
	suitcase_kindName="24인치";
} else if(suitcase_kind.equals("300")) {
	suitcase_kindName="28인치";
} else if(suitcase_kind.equals("400")) {
	suitcase_kindName="하드케이스";
} else if(suitcase_kind.equals("500")) {
	suitcase_kindName="소프트케이스";
}
%>
<div class="container">
<table>
	<tr>
		<td width="150" valign="top">
			<img src="../module/logo.jpg" border="0" width="150" height="120">
		</td>
		<td>
			<jsp:include page="../module/top.jsp" flush="false"/>
		</td>		
	</tr>
	<tr>
		<td width="150" valign="top">
			<jsp:include page="../module/left.jsp" flush="false" />
		</td>
		<td width="700">
			<h3><b><%=suitcase_kindName %> 분류의 목록</b></h3>
			<a href="shopMain.jsp">메인으로</a>
			<br>
			<%
			for(int i = 0; i < suitcaseLists.size(); i++) {
				suitcaseList = (ShopSuitcaseDataBean)suitcaseLists.get(i);
			%>
			<table>
				<tr>
					<td colspan="2" width="450">
						<a
	href="suitcaseContent.jsp?suitcase_id=<%=suitcaseList.getSuitcase_id()%>&suitcase_kind=<%=suitcaseList.getSuitcase_kind()%>">
					<img src="../../imageFile/<%=suitcaseList.getSuitcase_image()%>"
						border="0" width="98%" height="600"></a></td>
				</tr>			
				<tr height="30" bgcolor="<%=value_c %>">				
					<td width="350">
					<font size="+1">
						<b><a
	href="suitcaseContent.jsp?suitcase_id=<%=suitcaseList.getSuitcase_id()%>&suitcase_kind=<%=suitcaseList.getSuitcase_kind()%>">
						<%=suitcaseList.getSuitcase_title()%>
						</a></b>
						</font>
					</td>
					<td rowspan="4" width="100">
						<%if(suitcaseList.getSuitcase_count() == 0) {%>
						<font color="red"><b>일시품절</b></font>
						<%} else { %>
						<font color="blue"><b>★신상품★</b></font>
						<%} %>
					</td>
				</tr>
			<tr height="30" bgcolor="<%=bar%>">
				<td width="350">제조사 : <%=suitcaseList.getManufacturer() %></td>
			</tr>
			<tr height="30" bgcolor="<%=bar%>">
				<td width="350">제조국가 : <%=suitcaseList.getProduct_con() %></td>
			</tr>
			<tr height="30" bgcolor="<%=bar%>">
				<td width="350">정가 
	: <b><del><%=NumberFormat.getInstance().format(suitcaseList.getSuitcase_price())%></del></b>원<br>
								할인가 : <b><font color="red" size="5">
	 <%=NumberFormat.getInstance().format((int)(suitcaseList.getSuitcase_price()*
	((double)(100-suitcaseList.getDiscount_rate())/100))) %></font></b>원
				</td>
			</tr>
			</table>
			<br>
		<%} %>
		</td>
	</tr>
</table>
</div>
</body>
</html>
