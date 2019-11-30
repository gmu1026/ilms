<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/view/common/top.jsp" />

	<div id="wrap" class="sidebarred">
    	<div id="main">
	        <header>
	            <div class="container_16 clearfix">
	                <div class="clearfix"><!-- <a id="logo" href="sidebar_index.html"></a> --></div>
	                <div id="pagetitle" class="clearfix">
	                    <h1 class="left">실습실 수정</h1>
	                </div>
	            </div>
	        </header><div class="clear"></div>
        	
        	<div class="container_16 clearfix" id="actualbody">
				<div class="grid_16 widget first">
				    <div class="widget_title clearfix" style="padding-top: 3px;"></div>
	    			<div class="widget_body">
						<form action="/lab/${lab.no}" method="post" id="account_form">
						<input type="hidden" name="_method" value="delete"/>
							<table>
							    <tr>
							    	<td style="width: 5px;"></td>
							        <td width="15%"><label for="no">실습실 번호</label></td>
							        <td>
					                	${lab.no}
					                	<input type="hidden" name="no" value="${lab.no}" />
							        </td>
							    </tr>
							    <tr>
							    	<td></td>
							        <td><label for="managementDeptName">관리부서 명</label></td>
							        <td>
						                <input id="managementDeptName" name="managementDeptName" class="medium" type="text" value="${lab.managementDeptName}" />
						                <span class="infobar"></span>
							        </td>
							    </tr>
							    <tr>
							    	<td></td>
							        <td><label for="useDeptName">사용부서 명</label></td>
							        <td>
						                <input id="useDeptName" name="useDeptName" class="medium" type="text" value="${lab.useDeptName}">
						                <span class="infobar"></span>
							        </td>
							    </tr>
							    <tr>
							    	<td></td>
							        <td width="15%"><label for="usage">용도</label></td>
							        <td>
					                	<input id="usage" name="usage" class="medium" type="text" value="${lab.usage}" />
						                <span class="infobar"></span>
							        </td>
							    </tr>
							    <tr>
							    	<td></td>
							        <td width="15%"><label for="equipmentCount">컴퓨터 수량</label></td>
							        <td>
					                	<input id="equipmentCount" name="equipmentCount" class="medium" type="text" value="${lab.equipmentCount}" />
						                <span class="infobar"></span>
							        </td>
							    </tr>
							</table>
						</form>
						<div class="clear"></div>
	    			</div>
				</div>
	   			<div  style="margin-right: 20px;">
	   				<a id="btn_list" href="/lab" class="btn right medium"><span>목록</span></a>
	   				<a id="btn_delete" class="btn right medium"><span>삭제</span></a>
	   				<a id="btn_edit" class="btn right medium"><span>수정</span></a>
		   			</div>
			</div>
		</div>
	</div>
	
	<script>
		$(document).ready(function(){
		       $("#btn_edit").click(function() {
		           $('#account_form').attr("action", "/lab");
		           $('input[name=_method]').val('put');
		           $('#account_form').submit();
		       });
		       
		       $("#btn_delete").click(function() {
		           $('input[name=_method]').val('delete');
		           $('#account_form').submit();
		       });
		    });
		
		$("#btn_edit").click(function() {
			var no = $('#no').val();
			var equipmentCount = $('input[name=equipmentCount]').val();
			
			if(equipmentCount == "") {
				$("input[name=equipmentCount]").val("0");
				$("#account_form").submit();
			}
		})
    </script>

<c:import url="/WEB-INF/view/common/footer.jsp" />