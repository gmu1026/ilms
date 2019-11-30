<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/view/common/top.jsp" />

	<div id="wrap" class="sidebarred">
    	<div id="main">
	        <header>
	            <div class="container_16 clearfix">
	                <div class="clearfix"><!-- <a id="logo" href="sidebar_index.html"></a> --></div>
	                <div id="pagetitle" class="clearfix">
	                    <h1 class="left">소프트웨어 수정</h1>
	                </div>
	            </div>
	        </header><div class="clear"></div>
        	
        	<div class="container_16 clearfix" id="actualbody">
				<div class="grid_16 widget first">
				    <div class="widget_title clearfix" style="padding-top: 3px;"></div>
	    			<div class="widget_body">
						<form id="change_form" method="post" action="${pageContext.request.contextPath}/sw/${sw.no}">
							<input type="hidden" name="_method" />
							<input type="hidden" name="no" value="${sw.no}" />
							<table>
							    <tr>
							        <td style="width: 5px;"></td>
							        <td width="15%"><label for="required_field">구분</label></td>
							         <td>
						                <select name="division" style="width:21.1%">
											<option value="" >전체
											<c:if test="${sw.division eq 'F'}">
												<option value="F" selected="selected" >무료
												<option value="P" >유료
											</c:if>
											<c:if test="${sw.division eq 'P'}">
												<option value="F" >무료
												<option value="P" selected="selected" >유료
											</c:if>
										 </select><br/>
							        </td>
							    </tr>
							    <tr>
							        <td></td>
							        <td><label for="integer">소프트웨어 이름</label></td>
							        <td>
					                	<input type="text" name="name" value="${sw.name}" ><br/>
							        </td>
							    </tr>
							    <tr>
							        <td></td>
							        <td><label for="confirmation">소프트웨어 사용 부서 명</label></td>
							        <td>
						                <input type="text" name="useDept" value="${sw.useDept}" id="sw_useDept"><br/>
							        </td>
							    </tr>
							    <tr>
							        <td></td>
							        <td><label for="confirmation">소프트웨어 용도</label></td>
							        <td>
						                <input type="text" name="usage" value="${sw.usage}" id="sw_usage"><br/>
							        </td>
							    </tr>
							    <tr>
							        <td></td>
							        <td><label for="confirmation">소프트웨어 시리얼 넘버</label></td>
							        <td>
						                <input type="text" name="serialNumber" value="${sw.serialNumber}"><br/>
							        </td>
							    </tr>
							    <tr>
							    	<td></td>
							    	<td></td>
							        <td>
						               	<div class="notice_area" id="notice_area"></div><br>
							        </td>
								</tr>
							</table>
						</form>
						<div class="clear"></div>
	    			</div>
				</div>
	   			<div  style="margin-right: 20px;">
	   				<a id="btn_list" class="btn right medium"><span>목록</span></a>
	   				<a id="btn_delete" class="btn right medium"><span>삭제</span></a>
	   				<a id="btn_edit" class="btn right medium"><span>수정</span></a>
	   			</div>
			</div>
		</div>
	</div>
	<script>
		$(document).ready(function() {
			$("#btn_delete").click(function() {
				$('input[name=_method]').val('delete');
				$('#change_form').submit();
			});
			
			$("#btn_edit").click(function() {
				var sw_name = $('input[name=name]').val();
				var sw_division = $('select[name=division]').val();
				var sw_useDept = $('input[name=useDept]').val();
				var sw_usage = $('input[name=usage]').val();
				if ( sw_division == '') {
					$('#notice_area').text('소프트웨어 프로그램 구분을 선택해주세요');
					$("#notice_area").css("color", "red");
				} else if ( sw_name == '') {
					$('#notice_area').text('소프트웨어 프로그램 이름을 입력해주세요');
					$("#notice_area").css("color", "red");
				} else {
					$('#change_form').attr("action", "/sw");
					$('input[name=_method]').val('put');
					$('#change_form').submit();
				}
			});
			
			$("#btn_list").click(function() {
				$('#change_form').attr("action", "/sw");
				$('input[name=_method]').val('get');
				$('#change_form').submit();
			});
		});
		
		$("#sw_useDept").bind("keyup",function(){
		    re = /[~!@\#$%^&*\()\-=+_']/gi;
		    var temp=jQuery("#sw_useDept").val();
		    if(re.test(temp)){
		        jQuery("#sw_useDept").val(temp.replace(re,""));
		    }
		});
		
		$("#sw_usage").bind("keyup",function(){
		    re = /[~!@\#$%^&*\()\-=+_']/gi;
		    var temp=jQuery("#sw_usage").val();
		    if(re.test(temp)){
		        jQuery("#sw_usage").val(temp.replace(re,""));
		    }
		});
	</script>
<c:import url="/WEB-INF/view/common/top.jsp" />