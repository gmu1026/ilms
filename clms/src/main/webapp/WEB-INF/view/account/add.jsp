<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/view/common/top.jsp" />

	<div id="wrap" class="sidebarred">
    	<div id="main">
	        <header>
	            <div class="container_16 clearfix">
	                <div class="clearfix"><!-- <a id="logo" href="sidebar_index.html"></a> --></div>
	                <div id="pagetitle" class="clearfix">
	                    <h1 class="left">사용자 등록</h1>
	                </div>
	            </div>
	        </header><div class="clear"></div>
        	
        	<div class="container_16 clearfix" id="actualbody">
				<div class="grid_16 widget first">
				    <div class="widget_title clearfix" style="padding-top: 3px;"></div>
	    			<div class="widget_body">
						<form id="form_account" name="validation" method="post" action="${pageContext.request.contextPath}/account" >
							<input type="hidden" name="isChecking" value="false"/>
							<table>
							    <tr>
							        <td width="15%"><label for="required_field">아이디</label></td>
							        <td>
					                	<input id="id" name="id" class="medium" type="text" onchange="reCheck()" />
					                	<a id="btn_check" class="btn medium"><span>중복 확인</span></a>
					                	<div id="checkNotice" style="margin-top:3px;"></div>
							        </td>
							    
							    </tr>
							    <tr>
							        <td><label for="confirmation">비밀번호</label></td>
							        <td>
						                <input id="password" name="password" class="medium" type="password">
							        </td>
							    </tr>
							     <tr>
					                <td><label for="Confirm Password">비밀번호 확인</label></td>
					                <td><input name="rePassword" type="password" class="medium"/></td>
					            </tr>
					            <tr>
							        <td width="15%"><label for="required_field">이름</label></td>
							        <td>
					                	<input id="name" name="name" class="medium" type="text" />
							        </td>
							    </tr>
							    <tr>
							        <td><label for="integer">내선번호</label></td>
							        <td>
						                <input id="integer" name="extensionNo" class="medium" maxlength="4" type="text" />
							        </td>
							    </tr>
							    <tr>
								    <td><label for="confirmation">권한</label></td>
							    	<td class="medium">
							    		<select name="authority" style="width:34%;" >
						                    <option value="M" selected="selected">사용자</option>
						                    <option value="A">관리자</option>
	                					</select>
	               					</td>
							    </tr>
							    <tr>
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
	   				<a id="btn_add" class="btn right medium"><span>등록</span></a>
	   			</div>
			</div>
		</div>
	</div>
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
	
		$("#btn_check").click(function() {
			var user_id = $('#id').val();
			var pattern_kr = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
			var pattern_spc = /[~!@#$%^&*()_+|<>?:{}]/;
			var pattern_blank = /^\s+|\s+$/g;
			
			if (user_id == null || user_id == '') {
				$('#notice_area').text('');
				$('#checkNotice').text('아이디를 입력해주세요.');
				$("#notice_area").css("color", "red");
			} else if (getTextLength(user_id) < 4) {
				$("#checkNotice").text("");
				$('#notice_area').text('아이디의 길이는 4자리 이상입니다.');
				$("#notice_area").css("color", "red");
			} else if (pattern_kr.test(user_id) || pattern_spc.test(user_id) || pattern_blank.test(user_id)) {
				$("#checkNotice").text("");
				$("#notice_area").text("아이디는 영문과 숫자만 가능합니다.");
				$("#notice_area").css("color", "red");
			} else {
				$.ajax({
					url : '${pageContext.request.contextPath}/account/check?id='+ user_id,
					headers : {
			 			"Content-Type" : "application/json;charset=UTF-8"
				 	},
					type : 'get',
					dataType : "JSON" , 
					success : function(data) {
						$("#notice_area").text("");
						if (data.duplication == 'true') {
							$("#checkNotice").text("사용 중인 아이디입니다");
							$("#checkNotice").css("color", "red");
						} else {
							$("#checkNotice").text("중복 확인이 되었습니다.");
							$("input[name=isChecking]").val("true");
						}
					},
					error: function (request, status, error) {
				    	alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
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
		
		$("#btn_add").click(function() {
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
			
			$("#checkNotice").text("");
			
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
				$("#form_account").submit();
			} 
		});
	</script>
<c:import url="/WEB-INF/view/common/footer.jsp" />
