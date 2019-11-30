<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/view/common/top.jsp" />

	<div id="wrap" class="sidebarred">
    	<div id="main">
	        <header>
	            <div class="container_16 clearfix">
	                <div class="clearfix"><!-- <a id="logo" href="sidebar_index.html"></a> --></div>
	                <div id="pagetitle" class="clearfix">
	                    <h1 class="left">변동 알림</h1>
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
                                		<option value="A">전체</option>
										<option value="C">컴퓨터</option>
										<option value="L">SW 라이선스</option>
										<option value="Y">확인</option>
										<option value="N">미확인</option>
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
										<th style="width: 5px;">&nbsp;</th>	
										<th style="text-align: center;">번호</th>
										<th style="text-align: center;">알림 종류</th>
										<th style="text-align: center;">대상 번호</th>
										<th style="text-align: center;">등록 일자</th>
										<th style="text-align: center;">확인 여부</th>
									</tr>
								</thead>
								<tbody id="table_draw">
									<tr><td class="odd" colspan="6" style="text-align: center;">검색 결과가 없습니다</td></tr>
					            </tbody>
					        </table>
				        <div class="clear"></div>
					</div>
        		</div>
    		</div>
    	</div>
    </div>

	<script>
	 	$('document').ready(function(){
	 		$('#function_search').click(function() {
	 			draw();
	 		});
	 	});

		function draw() {
			var divisionStatus = $("#division").val();
		 	$.ajax({
			    url : "/changenotice",
			    type : "get",
			    headers : {
		 			"Content-Type" : "application/json;charset=UTF-8"
		 		},
		 		data: {
			    	division : $("#division").val()
			    },
			    dataType : "json",
			    success: function(data) {
			    	var html = "";
			    	if (data.length > 0) {
				    	for(var i = 0; i < data.length; i++) {
				    		if(data[i].division != "A"){
					    		var division = data[i].division == "C" ? "컴퓨터" : "SW 라이선스";
				    		} else {
				    			var division = data[i].division == "전체"
				    		}
					    	var checked = data[i].checked == "Y" ? "확인" : "미확인"; 
	
					    	if (i % 2 == 0) {
						    	html += "<tr class='odd'>";
					    	} else {
					    		html += "<tr class='even'>";
					    	}
					    	
				    		html += "<td></td>";
				    		html += "<td style='text-align: center;'>" + (i + 1) + "</td>";
				    		html += "<td style='text-align: center;'>" + division + "</td>";
					    	if(data[i].division == 'C'){
					    	    html += "<td style='text-align: center;'><a href='/changenotice/" + data[i].no + "/form'>" + data[i].computerNo + "</a></td>";
					    	} else if(data[i].division == 'L'){
					    		html += "<td style='text-align: center;'><a href='/changenotice/" + data[i].no + "/form'>" + data[i].swLicenseNo + "</a></td>";
					    	} else {
					    		html += "<td style='text-align: center;'><a href='/changenotice/" + data[i].no + "/form'>" + "-" + "</a></td>";
					    	}
					    	html += "<td style='text-align: center;'>" + data[i].registeredDate + "</td>";
					    	html += "<td style='text-align: center;'>" + checked + "</td>";
					    	html += "</tr>";
				    	}
			    	} else {
			    		html += "<tr class='odd'><td colspan='6' style='text-align: center;'>검색 결과가 없습니다</td>";
			    	}
			    	$("#table_draw").html(html);
			    },
			    error: function (request, status, error) {
			    	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			});
		};
	</script>

<c:import url="/WEB-INF/view/common/footer.jsp" />