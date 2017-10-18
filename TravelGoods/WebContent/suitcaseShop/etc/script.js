function checkForm(writeform){

	if(!writeform.suitcase_kind.value){
	  alert("상품의 분류를 선택하십시오");
	  writeform.suitcase_kind.focus();
	  return false;
	}
	if(!writeform.suitcase_title.value){
	  alert("상품의 제목을 입력하십시오");
	  writeform.suitcase_title.focus();
	  return false;
	}
	
	if(!writeform.suitcase_price.value){
	  alert("상품의 가격을 입력하십시오");
	  writeform.suitcase_price.focus();
	  return false;
	}
        
	if(!writeform.suitcase_count.value){
	  alert("상품의 수량을 입력하십시오");
	  writeform.suitcase_count.focus();
	  return false;
	}
	
	if(!writeform.manufacturer.value){
	  alert("제조사를 입력하십시오");
	  writeform.manufacturer.focus();
	  return false;
	}
	
	if(!writeform.product_con.value){
	  alert("제조국가를 입력하십시오");
	  writeform.product_con.focus();
	  return false;
	}
	
	if(!writeform.suitcase_content.value){
	  alert("상품의 설명을 입력하십시오");
	  writeform.suitcase_content.focus();
	  return false;
	}
		
	writeform.action = "suitcaseRegisterPro.jsp";
    writeform.submit();
	
 } 
 
 function updateCheckForm(writeform){

	if(!writeform.suitcase_kind.value){
	  alert("상품의 분류를 선택하십시오");
	  writeform.suitcase_kind.focus();
	  return false;
	}
	if(!writeform.suitcase_title.value){
	  alert("상품의 제목을 입력하십시오");
	  writeform.suitcase_title.focus();
	  return false;
	}
	
	if(!writeform.suitcase_price.value){
	  alert("상품의 가격을 입력하십시오");
	  writeform.suitcase_price.focus();
	  return false;
	}
        
	if(!writeform.suitcase_count.value){
	  alert("상품의 수량을 입력하십시오");
	  writeform.suitcase_count.focus();
	  return false;
	}
	
	if(!writeform.manufacturer.value){
	  alert("재조사를 입력하십시오");
	  writeform.manufacturer.focus();
	  return false;
	}
	
	if(!writeform.product_con.value){
	  alert("제조국가를 입력하십시오");
	  writeform.product_con.focus();
	  return false;
	}
	
	if(!writeform.suitcase_content.value){
	  alert("상품의 설명을 입력하십시오");
	  writeform.suitcase_content.focus();
	  return false;
	}
		
	writeform.action = "suitcaseUpdatePro.jsp";
    writeform.submit();
	
 } 
 