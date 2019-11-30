<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="/WEB-INF/view/common/top.jsp" />
	<div id="wrap" class="sidebarred">
    	<div id="main">
	        <header>
	            <div class="container_16 clearfix">
	                <div class="clearfix"><!-- <a id="logo" href="sidebar_index.html"></a> --></div>
	                <div id="pagetitle" class="clearfix">
	                    <h1 class="left">실습실</h1>
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
                                <td width="9%" style="padding-left: 10px;"><label for="prototypeName">실습실 번호</label></td>
                                <td width="20%" style="padding-left: 10px;">
                                	<input type="text" id="search" name="no" style="width: 100%;" class="medium">
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
									<th>실습실 번호</th>
									<th>관리부서명</th>
									<th>사용부서명</th>
									<th>컴퓨터 수량</th>
								</tr>
							</thead>
		                  	<tbody id="table_draw">
		                  		<tr><td class="odd" colspan="6" style="text-align: center;">검색 결과가 없습니다</td>
				            </tbody>
				        </table>
				        <div class="clear"></div>
					</div>
        		</div>
       			<div>
       				<a id="btn_add" href="${pageContext.request.contextPath}/lab/form" class="btn right medium" style="margin-right: 13px;"><span>등록</span></a>
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
    			url : "/lab",
    			type : "get",
    			data : {
    				no : $("#search").val() != '' ? $("#search").val() : '0'
    			},
    			headers : {
    				"Content-Type" : "application/json;charset=UTF-8"
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
	    					var managementDeptName = data[i].managementDeptName != null ? data[i].managementDeptName : "-";
	    					var useDeptName = data[i].useDeptName != null ? data[i].useDeptName : "-";
	    					var no = data[i].no != null ? data[i].no : "-";
	
	    					if (i % 2 == 0) {
						    	html += "<tr class='odd'>";
					    	} else {
					    		html += "<tr class='even'>";
					    	}
	    					html += "<td></td>";
	    					html += "<td style='text-align: center;'>" + (i + 1) + "</td>";
	        				html += "<td style='text-align: center;'>" + "<a href='/lab/" + data[i].no + "/form'>" + no + "</a>" + "</td>";
	       					html += "<td style='text-align: center;'>" + managementDeptName + "</td>";
	        				html += "<td style='text-align: center;'>" + useDeptName + "</td>";
	        				html += "<td style='text-align: center;'>" + data[i].equipmentCount + "</td>";
	        				html += "</tr>";
	    				}
    				} else {
    					html += "<tr class='odd'><td colspan='6' style='text-align: center;'>검색 결과가 없습니다</td>";
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