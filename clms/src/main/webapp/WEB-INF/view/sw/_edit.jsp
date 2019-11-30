<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SW 수정</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"
	integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
	crossorigin="anonymous">
 </script>
</head>
<body>
	<c:import url="/WEB-INF/view/common/top.jsp" />
	<div class="from-group" align="center">
		<form action="${pageContext.request.contextPath}/sw/${sw.no}" method="post" id="change_form">
			<input type="hidden" name="_method" />
			<input type="hidden" name="no" value="${sw.no}" />
			SW 이름 : <input type="text" name="name" value="${sw.name}" ><br/>
			구분 : <select name="division">
					<option value="" >전체
					<c:if test="${sw.division eq 'F'}">
						<option value="F" selected="selected" >무료
						<option value="P" >유료
					</c:if>
					<c:if test="${sw.division eq 'P'}">
						<option value="F" >무료
						<option value="P" selected="selected" >유료
					</c:if>
				 </select><br/>
			SW 사용 부서 명 : <input type="text" name="useDept" value="${sw.useDept}" id="sw_useDept"><br/>
			SW 용도 : <input type="text" name="usage" value="${sw.usage}" id="sw_usage"><br/>
			SW 시리얼 넘버 : <input type="text" name="serialNumber" value="${sw.serialNumber}"><br/>
			<br/>
			<div id="notice_area" align="center"></div>
			<br/>
			<div align="right">
		        <button type="button" id="btn_edit">수정</button>
		        <button type="button" id="btn_delete">삭제</button>
		        <button type="button" id="btn_list">목록</button>
		    </div>
		</form>
	</div>
</body>
<script>
	$(document).ready(function() {
		$("#btn_delete").click(function() {	// 액션 속성 바꾸기
			$('input[name=_method]').val('delete'); //메소드명 바꿔주기
			$('#change_form').submit(); // 폼 전송
		});
		
		$("#btn_edit").click(function() {
			var sw_name = $('input[name=name]').val();
			var sw_division = $('select[name=division]').val();
			var sw_useDept = $('input[name=useDept]').val();
			var sw_usage = $('input[name=usage]').val();
			/* if (sw_name == null && sw_name == '') { */
			if ( sw_name == '') {
				$('#notice_area').text('SW 프로그램 이름을 입력해주세요.');
				$("#notice_area").css("color", "red");
			} else if ( sw_division == '') {
				$('#notice_area').text('SW 프로그램 구분을 선택해주세요.');
				$("#notice_area").css("color", "red");
			} else if ( sw_useDept == '') {
				$('#notice_area').text('SW 프로그램 사용 부서를 입력해주세요.');
				$("#notice_area").css("color", "red");
			} else if ( sw_usage == '') {
				$('#notice_area').text('SW 프로그램 용도를 입력해주세요.');
				$("#notice_area").css("color", "red");
			} else {
				$('#change_form').attr("action", "/sw"); 	// 액션 속성 바꾸기
				$('input[name=_method]').val('put'); //메소드명 바꿔주기
				$('#change_form').submit(); // 폼 전송
			}
		});
		
		$("#btn_list").click(function() {
			$('#change_form').attr("action", "/sw");
			$('input[name=_method]').val('get');
			$('#change_form').submit();
		});
	});
	
	$("#sw_useDept").bind("keyup",function(){
	    re = /[~!@\#$%^&*\()\-=+_']/gi;
	    var temp=jQuery("#sw_useDept").val();
	    if(re.test(temp)){
	        jQuery("#sw_useDept").val(temp.replace(re,""));
	    }
	});
	
	$("#sw_usage").bind("keyup",function(){
	    re = /[~!@\#$%^&*\()\-=+_']/gi;
	    var temp=jQuery("#sw_usage").val();
	    if(re.test(temp)){
	        jQuery("#sw_usage").val(temp.replace(re,""));
	    }
	});
</script>
</html>