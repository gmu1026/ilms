<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CLMS</title>
</head>
	<c:import url="/WEB-INF/view/common/top.jsp" />
	<table border="1">
		<tr>
			<td>번호</td>
			<td>SW 이름</td>
			<td>SW 계약 일자</td>
			<td>SW 만료 일자</td>
		</tr>
			
		<c:forEach items="${swLicenses}" var="swLicense">
			<tr>
				<td>${swLicense.no}</td>
				<td><a href="/swlicense/${swLicense.no}/form">${swLicense.swNo}</a></td>
				<td>${swLicense.contractDate}</td>
				<td>${swLicense.expiryDate}</td>
			</tr>
		</c:forEach>
	</table>
	
	<div align="right">
		<button type="button" onclick="location.href='/swlicense/form'">등록</button>
		<button type="button" >엑셀 다운로드</button>
	</div>
</body>
</html>