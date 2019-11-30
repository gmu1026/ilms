<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/view/common/top.jsp" />

	<div id="wrap" class="sidebarred">
    	<div id="main">
	        <header>
	            <div class="container_16 clearfix">
	                <div class="clearfix"><!-- <a id="logo" href="sidebar_index.html"></a> --></div>
	                <div id="pagetitle" class="clearfix">
	                    <h1 class="left">실습실 등록</h1>
	                </div>
	            </div>
	        </header><div class="clear"></div>
        	
        	<div class="container_16 clearfix" id="actualbody">
				<div class="grid_16 widget first">
				    <div class="widget_title clearfix" style="padding-top: 3px;"></div>
	    			<div class="widget_body">
						<form action="/lab" method="post" id="account_form">
							<input type="hidden" name="isChecking" value="false"/>
							<table>
							    <tr>
							    	<td style="width: 5px;"></td>
							        <td width="15%"><label for="required_field">실습실 번호</label></td>
							        <td>
							        	<input id="no" name="no" class="medium" type="text" onchange="reCheck()" />
					                	<button type="button" name="check_btn" id="check_btn">중복 확인</button>
					                	
					                	<div class="already" id="already"></div>
						                <span class="infobar"></span>
							        </td>
							    </tr>
							    <tr>
							    	<td></td>
							        <td><label for="managementDeptName">관리부서 명</label></td>
							        <td>
						                <input id="managementDeptName" name="managementDeptName" class="medium" type="text" />
						                <span class="infobar"></span>
							        </td>
							    </tr>
							    <tr>
							    	<td></td>
							        <td><label for="useDeptName">사용부서 명</label></td>
							        <td>
						                <input id="useDeptName" name="useDeptName" class="medium" type="text">
						                <span class="infobar"></span>
							        </td>
							    </tr>
							    <tr>
							    	<td></td>
							        <td><label for="usage">용도</label></td>
							        <td>
						                <input id="usage" name="usage" class="medium" type="text">
						                <span class="infobar"></span>
							        </td>
							    </tr>
							    <tr>
							    	<td></td>
							        <td><label for="equipmentCount">컴퓨터 수량</label></td>
							        <td>
						                <input id="equipmentCount" name="equipmentCount" class="medium" type="text">
						                <span class="infobar"></span>
							        </td>
							    </tr>
							    <tr>
							    	<td></td>
							    	<td></td>
							    	<td>
							    		<div class="allAlready" id="allAlready"></div>
							    	</td>
							    </tr>
							</table>
						</form>
						<div class="clear"></div>
	    			</div>
				</div>
	   			<div  style="margin-right: 20px;">
	   				<a id="btn_list" href="${pageContext.request.contextPath}/lab" class="btn right medium"><span>목록</span></a>
	   				<a id="btn_add" class="btn right medium"><span>등록</span></a>
	   				
	   			</div>
			</div>
		</div>
	</div>
		<script>
		$("#check_btn").click(function() {
			var no = $('#no').val();
				$.ajax({
					url : '${pageContext.request.contextPath}/lab/add/check?no='+ no,
					type : 'get',
					success : function(data) {
						if (data == 1) {
							$("#already").text("실습실 번호가 중복되었습니다");
							$("#already").css("color", "red");
						} else {
							$("#already").text("중복 확인이 되었습니다");
							$("input[name=isChecking]").val("true")
							$("#already").css("color", "black");
						}
					}
				});
		});
		
		function reCheck() {
			var isCheck = $("input[name=isChecking]").val();
			if (isCheck == "true") {
				$("input[name=isChecking]").val("change");
			}
		};
		
		$("#btn_add").click(function() {
			var no = $('#no').val();
			var equipmentCount = $("input[name=equipmentCount]").val();
			var managementDeptName = $("input[name=managementDeptName]").val();
			var isCheck = $("input[name=isChecking]").val();
			var useDeptName = $("input[name=useDeptName]").val();
			var usage = $("input[name=usage]").val();
			
			if (no == ""){
				$("#allAlready").text("실습실 번호를 입력해주세요");
				$("#allAlready").css("color", "red");
			} else if (isCheck == "false") {
				$("#allAlready").text("중복 확인을 해주세요");
				$("#allAlready").css("color", "red");
			} else if ( isCheck == "change"){
				$("#already").text("중복 확인을 다시 해주세요");
				$("#already").css("color", "red");
			} else if(equipmentCount != ""){
				$("#account_form").submit();
			} else if(equipmentCount == ""){
				$("input[name=equipmentCount]").val("0");
				$("#account_form").submit();
			}
		})
		</script>
		
<c:import url="/WEB-INF/view/common/footer.jsp" />
