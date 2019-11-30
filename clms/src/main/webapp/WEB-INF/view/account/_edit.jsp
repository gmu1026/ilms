<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"
	integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
	crossorigin="anonymous">
 </script>
</head>
<body>
	<c:import url="/WEB-INF/view/common/top.jsp" />
	<form id="form_data" action="/account/${account.id}" method="post">
		<input type="hidden" name="_method" /> 
		<input type="hidden" name="id" value="${account.id}" />
		<div class="form-main" align="center">
			<div class="form-id">
				<div id="check" class="check"></div>
			</div>

			<label>패스워드 : </label>
				<input type="password" name="password" /><br>
			<label>패스워드 확인: </label>
				<input type="password" name="rePassword" /><br>
			<label>이름 : </label>
				<input type="text" name="name" value="${account.name}" /><br> 
			<label>내선 번호 : </label>
				<input type="text" name="extensionNo" value="${account.extensionNo}" /><br>
			<label>권한 : </label> 
				<select name="authority">
					<c:if test="${account.authority eq 'M'}">
						<option value="M" selected="selected">사용자</option>
						<option value="A">관리자</option>
					</c:if>
					<c:if test="${account.authority eq 'A'}">
						<option value="A" selected="selected">관리자</option>
						<option value="M">사용자</option>
					</c:if>
				</select>
		</div>
		<div id="notice_area" align="center"></div>
		<div class="form-bottom" align="right">
			<input type="submit" id="edit_btn" value="수정" class="btn btn-info" /> 
			<input type="submit" id="delete_btn" value="삭제" class="btn btn-info" />
			<button type="button" onclick="location.href='/account'" class="btn btn-info" >목록</button>
		</div>
	</form>
</body>
<script>
	var password = $('input[name=password]').val();
	var rePassword = $('input[name=rePassword]').val();
	var extensionNo = $('input[name=extensionNo]').val();
	var name = $('input[name=name]').val();
	var pattern_num = /^[0-9]+$/;
	
	$(document).ready(function() {
    	$("#edit_btn").click(function() {
    		if (password != rePassword) {
    			$("#notice_area").text("비밀번호가 일치하지 않습니다.");
    			$("#notice_area").css("color", "red");
    		} else if (!pattern_num.test(extensionNo)) {
    			$("#notice_area").text("내선 번호는 숫자만 입력 가능합니다.");
    			$("#notice_area").css("color", "red");
    		} else {
	    		$('#form_data').attr("action", "/account");
	    		$('input[name=_method]').val('put');
	    		$('#form_data').submit();
    		}
    	});
    	
    	$("#delete_btn").click(function() {
    		$('input[name=_method]').val('delete');
    		$('#form_data').submit();
    	});
	});
</script>
</html>