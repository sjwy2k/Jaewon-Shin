<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="SuitcaseShop.customer.CustomerDBBean" %>
<%@ page import="SuitcaseShop.customer.CustomerDataBean" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>회원정보 수정 페이지</title>  
<link rel="stylesheet" href="css/style.css">
</head>
<body>
<%
String id = request.getParameter("id");
String passwd = request.getParameter("passwd");

CustomerDataBean member = null;
CustomerDBBean memberPro = CustomerDBBean.getInstance();

member = memberPro.getMember(id);

%>

<div class="login-wrap">
  <h2>마이페이지</h2>  
  <div class="form">
  	<form method="post" action="updateMemberPro.jsp">
	    <input type="text" placeholder="아이디" style='background-color : lightgrey' name="id" value="<%=member.getId() %>" readonly />
	    <input type="password" placeholder="비밀번호" name="passwd"  value="<%=member.getPasswd() %>" />
	    <input type="text" placeholder="이름" name="name"  value="<%=member.getName() %>" />
	    <input type="text" placeholder="주소" name="address"  value="<%=member.getAddress() %>" />
	    <input type="text" placeholder="전화번호" name="tel"  value="<%=member.getTel() %>" />
	    <button>회원 정보 수정하기 </button>		   	    
    </form>
    <form>
   		<button style="background-color : #4948FF;" type="button" onclick="delChk();">쇼핑몰로 돌아가기</button>
   		<script>
   		function delChk() {
   			if(confirm("쇼핑몰에서 탈퇴하시겠습니까?")) {
   				location.href="deleteMemberPro.jsp?id=<%=member.getId() %>&passwd=<%=member.getPasswd() %>";
   				return true;
   			} else {
   				return false;
   			}
   		}
   		</script>
   		<a href="../shopMain.jsp"><p>탈퇴하기</p></a>
   	</form>    
  </div>
</div>
  <script src='https://code.jquery.com/jquery-1.10.0.min.js'></script>
  <script  src="js/index.js"></script>
</body>
</html>