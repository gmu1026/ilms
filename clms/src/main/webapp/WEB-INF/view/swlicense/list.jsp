<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/view/common/top.jsp" />

	<div id="wrap" class="sidebarred">
    	<div id="main">
	        <header>
	            <div class="container_16 clearfix">
	                <div class="clearfix"><!-- <a id="logo" href="sidebar_index.html"></a> --></div>
	                <div id="pagetitle" class="clearfix">
	                    <h1 class="left">소프트웨어 라이선스</h1>
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
                                <td width="9%" style="padding-left: 10px;"><label for="prototypeName">소프트웨어 이름</label></td>
                                <td width="20%" style="padding-left: 10px;">
	                                <input type="text" id="search" name="name" style="width: 100%;" class="medium">
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
									<th style="width: 5px;">&nbsp;</th>
									<th>번호</th>
									<th>소프트웨어 이름</th>
									<th>계약 일자</th>
									<th>만료 일자</th>
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
       				<a id="btn_add" href="${pageContext.request.contextPath}/swlicense/form" class="btn right medium" style="margin-right: 13px;"><span>등록</span></a>
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
    			url : "/swlicense",
    			type : "get",
    			headers : {
    				"Content-Type" : "application/json;charset=UTF-8"
    			},
    			data : {
    				swName : $("search").val() != '' ? $("#search").val() : ''
    			},
    			success : function(data) {
    				if (i % 2 == 0) {
				    	html += "<tr class='odd'>";
			    	} else {
			    		html += "<tr class='even'>";
			    	}
    				
    				var html = "";
    				if (data.length > 0) {
	    				for(var i = 0; i < data.length; i++) {
	    					if (i % 2 == 0) {
						    	html += "<tr class='odd'>";
					    	} else {
					    		html += "<tr class='even'>";
					    	}
	    					
	    					html += "	<td></td>";
	        				html += "	<td style='text-align:center'>" + (i + 1) + "</td>";
	        				html += "	<td style='text-align:center'>" + "<a href='/swlicense/" + data[i].no + "/form'>" + data[i].swName + "</a>" + "</td>";
	        				html += "	<td style='text-align:center'>" + data[i].contractDate + "</td>";
	        				html += "	<td style='text-align:center'>" + data[i].expiryDate + "</td>";
	        				html += "</tr>";
	    				} 
    				} else {
    					html += "<tr class='odd'><td colspan='7' style='text-align: center;'>검색 결과가 없습니다</td>";
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