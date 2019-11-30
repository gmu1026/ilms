<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/view/common/top.jsp" />

	<div id="wrap" class="sidebarred">
    	<div id="main">
	        <header>
	            <div class="container_16 clearfix">
	                <div class="clearfix"><!-- <a id="logo" href="sidebar_index.html"></a> --></div>
	                <div id="pagetitle" class="clearfix">
	                    <h1 class="left">컴퓨터  수정</h1>
	                </div>
	            </div>
	        </header><div class="clear"></div>
        	
        	<div class="container_16 clearfix" id="actualbody">
				<div class="grid_16 widget first">
				    <div class="widget_title clearfix" style="padding-top: 3px;"></div>
	    			<div class="widget_body">
						<form action="/computer/${computer.no}" method="post" id="computer_id">
						<input type="hidden" name="_method" value="put" />
							<table>
							    <tr>
							    	<th style="width: 5px;">&nbsp;</th>
							        <td><label for="laboratoryNo">실습실 번호</label></td>
							        <td>
							        	<input type="hidden" name="no" value="${computer.no}" />
						                <input id="laboratoryNo" name="laboratoryNo" class="medium" type="text" value="${computer.laboratoryNo}" />
						                <span class="infobar"></span>
							        </td>
							    </tr>
							    <tr>
							   	 	<td></td>
							        <td><label for="name">컴퓨터 이름</label></td>
							        <td>
						                <input id="name" name="name" class="medium" type="text" value="${computer.name}">
						                <span class="infobar"></span>
							        </td>
							    </tr>
							    <tr>
							   	 	<td></td>
							        <td><label for="ipAddress">컴퓨터 IP</label></td>
							        <td>
						                ${computer.ipAddress}
						                <span class="infobar"></span>
							        </td>
							    </tr>
							    <tr>
							    	<td></td>
							        <td><label for="specRegDate">기준 등록 일자</label></td>
							        <td>
							        	<input type="hidden" name="specRegDate" value="${computer.specRegDate}" />
						                ${computer.specRegDate}
							        </td>
							    </tr>
							    <tr>
							    	<td></td>
							        <td><label for="cpu">CPU</label></td>
							        <td>
							        	<input type="hidden" name="cpu" value="${computer.cpu}" />
						                ${computer.cpu}
							        </td>
							    </tr>
							    <tr>
							    	<td></td>
							        <td><label for="vga">VGA</label></td>
							        <td>
							        	<input type="hidden" name="vga" value="${computer.vga}" />
						                ${computer.vga}
							        </td>
							    </tr>
							    <tr>
							    	<td></td>
							        <td><label for="ram">RAM</label></td>
							        <td>
							        	<input type="hidden" name="ram" value="${computer.ram}" />
						                ${computer.ram}
							        </td>
							    </tr>
							    <tr>
							    	<td></td>
							        <td><label for="storage">STORAGE</label></td>
							        <td>
							        	<input type="hidden" name="storage" value="${computer.storage}" />
						                ${computer.storage}
							        </td>
							    </tr>
							    <tr>
							    	<td></td>
							    	<td></td>
							    	<td>
							    		<div class="all" id="all"></div><br>
							    	</td>
							    </tr>
							</table>
						</form>
						<div class="clear"></div>
	    			</div>
				</div>
	   			<div  style="margin-right: 20px;">
	   				<a id="btn_list" href="/computer" class="btn right medium"><span>목록</span></a>
	   				<a id="btn_delete" class="btn right medium"><span>삭제</span></a>
	   				<a id="btn_edit" class="btn right medium"><span>수정</span></a>
	   			</div>
			</div>
		</div>
	</div>
		
	<script>
	  	$("#btn_delete").click(function() {
	   	$('input[name=_method]').val('delete');
		$('#computer_id').submit();
	 	});
		
	    $("#btn_edit").click(function() {
	    	$('#computer_id').attr("action", "/computer");
			$('input[name=_method]').val('put');
	    	
	    	var laboratoryNo = $("input[name=laboratoryNo]").val();
	    	var name = $("input[name=name]").val();
	    	
	    	if (laboratoryNo == ""){
				$("#all").text("실습실 번호를 입력해주세요");
				$("#all").css("color", "red");
	    	} else if (name == ""){
	    		$("#all").text("컴퓨터 이름을 입력해주세요");
				$("#all").css("color", "red");
	    	} else {
	    		$('#computer_id').submit();
	    	}
	    });
	</script>
		
<c:import url="/WEB-INF/view/common/footer.jsp" />
