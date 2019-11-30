<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/view/common/top.jsp" />

	<div id="wrap" class="sidebarred">
    	<div id="main">
	        <header>
	            <div class="container_16 clearfix">
	                <div class="clearfix"><!-- <a id="logo" href="sidebar_index.html"></a> --></div>
	                <div id="pagetitle" class="clearfix">
	                    <h1 class="left">소프트웨어</h1>
	                    <!-- <a class="btn grey right medium"><span>엑셀다운로드</span></a> -->
	                </div>
	            </div>
	        </header><div class="clear"></div>
        	<div class="container_16 clearfix" id="actualbody">
        		<!-- search area -->
	            <div class="grid_16 widget first">
	                <div class="widget_title clearfix" style="padding-top: 3px;"></div>
	                <div class="widget_body" style="padding-bottom: 1px;">
                        <table class="simple">
                            <tr>
                                <td width="9%" style="padding-left: 10px;"><label for="division">구분</label></td>
                                <td width="20%" style="padding-left: 10px;">
                                	<select id="division" class="medium">
										<option value="">전체</option>
										<option value="F">무료</option>
										<option value="P">유료</option>
									</select>
								</td>
                                <td><a href="#" class="btn right medium" title="검색" id="function_search"><span>검색</span></a></td>
                            </tr>
                        </table>
	                </div>
	            </div>
	            <!-- // search area -->

				<div class="grid_16 widget first">
        			<div class="widget_title clearfix" style="padding-top: 3px;"></div>
        			<div class="widget_body"> 
						<table>
			             	<thead>
								<tr>
									<th style="width: 7px;">&nbsp;</th>
									<th>번호</th>
									<th>구분</th>
									<th>소프트웨어 이름</th>
									<th>소프트웨어 시리얼 넘버</th>
									<th>소프트웨어 용도</th>
									<th>소프트웨어 사용 부서</th>
								</tr>
							</thead>
		                  	<tbody id="table_draw">
		                  		<tr><td colspan="10" style="text-align: center;">검색 결과가 없습니다</td></tr>
				            </tbody>
				        </table>
				        <div class="clear"></div>
					</div>
        			</div>
       			<div>
       				<a id="btn_add" href="${pageContext.request.contextPath}/sw/form" class="btn right medium" style="margin-right: 13px;"><span>등록</span></a>
       			</div>
    		</div>
    	</div>
    </div>
    
	<script>
		$('document').ready(function() {
			$('#function_search').click(function() {
				draw();
			});
		});
		
    	function draw() {
    		$.ajax({
    			url : "/sw",
    			type : "get",
    			headers : {
    				"Content-Type" : "application/json;charset=UTF-8"
    			},
    			data : {
    				division : $("#division").val()
    			},
    			dataType : "json",
    			success : function(data) {
    				if (i % 2 == 0) {
				    	html += "<tr class='odd'>";
			    	} else {
			    		html += "<tr class='even'>";
			    	}
    				
    				var html = "";
    				for(var i = 0; i < data.length; i++) {
    					var division = data[i].division == "F" ? "무료" : "유료";
    					var serialNumber = data[i].serialNumber != null ? data[i].serialNumber : "-";
    					var usage = data[i].usage != null ? data[i].usage : "-";
    					var useDept = data[i].useDept != null ? data[i].useDept : "-";
    					
    					if (i % 2 == 0) {
					    	html += "<tr class='odd'>";
				    	} else {
				    		html += "<tr class='even'>";
				    	}
    					
    					html += "	<td></td>";
        				html += "	<td style='text-align:center'>" + (i + 1) + "</td>";
        				html += "	<td style='text-align:center'>" + division + "</td>";
        				html += "	<td style='text-align:left'>" + "<a href='/sw/" + data[i].no + "/form'>" + data[i].name + "</a>" + "</td>";
        				html += "	<td style='text-align:left'>" + serialNumber + "</td>";
        				html += "	<td style='text-align:left'>" + usage + "</td>";
        				html += "	<td style='text-align:left'>" + useDept + "</td>";
        				html += "</tr>";
    				}
    				$("#table_draw").html(html);
    			},
    			error: function (request, status, error) {
			    	alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
				}
    		});
    	}
    </script>
    
<c:import url="/WEB-INF/view/common/footer.jsp" />