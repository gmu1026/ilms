<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<script src="https://code.jquery.com/jquery-3.4.1.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
<head>
	<meta charset="UTF-8">
	<title>변동 알림 수정</title>
</head>

<body>
	<c:import url="/WEB-INF/view/common/top.jsp"/>
	<div align="center">
		<form id="form" action="/changenotice" method="post">
			<input type="hidden" name="_method"/>
			<input type="hidden" name="no" value="${changenotice.no}"/>알림 종류 : 
			<c:if test="${changenotice.division eq 'C'}">Computer</c:if>
			<c:if test="${changenotice.division eq 'L'}">Software License</c:if><br>
			등록 일자 : ${changenotice.registeredDate}<br>
			대상 이름 : 대상 테이블 이름 가져오기<br>
			내용 : ${changenotice.contents}<br>
			비고 : <input type="text" name="note" value="${changenotice.note}"><br>
			확인 여부 : <select name="checked">
					    <option selected="selected" value="Y">확인</option>
					    <option value="N">미확인</option>
					</select><br>
			<button type="button" id="btn_edit">수정</button>
		</form>
		<a href="/changenotice"><button type="button" id="btn_list">목록</button></a>
	</div>
</body>
<script>
	$(document).ready(function(){
	       $("#btn_edit").click(function() {
	           $('input[name=_method]').val('put');
	           $('#form').submit();
	       });
	});
</script>
</html>