<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	<c:import url="/WEB-INF/view/common/top.jsp" />
	<div id="wrap" class="sidebarred">
    	<div id="main">
	        <header>
	            <div class="container_16 clearfix">
	                <div class="clearfix"><!-- <a id="logo" href="sidebar_index.html"></a> --></div>
	                <div id="pagetitle" class="clearfix">
	                    <h1 class="left">사용자 수정</h1>
	                </div>
	            </div>
	        </header><div class="clear"></div>
        	
        	<div class="container_16 clearfix" id="actualbody">
				<div class="grid_16 widget first">
				    <div class="widget_title clearfix" style="padding-top: 3px;"></div>
	    			<div class="widget_body">
						<form id="form_account" name="validation" method="post" action="${pageContext.request.contextPath}/account" >
							<input type="hidden" name="_method" />
							<input type="hidden" name="id" value="${account.id}" /> 
							<table>
							    <tr>
							    	<td style="width: 5px;"></td>
							        <td><label for="confirmation">비밀번호</label></td>
							        <td>
						                <input id="password" name="password" class="medium" type="password">
							        </td>
							    </tr>
							     <tr>
							     	<td></td>
					                <td><label for="Confirm Password">비밀번호 확인</label></td>
					                <td><input id="rePassword"name="rePassword" type="password" class="medium"/></td>
					            </tr>
					            <tr>
					            	<td></td>
							        <td width="15%"><label for="required_field">이름</label></td>
							        <td>
					                	<input id="name" name="name" class="medium" type="text" value="${account.name}"/>
							        </td>
							    </tr>
							    <tr>
							        <td></td>
							        <td><label for="integer">내선번호</label></td>
							        <td>
						                <input id="text" name="extensionNo" class="medium" maxlength="4" type="text" value="${account.extensionNo}"/>
							        </td>
							    </tr>
							    <tr>
								    <td></td>
								    <td><label for="confirmation">권한</label></td>
							    	<td class="medium">
							    		<select name="authority" style="width:34%;">
						                    <option value="A" <c:if test="${account.authority eq 'A'}">selected="selected"</c:if>>관리자</option>
						                    <option value="M" <c:if test="${account.authority eq 'M'}">selected="selected"</c:if>>사용자</option>
	                					</select>
	               					</td>
							    </tr>
							    <tr>
							    	<td></td>
							    	<td></td>
							    	<td><div id="notice_area"></div></td>
							    </tr>
							</table>
						</form>
						<div class="clear"></div>
	    			</div>
				</div>
	   			<div  style="margin-right: 20px;">
	   				<a id="btn_list" class="btn right medium" href="${pageContext.request.contextPath}/account"><span>목록</span></a>
	   				<a id="btn_del" class="btn right medium"><span>삭제</span></a>
	   				<a id="btn_edit" class="btn right medium"><span>수정</span></a>
	   			</div>
			</div>
		</div>
	</div>
<script>
	$(document).ready(function() {
    	$("#btn_edit").click(function() {
    		var password = $('input[name=password]').val();
    		var rePassword = $('input[name=rePassword]').val();
    		var extensionNo = $('input[name=extensionNo]').val();
    		var name = $('input[name=name]').val();
    		var pattern_num = /^[0-9]+$/;
    		
    		if (name == '') {
    			$("#notice_area").text("이름을 입력해주세요.");
    			$("#notice_area").css("color", "red");
    		} else if (password != rePassword) {
    			$("#notice_area").text("비밀번호가 일치하지 않습니다.");
    			$("#notice_area").css("color", "red");
    		} else if(extensionNo == '') {
    			$("#notice_area").text("내선 번호를 입력해주세요.");
    			$("#notice_area").css("color", "red");
    		} else if (!pattern_num.test(extensionNo)) {
    			$("#notice_area").text("내선 번호는 숫자만 입력 가능합니다.");
    			$("#notice_area").css("color", "red");
    		} else {
	    		$('input[name=_method]').val('put');
	    		$('#form_account').submit();
    		}
    	});
    	
    	$("#btn_del").click(function() {
    		$('input[name=_method]').val('delete');
    		$('#form_account').submit();
    	});
	});
</script>
</html>