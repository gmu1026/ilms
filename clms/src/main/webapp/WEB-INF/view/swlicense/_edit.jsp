<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CLMS</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"
	integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
	crossorigin="anonymous">
 </script>
</head>
<body>
	<c:import url="/WEB-INF/view/common/top.jsp" />
	<div class="from-group" align="left">
		<form action="${pageConext.request.contextPath}/swlicense/${swLicense.no}" method="post" id="edit_form">
			<input type="hidden" name="_method"/>
			<input type="hidden" name="no" value="${swLicense.no}"/>
			SW 이름 : <input type="text" name="swNo"  value="${swLicense.swNo}"/><br/>
			실습실: <input type="text" name="useLabNo"  value="${swLicense.useLabNo}" id="useLabNo"/><br/>
			SW 계약 일자 : <input type="date" name="contractDate"  value="${swLicense.contractDate}"/>
			SW 만료 일자: <input type="date" name="expiryDate"  value="${swLicense.expiryDate}"/><br/>
			SW 인증 코드: <input type="text" name="authenticationCode"  value="${swLicense.authenticationCode}" id="authenticationCode"/><br/>
			카피수: <input type="text" name="copies"  value="${swLicense.copies}" id="copies"/>	<br/>
			계약 담당 부서 명: <input type="text" name="contractDept"  value="${swLicense.contractDept}" id="contractDept"/><br/>
			계약 담당자 명: <input type="text" name="contractName"  value="${swLicense.contractName}" id="contractName"/>
			계약 담당자 전화번호: <input type="tel" name="contractPhone"  value="${swLicense.contractPhone}" id="contractPhone"/><br/>
			공급 업체 명:<input type="text" name="supplierName"  value="${swLicense.supplierName}" id="supplierName"/><br/>
			공급 업체 담당자 명: <input type="text" name="supplierContactName"  value="${swLicense.supplierContactName}" id="supplierContactName"/>
			공급 업체 담당자 전화번호: <input type="tel" name="supplierContactPhone"  value="${swLicense.supplierContactPhone}" id="supplierContactPhone"/><br/>
			비고: <textarea name="note" />${swLicense.note}</textarea>
			<br/>
			<div id="notice_area" align="left"></div>
			<br/>
			<div align="right">
				<button type="button" id="btn_edit">수정</button>
				<button type="button" id="btn_delete">삭제</button>
				<button type="button" id="btn_list" onclick="location.href='/swlicense'">목록</button>
			</div>
		</form>
	</div>
</body>

<script>
	$(document).ready(function() {
		$("#btn_delete").click(function() {	// 액션 속성 바꾸기
			$('input[name=_method]').val('delete'); //메소드명 바꿔주기
			$('#edit_form').submit(); // 폼 전송
		});
		
		$("#btn_edit").click(function() {
			var sw_name = $('input[name=swNo]').val();
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
			var sw_supplierContactPhone = $('input[name=supplierContactPhone]').val();
			var inputNumber = /[0-9]/;
			var inputPatern= /[~!@#$%^&*()_+|<>?:{}]/;
			var blank_pattern = /^\s+|\s+$/g;
			var contractDept = document.getElementById('contractDept');
			var contractName = document.getElementById('contractName');
			var supplierName = document.getElementById('supplierName');
			var supplierContactName = document.getElementById('supplierContactName');
			
			if (sw_name == '') {
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
			} else if (sw_supplierContactPhone == '') {
				$('#notice_area').text('공급 업체 담당자 전화번호를 입력해주세요.');
				$("#notice_area").css("color", "red");
			} else if (inputNumber.test(sw_contractDept) || inputPatern.test(sw_contractDept)) {
				$("#notice_area").text("계약 담당자 부서 명은 한글과 영문만 입력 가능합니다.");
				$("#notice_area").css("color", "red");
			} else {
				$('#edit_form').attr("action", "/swlicense"); 	// 액션 속성 바꾸기
				$('input[name=_method]').val('put'); //메소드명 바꿔주기
				$('#edit_form').submit(); // 폼 전송
			}
		});
		
		$("#btn_list").click(function() {
			$('#edit_form').attr("action", "/swlicense");
			$('input[name=_method]').val('get');
			$('#edit_form').submit();
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
		var supplierContactPhone = document.getElementById('supplierContactPhone');
		
		contractPhoneNum.onkeyup = function(){
			console.log(this.value);
			this.value = autoHypenPhone( this.value );  
		}
		
		supplierContactPhone.onkeyup = function(){
			console.log(this.value);
			this.value = autoHypenPhone( this.value );  
		}
	});
</script>	
</html>