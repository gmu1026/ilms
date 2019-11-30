<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="/WEB-INF/view/common/top.jsp" />
	<div id="wrap" class="sidebarred">
    	<div id="main">
	        <header>
	            <div class="container_16 clearfix">
	                <div class="clearfix"><!-- <a id="logo" href="sidebar_index.html"></a> --></div>
	                <div id="pagetitle" class="clearfix">
	                    <h1 class="left">변동 알림 수정</h1>
	                </div>
	            </div>
	        </header><div class="clear"></div>
        	<div class="container_16 clearfix" id="actualbody">
				<div class="grid_16 widget first">
				    <div class="widget_title clearfix" style="padding-top: 3px;"></div>
	    			<div class="widget_body">
						<form id="form" action="/changenotice" method="post">
							<input type="hidden" name="_method"/>
							<table>
							    <tr>
							    	<td style="width: 5px;"></td>
							        <td width="15%"><label for="changenotice.division">알림 종류</label></td>
							        <td>
							        	<input type="hidden" name="no" value="${changenotice.no}">
					                	<c:if test="${changenotice.division eq 'C'}">컴퓨터</c:if>
										<c:if test="${changenotice.division eq 'L'}">소프트웨어 라이선스</c:if><br>
							        </td>
							    </tr>
							    <tr>
							    	<td></td>
							        <td><label for="registeredDate">등록 일자</label></td>
							        <td>
						                ${changenotice.registeredDate}
						                <span class="infobar"></span>
							        </td>
							    </tr>
							    <tr>
							    	<td></td>
							        <td><label for="confirmation">대상 번호</label></td>
							        <td>
							        	<c:if test="${changenotice.computerNo > 0}">
						                	${changenotice.computerNo}
						                </c:if>
						                <c:if test="${changenotice.swLicenseNo > 0}">
						                	${changenotice.swLicenseNo}
						                </c:if>
						                <span class="infobar"></span>
							        </td>
							    </tr>
							    <tr>
							    	<td></td>
							        <td><label for="note">내용</label></td>
							        <td>
						                ${changenotice.contents}
						                <span class="infobar"></span>
							        </td>
							    </tr>
							    <tr>
							    	<td></td>
							        <td><label for="confirmation">비고</label></td>
							        <td>
						                <input id="note" name="note" class="medium" type="text" value="${changenotice.note}">
						                <span class="infobar"></span>
							        </td>
							    </tr>
							    <tr>
							    	<td></td>
							        <td><label for="confirmation">확인 여부</label></td>
							        <td>
							        	<select name="checked">
							        		<option value="Y" selected="selected">확인</option>
							        		<option value="N">미확인</option>
							        	</select>
							        </td>
							    </tr>
							</table>
						</form>
						<div class="clear"></div>
	    			</div>
				</div>
	   			<div  style="margin-right: 20px;">
	   				<a id="btn_list" href="/changenotice" class="btn right medium"><span>목록</span></a>
	   				<a id="btn_edit" class="btn right medium"><span>수정</span></a>
	   			</div>
			</div>
		</div>
	</div>
	
	<script>
		$(document).ready(function(){
		       $("#btn_edit").click(function() {
		           $('input[name=_method]').val('put');
		           $('#form').submit();
		       });
		});
	</script>