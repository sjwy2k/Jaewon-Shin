<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>회원 가입 페이지</title>  
      <link rel="stylesheet" href="css/style.css">  
</head>
<body>
  <div class="login-wrap">
  <h2>회원 가입</h2>  
  <div class="form">
  	<form method="post" action="joinMemberPro.jsp">
	    <input type="text" placeholder="아이디" name="id" />
	    <input type="password" placeholder="비밀번호" name="passwd" />
	    <input type="text" placeholder="이름" name="name" />
	    <input type="text" placeholder="주소" name="address" />
	    <input type="text" placeholder="전화번호" name="tel" />
	    <button> 가입하기 </button>
	    <a href="../shopMain.jsp"><p> 쇼핑몰로 돌아가기</p></a>
    </form>
  </div>
</div>
  <script src='https://code.jquery.com/jquery-1.10.0.min.js'></script>
  <script  src="js/index.js"></script>
</body>
</html>