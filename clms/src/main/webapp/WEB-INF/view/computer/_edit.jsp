<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<script src="https://code.jquery.com/jquery-3.4.1.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
	<head>
		<meta charset="UTF-8">
		<title>컴퓨터 정보 수정</title>
	</head>
		<body>
			<c:import url="/WEB-INF/view/common/top.jsp"/>
				<div align="center">
					<form action="/computer/${computer.no}" method="post" id="computer_id">
						<input type="hidden" name="_method" value="put" />
						<input type="hidden" name="no" value="${computer.no}" />
						실습실 번호 : <input type="text" name="laboratoryNo" value="${computer.laboratoryNo}"><br>
						<div class="already" id="already"></div>
						이름 : <input type="text" name="name" value="${computer.name}"><br>
						<div class="already_name" id="already_name"></div>
						기준 등록 일자 : ${computer.specRegDate}<br>
						<input type="hidden" name="specRegDate" value="${computer.specRegDate}" />
						CPU : ${computer.cpu}<br>
						<input type="hidden" name="cpu" value="${computer.cpu}" />
						VGA : ${computer.vga}<br>
						<input type="hidden" name="vga" value="${computer.vga}" />
						RAM : ${computer.ram}<br>
						<input type="hidden" name="ram" value="${computer.ram}" />
						STORAGE : ${computer.storage}<br>
						<input type="hidden" name="storage" value="${computer.storage}" /><br>
						<div class="all" id="all"></div><br>
						<input type="button" id="edit_btn" name="edit_btn" value="수정">
						<button type="button" id="delete_btn">삭제</button>
						<a href="/computer"><button type="button" id="list_btn">목록</button></a>
					</form>
				</div>
		</body>
	
	<script>
	  	$("#delete_btn").click(function() {
	   	$('input[name=_method]').val('delete');
		$('#computer_id').submit();
	 	});
		
	    $("input[name=edit_btn]").click(function() {
	    	$('#computer_id').attr("action", "/computer");
			$('input[name=_method]').val('put');
	    	
	    	var laboratoryNo = $("input[name=laboratoryNo]").val();
	    	var name = $("input[name=name]").val();
	    	
	    	if (laboratoryNo == "" 
	    			&& name == ""){
	    		$("#all").text("모든 항목을 채워주세요.");
				$("#all").css("color", "red");
	    	} else if (laboratoryNo == ""){
				$("#all").text("실습실 번호를 입력 후 수정버튼을 눌러주세요.");
				$("#all").css("color", "red");
	    	} else if (name == ""){
	    		$("#all").text("컴퓨터 이름을 입력 후 수정버튼을 눌러주세요.");
				$("#all").css("color", "red");
	    	} else {
	    		$('#computer_id').submit();
	    	}
	    });
	</script>
</html>