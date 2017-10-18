<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="SuitcaseShop.manager.ShopSuitcaseDBBean" %>
<%@ page import="java.sql.Timestamp" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>

<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
<%
String realFolder = ""; // 웹 어플리케이션의 절대경로
String filename = "";
MultipartRequest imageUp = null;

String saveFolder = "/imageFile"; // 이미지 파일 업로드 경로
String encType = "utf-8"; // 인코딩 타입
int maxSize = 2*1024*1024; // 이미지파일 최대크기 2Mbyte

ServletContext context = getServletContext(); // 서블릿 절대 경로
realFolder = context.getRealPath(saveFolder); // 저장되는 위치

try {
	// 전송을 담당할 컴포넌트를 생성하고 파일을 전송
	// 전송할 파일명을 가지고 있는 객체, 서버상의 절대경로, 
	// 최대 이미지 크기, 문자코드, 중복파일 처리정책 적용
	imageUp = new MultipartRequest(
			request, realFolder, maxSize, 
			encType, new DefaultFileRenamePolicy());
	
	// 전송할 파일 정보를 가져와 출력한다.
	Enumeration<?> files = imageUp.getFileNames();
	// 파일 정보가 있다면
	while(files.hasMoreElements()) {
		// input 태그의 속성이 file인 태그의 name 속성값 : 파라미터 이름
		String name = (String)files.nextElement();
		
		//서버에 저장된 파일 이름
		filename = imageUp.getFilesystemName(name);
	}	
} catch(Exception e) {
	e.printStackTrace();
}
%>
<!-- 폼에서 넘어온 파일 한꺼번에 -->
<jsp:useBean id="suitcase" scope="page"
	class="SuitcaseShop.manager.ShopSuitcaseDataBean">
</jsp:useBean>

<%
int suitcase_id=Integer.parseInt(imageUp.getParameter("suitcase_id"));
String suitcase_kind = imageUp.getParameter("suitcase_kind");
String suitcase_title = imageUp.getParameter("suitcase_title");
String suitcase_price = imageUp.getParameter("suitcase_price");
String suitcase_count = imageUp.getParameter("suitcase_count");
String manufacturer = imageUp.getParameter("manufacturer");
String product_con = imageUp.getParameter("product_con");
String suitcase_content = imageUp.getParameter("suitcase_content");
String discount_rate = imageUp.getParameter("discount_rate");

// 연, 월, 일은 한꺼번에 받아서 설정.
String year = imageUp.getParameter("product_year");
String month = 
	(imageUp.getParameter("product_month").length()==1) ? 
			"0" + imageUp.getParameter("product_month") :
			imageUp.getParameter("product_month");

suitcase.setSuitcase_kind(suitcase_kind);
suitcase.setSuitcase_title(suitcase_title);
suitcase.setSuitcase_price(Integer.parseInt(suitcase_price));
suitcase.setSuitcase_count(Short.parseShort(suitcase_count));
suitcase.setManufacturer(manufacturer);
suitcase.setProduct_con(product_con);
suitcase.setProduct_date(year + "-" + month);
suitcase.setSuitcase_image(filename);
suitcase.setSuitcase_content(suitcase_content);

suitcase.setDiscount_rate(Byte.parseByte(discount_rate));
suitcase.setReg_date(new Timestamp(System.currentTimeMillis()));

ShopSuitcaseDBBean suitcaseProcess = ShopSuitcaseDBBean.getInstance();
suitcaseProcess.updateSuitcase(suitcase, suitcase_id); //DBBean의 상품 정보 수정 메서드 실행

//수정성공시 동일종류로 입력된 상품목록 페이지로 이동
response.sendRedirect("suitcaseList.jsp?suitcase_kind="+suitcase_kind);
%>
</body>
</html>