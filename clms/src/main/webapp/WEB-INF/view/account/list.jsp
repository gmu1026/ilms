<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<!-- <script type="text/javascript" src="/js/excelExportJs.js" ></script>
	<script type="text/javascript" src="/js/excelExportJs.min.js" ></script> -->
	<meta charset="UTF-8">
</head>
<body>
	 <c:import url="/WEB-INF/view/common/top.jsp" />
	 <div id="wrap" class="sidebarred">
    	<div id="main">
	        <header>
	            <div class="container_16 clearfix">
	                <div class="clearfix"><!-- <a id="logo" href="sidebar_index.html"></a> --></div>
	                <div id="pagetitle" class="clearfix">
	                    <h1 class="left">사용자</h1>
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
                                 <td width="7%" style="padding-left: 10px;"><label for="prototypeName">아이디 </label></td>
                                 <td width="20%" style="padding-left: 10px;">
                                 	<input type="text" id="id" style="width: 100%;" class="medium">
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
						 <table id="table_account">
			             	 <thead>
								 <tr>
									 <th>&nbsp;</th>
									 <th class="align-left">번호</th>
									 <th class="align-left">아이디</th>
									 <th class="align-left">사용자 명</th>
									 <th class="align-left">권한</th>
								 </tr>
							 </thead>
		                  	 <tbody id="table_draw">
		                  	 	<tr><td class="odd" colspan="5" style="text-align: center;">검색 결과가 없습니다</td></tr>	
				             </tbody>
				         </table>
				         <div class="clear"></div>
					 </div>
        		 </div>
       	 		 <div>
       	 			 <a id="" href="${pageContext.request.contextPath}/account/form" class="btn right medium" style="margin-right: 13px;"><span>등록</span></a>
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
    			url : "/account",
    			type : "get",
    			headers : {
    				"Content-Type" : "application/json;charset=UTF-8"
    			},
    			data : {
    				id : $('#id').val() != '' ? $('#id').val() : '' 
    			},
    			dataType : "json",
    			success : function(data) {
    				var html = "";
    				if (data.length > 0) {
	    				for(var i = 0; i < data.length; i++) {
	    					var authority = "";
	    					
	    					if (i % 2 == 0) {
						    	html += "<tr class='odd'>";
					    	} else {
					    		html += "<tr class='even'>";
					    	}
	    					
	    					if (data[i].authority == 'A') {
	    						authority = "관리자";
	    					} else {
	    						authority = "사용자";
	    					}
	    					
	    					html += "	<td></td>";
	    					html += "	<td>" + (i + 1) + "</td>";
	        				html += "	<td>" + "<a href='/account/" + data[i].id + "/form'>" + data[i].id + "</a>" + "</td>";
	        				html += "	<td>" + data[i].name + "</td>";
	        				html += "	<td>" + authority + "</td>";
	        				html += "</tr>";
	    				}
    				} else {
    					html += "<tr class='odd'><td colspan='5' style='text-align: center;'>검색 결과가 없습니다.</td></tr>";
    				}
    				$("#table_draw").html(html);
    			},
    			error: function (request, status, error) {
			    	alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
				}
    		});
    	}
	 	
	 	function tableToExcel(id) {
	 	    var data_type = 'data:application/vnd.ms-excel;charset=utf-8';
	 	    var table_html = encodeURIComponent(document.getElementById(id).outerHTML);
	 	 
	 	    var a = document.createElement('a');
	 	    a.href = data_type + ',%EF%BB%BF' + table_html;
	 	    a.download = id+'_excel'+'.xls';
	 	    a.click();
	 	}
	 </script>
     <c:import url="/WEB-INF/view/common/footer.jsp" />	
