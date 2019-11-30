<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SW 등록</title>
</head>
<meta charset="UTF-8">
<title>SW 등록</title>
<script
  src="https://code.jquery.com/jquery-3.4.1.min.js"
  integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
  crossorigin="anonymous"></script>
</head>
<body>
	<c:import url="/WEB-INF/view/common/top.jsp"/>
	<div class="from-group" align="center">
		<form action="/sw" method="post" id="add_form">
			SW 이름 : <input type="text" name="name"><br/>
			구분 : <select name="division">
					<option value="">선택
					<option value="F" >무료
					<option value="P" >유료
				 </select><br/>
			SW 사용 부서 명 : <input type="text" name="useDept" id="sw_useDept"><br/>
			SW 용도 : <input type="text" name="usage" id="sw_usage"><br/>
			SW 시리얼 넘버 : <input type="text" name="serialNumber" id="sw_serialNnumber"><br/>
			<br/>
			<div id="notice_area" align="center"></div>
			<br/>
			<div align="right">
				<input type="button" id="btn_add"  value="등록"/>
		        <button type="button" onclick="location.href='/sw'">목록</button>
		    </div>
		</form><br/>
	</div>
</body>
<script>
	$("#btn_add").click(function() {
		var sw_name = $('input[name=name]').val();
		var sw_division = $('select[name=division]').val();
		var sw_useDept = $('input[name=useDept]').val();
		var sw_usage = $('input[name=usage]').val();
		if ( sw_name == '') {
			$('#swName_notice_area').text('SW 프로그램 이름을 입력해주세요.');
			$("#swName_notice_area").css("color", "red");
		} else if ( sw_division == '') {
			$('#division_notice_area').text('SW 프로그램 구분을 선택해주세요.');
			$("#division_notice_area").css("color", "red");
		} else if ( sw_useDept == '') {
			$('#useDept_notice_area').text('SW 프로그램 사용 부서를 입력해주세요.');
			$("#useDept_notice_area").css("color", "red");
		} else if ( sw_usage == '') {
			$('#usage_notice_area').text('SW 프로그램 용도를 입력해주세요.');
			$("#usage_notice_area").css("color", "red");
		} else if ( sw_usage == '') {
			$('#serialNumber_notice_area').text('SW 시리얼 넘버를 입력해주세요.');
			$("#serialNumber_notice_area").css("color", "red");
		} else {
			$('#add_form').submit();
		}
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