<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>컴퓨터 정보 목록</title>
	</head>
	<body>
		<c:import url="/WEB-INF/view/common/top.jsp"/>
		<div align="center">
			<c:if test="${laboratorys.no} == 0">
				<table border="1">
					<tr>
						<td>등록 일자</td>
						<td>IP 주소</td>
						<td>컴퓨터 이름</td>
					</tr>
				<c:forEach items="${computers}" var="computer" >
					<tr>
						<td>${computer.specRegDate}</td>
						<td>${computer.ipAddress}</td>
						<td><a href="/computer/${computer.no}/form">${computer.name}</a></td>
					</tr>
				</c:forEach>
				</table><br>
			</c:if>
		 </div>
	</body>
</html>