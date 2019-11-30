<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/view/common/top.jsp" />

	<link id='sfluid' class="sswitch" rel="stylesheet" type="text/css" href="/css/datepicker/default/jquery.ui.all.css" />
	<script type="text/javascript" src="/js/datepicker/jquery.ui.core.js"></script>
	<script type="text/javascript" src="/js/datepicker/jquery.ui.widget.js"></script>
	<script type="text/javascript" src="/js/datepicker/jquery.ui.datepicker.js"></script>
	<script src="/javascript/ui/i18n/jquery.ui.datepicker-ko.js"></script>

	<div id="wrap" class="sidebarred">
    	<div id="main">
	        <header>
	            <div class="container_16 clearfix">
	                <div class="clearfix"><!-- <a id="logo" href="sidebar_index.html"></a> --></div>
	                <div id="pagetitle" class="clearfix">
	                    <h1 class="left">SW 라이선스 수정</h1>
	                </div>
	            </div>
	        </header><div class="clear"></div>
        	
        	<div class="container_16 clearfix" id="actualbody">
				<div class="grid_16 widget first">
				    <div class="widget_title clearfix" style="padding-top: 3px;"></div>
	    			<div class="widget_body">
						<form id="edit_form" method="post" action="${pageContext.request.contextPath}/swlicense">
							<input type="hidden" name="_method" />
							<input type="hidden" name="no" value="${swLicense.no}" /> 
							<table>
							    <tr>
							        <td style="width: 5px;"></td>
							        <td width="15%"><label for="required_field">소프트웨어 이름</label></td>
							        <td>
					                	<input type="text" name="swName"  value="${swLicense.swName}"/><br/>
							        </td>
							    </tr>
							    <tr>
							        <td></td>
							        <td><label for="integer">사용 실습실</label></td>
							        <td>
										<input type="text" name="useLabNo"  value="${swLicense.useLabNo}" id="useLabNo"/><br/>
							        </td>
							    </tr>
							    <tr>
							        <td></td>
							        <td><label for="confirmation">계약 일자</label></td>
							        <td>
						                <input type="text" class="datepicker" id="contractDate" name="contractDate"  value="${swLicense.contractDate}"/>
							        </td>
							    </tr>
							    <tr>
							        <td></td>
							        <td><label for="confirmation">만료 일자</label></td>
							        <td>
						                <input type="text" class="datepicker" id="expiryDate" name="expiryDate"  value="${swLicense.expiryDate}"/><br/>
							        </td>
							    </tr>
							    <tr>
							        <td></td>
							        <td><label for="confirmation">인증 코드</label></td>
							        <td>
						                <input type="text" name="authenticationCode"  value="${swLicense.authenticationCode}" id="authenticationCode"/><br/>
							        </td>
							    </tr>
							    <tr>
							        <td></td>
							        <td><label for="confirmation">카피 수</label></td>
							        <td>
						                <input type="text" name="copies"  value="${swLicense.copies}" id="copies"/>	<br/>
							        </td>
							    </tr>
							    <tr>
							        <td></td>
							        <td><label for="confirmation">계약 담당 부서 명</label></td>
							        <td>
						                <input type="text" name="contractDept"  value="${swLicense.contractDept}" id="contractDept"/><br/>
							        </td>
							    </tr>
							    <tr>
							        <td></td>
							        <td><label for="confirmation">계약 담당자 명</label></td>
							        <td>
						                <input type="text" name="contractName"  value="${swLicense.contractName}" id="contractName"/>
							        </td>
							    </tr>
							    <tr>
							        <td></td>
							        <td><label for="confirmation">계약 담당자 전화 번호</label></td>
							        <td>
						                <input type="text" name="contractPhone"  value="${swLicense.contractPhone}" id="contractPhone"/><br/>
							        </td>
							    </tr>
							    <tr>
							        <td></td>
							        <td><label for="confirmation">공급 업체 명</label></td>
							        <td>
						                <input type="text" name="supplierName"  value="${swLicense.supplierName}" id="supplierName"/><br/>
							        </td>
							    </tr>
							    <tr>
							        <td></td>
							        <td><label for="confirmation">공급 업체 담당자 명</label></td>
							        <td>
						                <input type="text" name="supplierContactName"  value="${swLicense.supplierContactName}" id="supplierContactName"/>
							        </td>
							    </tr>
							    <tr>
							        <td></td>
							        <td><label for="confirmation">공급 업체 담당자 전화번호</label></td>
							        <td>
						                <input type="text" name="supplierContactPhone"  value="${swLicense.supplierContactPhone}" id="supplierContactPhone"/><br/>
							        </td>
							    </tr>
							    <tr>
							        <td></td>
							        <td><label for="confirmation">비고</label></td>
							        <td>
						                <textarea name="note" style="width:20%">${swLicense.note}</textarea>
							        </td>
							    </tr>
							    <tr>
							    	<td></td>
							    	<td></td>
							        <td>
						               	<div class="notice_area" id="notice_area"></div><br>
							        </td>
							    </tr>
							</table>
						</form>
						<div class="clear"></div>
	    			</div>
				</div>
				<br/>
	   			<div  style="margin-right: 20px;">
	   				<div class="notice_area" id="notice_area"></div>
	   				<a id="btn_list" class="btn right medium" onclick="location.href='${pageContext.request.contextPath}/swlicense'"><span>목록</span></a>
	   				<a id="btn_delete" class="btn right medium"><span>삭제</span></a>
	   				<a id="btn_edit" class="btn right medium"><span>수정</span></a>
	   			</div>
			</div>
		</div>
	</div>

	<script>
		$(document).ready(function() {
			$("#btn_delete").click(function() {	
				$('input[name=_method]').val('delete');
				$('#edit_form').submit();
			});
			
			$("#btn_edit").click(function() {
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
				var sw_supplierContactPhone = $('input[name=supplierContactPhone]').val();
				var inputNumber = /[0-9]/;
				var inputPatern= /[~!@#$%^&*()_+|<>?:{}]/;
				var blank_pattern = /^\s+|\s+$/g;
				var contractDept = document.getElementById('contractDept');
				var contractName = document.getElementById('contractName');
				var supplierName = document.getElementById('supplierName');
				var supplierContactName = document.getElementById('supplierContactName');
				
				if (sw_name == '') {
					$('#notice_area').text('SW 프로그램 이름을 입력해주세요');
					$("#notice_area").css("color", "red");
				} else if (sw_useLabNo == '') {
					$('#notice_area').text('사용 실습실을 입력해주세요');
					$("#notice_area").css("color", "red");
				} else if (sw_contractDate == '') {
					$('#notice_area').text('계약 일자를 입력해주세요');
					$("#notice_area").css("color", "red");
				} else if (sw_expiryDate == '') {
					$('#notice_area').text('만료 일자를 입력해주세요');
					$("#notice_area").css("color", "red");
				} else if (sw_authenticationCode == '') {
					$('#notice_area').text('인증코드를 입력해주세요');
					$("#notice_area").css("color", "red");
				} else if (sw_copies == '') {
					$('#notice_area').text('카피 수를 입력해주세요');
					$("#notice_area").css("color", "red");
			 	} else if (sw_contractDept == '' || contractDept.value.replace( blank_pattern, '' ) == "") {
					$('#notice_area').text('계약 담당자 부서를 입력해주세요');
					$("#notice_area").css("color", "red"); 
				} else if (sw_contractName == ''|| contractName.value.replace( blank_pattern, '' ) == "") {
					$('#notice_area').text('계약 담당자 명을 입력해주세요');
					$("#notice_area").css("color", "red");
				} else if (sw_contractPhone == '') {
					$('#notice_area').text('계약 담당자 전화번호를 입력해주세요');
					$("#notice_area").css("color", "red");
				} else if (sw_supplierName == ''|| supplierName.value.replace( blank_pattern, '' ) == "") {
					$('#notice_area').text('공급 업체명을 입력해주세요');
					$("#notice_area").css("color", "red");
				} else if (sw_supplierContactName == ''|| supplierContactName.value.replace( blank_pattern, '' ) == "") {
					$('#notice_area').text('공급 업체 담당자 명을 입력해주세요');
					$("#notice_area").css("color", "red");
				} else if (sw_supplierContactPhone == '') {
					$('#notice_area').text('공급 업체 담당자 전화번호를 입력해주세요');
					$("#notice_area").css("color", "red");
				} else if (inputNumber.test(sw_contractDept) || inputPatern.test(sw_contractDept)) {
					$("#notice_area").text("계약 담당자 부서 명은 한글과 영문만 입력 가능합니다");
					$("#notice_area").css("color", "red");
				} else {
					$('#edit_form').attr("action", "/swlicense");
					$('input[name=_method]').val('put'); 
					$('#edit_form').submit(); 
				}
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
				this.value = autoHypenPhone( this.value );  
			}
			
			supplierContactPhone.onkeyup = function(){
				this.value = autoHypenPhone( this.value );  
			}
			
			$(function() {
		    	var baseOption = {
		            dateFormat: "yyyy-mm-dd"
		         /* ,altField: "#baseDate" */
		            ,altFormat: "yyyy-mm-dd"
		        };
		    	$("#contractDate").datepicker(baseOption, $.datepicker.regional["ko"]);

		        $("#expiryDate").datepicker(baseOption, $.datepicker.regional["ko"]);
		    });
		});
	</script>

<c:import url="/WEB-INF/view/common/footer.jsp" />
