<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.Timestamp" %>
<%@ page import="SuitcaseShop.manager.ShopSuitcaseDBBean" %>
<%@ page import="SuitcaseShop.manager.ShopSuitcaseDataBean" %>

<%@ include file="../../etc/color.jspf" %>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품수정</title>
<link href="../../etc/style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="../../etc/script.js"></script>
</head>
<body bgcolor="<%=bodyback_c %>">
<div class="container">
<%
String managerId = "";
try {
	managerId = (String)session.getAttribute("managerId");
	if(managerId==null || managerId.equals("")) {
		response.sendRedirect("../logon/managerLoginForm.jsp");		
	} else {
%>
<%
	int suitcase_id = Integer.parseInt(request.getParameter("suitcase_id"));
	String suitcase_kind = request.getParameter("suitcase_kind");
	try {
		ShopSuitcaseDBBean suitcaseProcess = ShopSuitcaseDBBean.getInstance();
		ShopSuitcaseDataBean suitcase = suitcaseProcess.getSuitcase(suitcase_id); 
		// DBBean에서 수정할 아이디에 해당하는 상품 한 건의 정보를 불러온다.
%>

<p>상품 수정</p>
<br>

<form method="post" name="writeform"
		action="suitcaseUpdatePro.jsp" enctype="multipart/form-data">
<table>
	<tr>
		<td align="center" colspan="2" bgcolor="<%=value_c %>">
			<a href="../managerMain.jsp">관리자 메인으로</a> &nbsp;
			<a href="suitcaseList.jsp?suitcase_kind=<%=suitcase_kind %>">목록으로</a>
		</td>
	</tr>
	<tr> 
		<td width="100" bgcolor="<%=value_c %>">분류선택</td>
		<td width="400" align="left"> <!-- 수정할 상품이 분류되었던 종류 조건으로 자동선택 -->
			<select name="suitcase_kind">
				<option value="100" 
				<%if(suitcase.getSuitcase_kind().equals("100")) {%>selected<%} %>
				>20인치</option>
				<option value="200" 
				<%if(suitcase.getSuitcase_kind().equals("200")) {%>selected<%} %>
				>24인치</option>
				<option value="300" 
				<%if(suitcase.getSuitcase_kind().equals("300")) {%>selected<%} %>
				>28인치</option>
			</select>
		</td>
	</tr>
	<tr>
		<td width="100" bgcolor="<%=value_c %>">상품명</td>
		<td width="400" align="left">
			<input type="text" size="50" maxlength="50" name="suitcase_title"
			value="<%=suitcase.getSuitcase_title() %>"> 
			<input type="hidden" name="suitcase_id" value="<%=suitcase_id %>">
		</td>	<!--hidden 속성으로 상품번호의 값을 같이 전송하기 위해 값을 받아놓는다 -->
	</tr>
	<tr>
		<td width="100" bgcolor="<%=value_c %>">가격</td>
		<td width="400" align="left">
			<input type="text" size="10" maxlength="9" name="suitcase_price"
			value="<%=suitcase.getSuitcase_price() %>">원
		</td>
	</tr>
	<tr>
		<td width="100" bgcolor="<%=value_c %>">수량</td>
		<td width="400" align="left">
			<input type="text" size="10" maxlength="5" name="suitcase_count"
			value="<%=suitcase.getSuitcase_count() %>">권
		</td>
	</tr>
	<tr>
		<td width="100" bgcolor="<%=value_c %>">저자</td>
		<td width="400" align="left">
			<input type="text" size="10" maxlength="5" name="manufacturer"
			value="<%=suitcase.getManufacturer() %>">
		</td>
	</tr>
	<tr>
		<td width="100" bgcolor="<%=value_c %>">출판사</td>
		<td width="400" align="left">
			<input type="text" size="20" maxlength="30" name="product_con"
			value="<%=suitcase.getProduct_con() %>">
		</td>
	</tr>
	<tr>
		<td width="100" bgcolor="<%=value_c %>">출판일</td>
		<td width="400" align="left">
			<select name="product_year">
			<% 
			Timestamp nowTime = new Timestamp(System.currentTimeMillis());
					// 올해를 String 자료형 변수에 입력받은 뒤, 연도가 존재하는 4자리를 추출한다.
			int lastYear = Integer.parseInt(nowTime.toString().substring(0, 4));
			for(int i = lastYear; i >= 2000; i--) {
										// 2000년부터 2017년 현재 까지의 범위로 선택메뉴 설정 
			%>
				<option value="<%=i %>"
				<%if(Integer.parseInt(suitcase.getProduct_date().substring(0, 4))==i) {
				%>selected <% }%>><%=i %></option>
				<%} %>				
			</select>년
			
			<select name="product_month">
			<%
			for(int i = 1; i <= 12; i++) {
			%>
				<option value="<%=i %>"
				<%if(Integer.parseInt(suitcase.getProduct_date().substring(5, 7))==i) {%>
				selected <% }%>><%=i %></option>
				<%} %>				
			</select>월
		</td>
	</tr>
	<tr>
		<td width="100" bgcolor="<%=value_c %>">이미지</td>
		<td width="400" align="left">
			<input type="file" name="suitcase_image">
			<%=suitcase.getSuitcase_image() %>
		</td>
	</tr>
	<tr>
		<td width="100" bgcolor="<%=value_c %>">내용</td>
		<td width="400" align="left"><textarea name="suitcase_content" rows="13" cols="40"><%=suitcase.getSuitcase_content() %></textarea>
		</td>
	</tr>
	<tr>
		<td width="100" bgcolor="<%=value_c %>">할인율</td>
		<td width="400" align="left">
			<input type="text" size="5" maxlength="2" name="discount_rate"
			value="<%=suitcase.getDiscount_rate() %>">%
		</td>
	</tr>
	<tr>
		<td colspan=2 bgcolor="<%=value_c %>" align="center">
			<input type="button" value="상품 수정" onclick="updateCheckForm(this.form)">
			<input type="reset" value="다시 작성"> 
		</td>							<!--onclick으로 form 태그 내 입력된 정보 전부를 전송 -->
	</tr>
</table>
</form>
<%
}catch(Exception e) {
	e.printStackTrace();
}%>
</div>
</body>
</html>
<%}
}catch(Exception e) {
	e.printStackTrace();
}%>