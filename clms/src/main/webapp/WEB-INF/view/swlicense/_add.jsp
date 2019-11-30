<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CLMS</title>
<script
  src="https://code.jquery.com/jquery-3.4.1.min.js"
  integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
  crossorigin="anonymous"></script>
</head>
<body>
	<c:import url="/WEB-INF/view/common/top.jsp" />
	<form action="/swlicense" method="post" id="add_form">
		SW 이름 : <input type="text" name="swName" id="swName"/><br/>
		실습실 : <input type="text" name="useLabNo" id="useLabNo"/> <br/>
		SW 계약 일자 : <input type="date" name="contractDate"/>
		SW 만료 일자 : <input type="date" name="expiryDate"/><br/>
		SW 인증 코드 : <input type="text" name="authenticationCode" id="authenticationCode"/><br/>
		카피수 : <input type="text" name="copies" id="copies"/><br/>
		계약 담당 부서 명 : <input type="text" name="contractDept" id="contractDept"/><br/>
		계약 담당자 명 : <input type="text" name="contractName" id="contractName"/>
		계약 담당자 전화번호 : <input type="text" name="contractPhone" id="contractPhone"/><br/>
		공급 업체 명 : <input type="text" name="supplierName" id="supplierName"/><br/>
		공급 업체 담당자 명 : <input type="text" name="supplierContactName" id="supplierContactName"/> 
		공급 업체 담당자 전화번호 : <input type="text" name="supplierPhone" id="supplierPhone"/><br/>
		비고 : <input type="text" name="note"/>
		<br/>
		<div id="notice_area" align="left"></div>
		<br/>
		<div align="right">
	        <input type="button" id="add_btn" value="등록" />
	        <button type="button" onclick="location.href='/swlicense'">목록</button>
		</div>
	</form>
</body>

<script>
	$(document).ready(function() {
		$("#add_btn").click(function() {
			var sw_name = $('input[name=swName]').val();
			var sw_useLabNo = $('input[name=useLabNo]').val();
			var sw_contractDate = $('input[name=contractDate]').val();
			var sw_expiryDate = $('input[name=expiryDate]').val();
			var sw_authenticationCode = $('input[name=authenticationCode]').val();
			var sw_copies = $('input[name=copies]').val();
			var sw_contractDept = $('input[name=contractDept]').val();
			var sw_contractName = $('input[name=contractName]').val();
			var sw_contractPhone = $('input[name=contractPhone]').val();
			var sw_supplierName = $('input[name=supplierName]').val();
			var sw_supplierContactName = $('input[name=supplierContactName]').val();
			var sw_supplierPhone = $('input[name=supplierPhone]').val();
			var inputNumber = /[0-9]/;
			var inputPatern= /[~!@#$%^&*()_+|<>?:{}]/;
			var blank_pattern = /^\s+|\s+$/g;
			var swNo = document.getElementById('swNo');
			var contractDept = document.getElementById('contractDept');
			var contractName = document.getElementById('contractName');
			var supplierName = document.getElementById('supplierName');
			var supplierContactName = document.getElementById('supplierContactName');
			
			if (sw_name == ''|| swName.value.replace( blank_pattern, '' ) == "") {
				$('#notice_area').text('SW 프로그램 이름을 입력해주세요.');
				$("#notice_area").css("color", "red");
			} else if (sw_useLabNo == '') {
				$('#notice_area').text('사용 실습실을 입력해주세요.');
				$("#notice_area").css("color", "red");
			} else if (sw_contractDate == '') {
				$('#notice_area').text('계약 일자를 입력해주세요.');
				$("#notice_area").css("color", "red");
			} else if (sw_expiryDate == '') {
				$('#notice_area').text('만료 일자를 입력해주세요.');
				$("#notice_area").css("color", "red");
			} else if (sw_authenticationCode == '') {
				$('#notice_area').text('인증코드를 입력해주세요.');
				$("#notice_area").css("color", "red");
			} else if (sw_copies == '') {
				$('#notice_area').text('카피 수를 입력해주세요.');
				$("#notice_area").css("color", "red");
		 	} else if (sw_contractDept == '' || contractDept.value.replace( blank_pattern, '' ) == "") {
				$('#notice_area').text('계약 담당자 부서를 입력해주세요.');
				$("#notice_area").css("color", "red"); 
			} else if (sw_contractName == ''|| contractName.value.replace( blank_pattern, '' ) == "") {
				$('#notice_area').text('계약 담당자 명을 입력해주세요.');
				$("#notice_area").css("color", "red");
			} else if (sw_contractPhone == '') {
				$('#notice_area').text('계약 담당자 전화번호를 입력해주세요.');
				$("#notice_area").css("color", "red");
			} else if (sw_supplierName == ''|| supplierName.value.replace( blank_pattern, '' ) == "") {
				$('#notice_area').text('공급 업체명을 입력해주세요.');
				$("#notice_area").css("color", "red");
			} else if (sw_supplierContactName == ''|| supplierContactName.value.replace( blank_pattern, '' ) == "") {
				$('#notice_area').text('공급 업체 담당자 명을 입력해주세요.');
				$("#notice_area").css("color", "red");
			} else if (sw_supplierPhone == '') {
				$('#notice_area').text('공급 업체 담당자 전화번호를 입력해주세요.');
				$("#notice_area").css("color", "red");
			} else if (inputNumber.test(sw_contractDept) || inputPatern.test(sw_contractDept)) {
				$("#notice_area").text("계약 담당자 부서 명은 한글과 영문만 입력 가능합니다.");
				$("#notice_area").css("color", "red");
			} else {
				$('#add_form').submit(); // 폼 전송
			}
		});
	});

	$("#useLabNo").keyup(function(event){
		if (!(event.keyCode >=37 && event.keyCode<=40)) {
		var inputVal = $(this).val();
		$(this).val(inputVal.replace(/[^0-9.;\,]/gi,''));
		}
	});
	
	$("#authenticationCode").keyup(function(event){
		if (!(event.keyCode >=37 && event.keyCode<=40)) {
		var inputVal = $(this).val();
		$(this).val(inputVal.replace(/[^a-zA-Z0-9.;\-]/gi,''));
		}
	});
	
	$("#copies").keyup(function(event){
		if (!(event.keyCode >=37 && event.keyCode<=40)) {
		var inputVal = $(this).val();
		$(this).val(inputVal.replace(/[^0-9]/gi,''));
		}
	});
	
	$("#contractName").keyup(function(event){
		if (!(event.keyCode >=37 && event.keyCode<=40)) {
		var inputVal = $(this).val();
		$(this).val(inputVal.replace(/[^가-힣a-zA-Z\s]/gi,''));
		}
	});

	$("#supplierName").keyup(function(event){
		if (!(event.keyCode >=37 && event.keyCode<=40)) {
		var inputVal = $(this).val();
		$(this).val(inputVal.replace(/[^가-힣a-zA-Z\s]/gi,''));
		}
	});
	
	var autoHypenPhone = function(str){
	      str = str.replace(/[^0-9]/g, '');
	      var tmp = '';
	      if( str.length < 4){
	          return str;
	      }else if(str.length < 7){
	          tmp += str.substr(0, 3);
	          tmp += '-';
	          tmp += str.substr(3);
	          return tmp;
	      }else if(str.length < 11){
	          tmp += str.substr(0, 3);
	          tmp += '-';
	          tmp += str.substr(3, 3);
	          tmp += '-';
	          tmp += str.substr(6);
	          return tmp;
	      }else{              
	          tmp += str.substr(0, 3);
	          tmp += '-';
	          tmp += str.substr(3, 4);
	          tmp += '-';
	          tmp += str.substr(7);
	          return tmp;
	      }
	      
	      return str;
	}
	
	var contractPhoneNum = document.getElementById('contractPhone');
	var supplierPhone = document.getElementById('supplierPhone');
	
	contractPhoneNum.onkeyup = function(){
		console.log(this.value);
		this.value = autoHypenPhone( this.value );  
	}
	
	supplierPhone.onkeyup = function(){
		console.log(this.value);
		this.value = autoHypenPhone( this.value );  
	}
</script>	
</html>