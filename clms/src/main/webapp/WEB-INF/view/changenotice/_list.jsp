<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	<head>
	<script src="https://code.jquery.com/jquery-3.4.1.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
		<meta charset="UTF-8">
		<title>변동 알림 목록</title>
	</head>
	
	<body>
		<c:import url="/WEB-INF/view/common/top.jsp"/>
		<div align="center">
				구분 : <select id="division">
						<option value="A">전체</option>
			   	 		<option value="C">컴퓨터</option>
			    		<option value="L">SW 라이선스</option>
			 		 </select>
			 		<button type="button" onclick="draw()">검색</button>
			 	<br><br>
		 	<div id="tables"></div>
	 	</div>
	</body>
	<script>
	
		function draw() {
			var divisionStatus = $("#division").val();
		 	$.ajax({
			    url : "/changenotice",
			    type : "get",
			    headers : {
		 			"Content-Type" : "application/json;charset=UTF-8"
		 		},
		 		data: {
			    	division : $("#division").val()
			    },
			    dataType : "json",
			    success: function(data) {
			    	var table = "";
			    	
			    	table += "<table border='1'>";
			    	table += "<tr>";
			    	table += "	<td>알림 종류</td>";
			    	table += "	<td>등록 일자</td>";
			    	table += "	<td>대상 이름</td>";
			    	table += "	<td>확인 여부</td>";
			    	table += "</tr>";
			    	
			    	for(var i = 0; i < data.length; i++){
			    		var division = data[i].division == "C" ? "컴퓨터" : "SW 라이선스";
				    	var checked = data[i].checked == "Y" ? "확인" : "미확인"; 
				    	
			    		table += "<tr>";
			    		table += "<td>" + division + "</td>";
				    	table += "<td>" + data[i].registeredDate + "</td>";
				    	table += "<td><a href='/changenotice/" + data[i].no + "/form'>" + data[i].name + "</a></td>";
				    	table += "<td>" + checked + "</td>";
			    		table += "</tr>";
			    	}
			    	table += "</table>";
			    		
			    	document.getElementById("tables").innerHTML = table;
			    },
			    error: function (request, status, error) {
			    	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			});
		};
	</script>
</html>