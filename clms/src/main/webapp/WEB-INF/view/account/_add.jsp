<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
  src="https://code.jquery.com/jquery-3.4.1.min.js"
  integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
  crossorigin="anonymous"></script>
</head>
<body>
	<c:import url="/WEB-INF/view/common/top.jsp" />
	<!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- Page Heading -->
          <h1 class="h3 mb-2 text-gray-800">사용자 등록</h1>
          <p class="mb-4">사용자를 등록합니다.</p>

          <div class="card shadow mb-4">
            
            
            <div class="card-body">
	<form action="${pageContext.request.contextPath}/account" method="post" id="account_form">
		<div class="form-main" align="center">
			<input type="hidden" name="isChecking" value="false"/>
			<div class="form-id">
				<label>아이디 : </label><input type="text" id="input_id" name="id" placeholder="아이디" onchange="reCheck()" onkeydown="fn_press_han(this);" style="ime-mode:disabled;" />
				<input type="button" id="check_id"  value="중복 확인" class="btn btn-info"/>
			</div>
		
			<div class="form-id">
				<label>패스워드 : </label><input type="password" name="password" placeholder="패스워드" />
			</div>
			<div class="form-id">
				<label>패스워드 확인: </label><input type="password" name="rePassword" placeholder="패스워드 확인" />
			</div>
			<div class="form-id">
				<label>이름 : </label><input type="text" name="name" placeholder="이름"/>
			</div>
			<div class="form-id">
				<label>내선 번호 : </label><input type="text" name="extensionNo" placeholder="내선 번호" />
			</div>
			<div class="form-id">
				<label>권한 : </label>
				<select name="authority">
					<option value="M">사용자</option>
					<option value="A">관리자</option>
				</select>
			</div>
		</div>
		<br>
		<div id="notice_area" align="center"></div>
		
		<div class="form-bottom" align="right">
			<input type="button" name="add_btn" value="등록" class="btn btn-info" />
			<button type="button" onclick="location.href='/account'" class="btn btn-info">목록</button>
		</div>
	</form>
	</div>
	</div>
	</div>
	
</body>
<script>
	function getTextLength(str) {
	    var len = 0;
	    for (var i = 0; i < str.length; i++) {
	        if (escape(str.charAt(i)).length == 6) {
	            len++;
	        }
	        len++;
	    }
	    return len;
	}

	$("#check_id").click(function() {
		var user_id = $('#input_id').val();
		var pattern_kr = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
		var pattern_spc = /[~!@#$%^&*()_+|<>?:{}]/;
		var pattern_blank = /^\s+|\s+$/g;
		
		if (user_id == null || user_id == '') {
			$('#notice_area').text('아이디를 입력해주세요.');
			$("#notice_area").css("color", "red");
		} else if (getTextLength(user_id) < 4) {
			$('#notice_area').text('아이디의 길이는 4자리 이상입니다.');
			$("#notice_area").css("color", "red");
		} else if (pattern_kr.test(user_id) || pattern_spc.test(user_id) || pattern_blank.test(user_id)) {
			$("#notice_area").text("아이디는 영문과 숫자만 가능합니다.");
			$("#notice_area").css("color", "red");
		} else {
			$.ajax({
				url : '${pageContext.request.contextPath}/account/check?id='+ user_id,
				type : 'get',
				success : function(data) {
					if (data.duplication == 'true') {
						$("#notice_area").text("사용 중인 아이디입니다");
						$("#notice_area").css("color", "red");
					} else {
						$("#notice_area").text("사용 가능한 아이디입니다.");
						$("input[name=isChecking]").val("true");
						$("#notice_area").css("color", "blue");
					}
				}
			});
		}
	});
	
	function reCheck() {
		var isCheck = $("input[name=isChecking]").val();
		if (isCheck == "true") {
			$("input[name=isChecking]").val("change");
		}
	};
	
	$("input[name=add_btn]").click(function() {
		var id = $("input[name=id]").val();
		var password = $("input[name=password]").val();
		var rePassword = $("input[name=rePassword]").val();
		var name = $("input[name=name]").val();
		var extensionNo = $("input[name=extensionNo]").val();
		var authority = $("select[name=authority]").val();
		var isCheck = $("input[name=isChecking]").val();
		var pattern_kr = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
		var pattern_spc = /[~!@#$%^&*()_+|<>?:{}]/;
		var pattern_blank = /^\s+|\s+$/g;
		var pattern_eng = /[a-zA-Z]/; 
		var pattern_num = /^[0-9]+$/;
		
		if (isCheck == "false") {
			$("#notice_area").text("중복 체크 후 등록해주세요.");
			$("#notice_area").css("color", "red");
		}  else if (isCheck == "change") {
			$("#notice_area").text("중복 체크를 다시 해주세요");
			$("#notice_area").css("color", "red");
		} else if (id == "" 
				|| password == "" 
				|| rePassword == ""
				|| name == ""
				|| extensionNo == ""
				|| authority == "" ) {
			$("#notice_area").text("항목을 모두 채워서 등록해주세요.");
			$("#notice_area").css("color", "red");
		} else if (password != rePassword) {
			$("#notice_area").text("비밀번호를 확인해주세요.");
			$("#notice_area").css("color", "red");
		} else if (getTextLength(password) < 4) {
			$("#notice_area").text("비밀번호는 최소 4자리 이상입니다.");
			$("#notice_area").css("color", "red");
		} else if (getTextLength(extensionNo) < 4) {
			$("#notice_area").text("내선 번호는 4자리로 입력해주세요.");
			$("#notice_area").css("color", "red");
		} else if (!pattern_num.test(extensionNo)) {
			$("#notice_area").text("내선 번호는 숫자만 입력 가능합니다.");
			$("#notice_area").css("color", "red");
		} else {
			$("#account_form").submit();
		} 
	});
</script>
</html>