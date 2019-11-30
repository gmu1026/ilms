<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CLMS</title>
</head>
<body>
	<c:import url="/WEB-INF/view/common/top.jsp" />
	구분 : <select id="division">
			<option value="all">전체
			<option value="free">무료
			<option value="free">유료
		 </select> 
	<br/>
	<br/>
	<table border="1">
		<tr>
			<td>번호</td>
			<td>SW 이름</td>
			<td>구분</td>
			<td>SW 시리얼 넘버</td>
			<td>SW 용도</td>
			<td>SW 사용 부서</td>
		</tr>
		
		<c:forEach items="${softwares}" var="software">		
			<tr>
				<td>${software.no}</td>
				<td><a href='/sw/${software.no}/form'>${software.name}</a></td>
				<c:if test="${software.division eq 'F'}">
					<td><c:out value="무료"></c:out></td>				
				</c:if>
				<c:if test="${software.division eq 'P'}">
					<td><c:out value="유료"></c:out></td>				
				</c:if>
				<td>${software.serialNumber}</td>
				<td>${software.usage}</td>
				<td>${software.useDept}</td>
			</tr>
		</c:forEach>
	</table>
	
	<div align="right">
        <button type="button" onclick="location.href='/sw/form'">등록</button>
    </div>
    
    <script>
    	function draw() {
    		var divisionStatus = ${'#division'}.val();
    		$.ajax({
    			url : "/sw",
    			type : "get",
    			header : {
    				"Content-Type" : "application/json;charsest=UTF-8"
    			},
    			data : {
    				division : $("#division").val()
    			}, 
    			dataType : "json",
    			success : function(data) {
    				var table = "";
    				
    				table += "<table border='1'>";
    				table += "<tr>";
    				table += "<td>번호</td>";
    				table += "<td>SW 이름</td>";
    				table += "<td>구분</td>";
    				table += "<td>SW 시리얼 넘버</td>";
    				table += "<td>SW 용도</td>";
    				table += "<td>SW 사용 부서</td>";
    				table += "</tr>";
    				
    				for(var i = 0l i < data.length; i++) {
    					var division = data[i].division == "F" : "무료" : "유료";
    					
        				table += "<tr>";
        				table += "<td>" + data[i].no + "</td>";
        				table += "<td>" + data[i].swNo + "</td>";
        				table += "<td>" + data[i].division + "</td>";
        				table += "<td>" + data[i].serialNumber + "</td>";
        				table += "<td>" + data[i].usage + "</td>";
        				table += "<td>" + data[i].useDept + "</td>";
        				table += "</tr>";
    				}
    				table += "</table>";
    				
    				document.getElementById("table").innerHTML = tablr;
    			},
    			error.function (request, status, error) {
    				alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error" + error);
    			}
    		});
    	};
    </script>
</body>
</html>