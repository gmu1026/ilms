
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<title>지능형 실습실 관리 시스템</title>
	
	<link rel="stylesheet" type="text/css" href="/style/style.css" />
	<link id='sfluid' class="sswitch" rel="stylesheet" type="text/css" href="/style/fluid.css" title="fluid" media="screen" />
	<link id='sfixed' class="sswitch" rel="stylesheet" type="text/css" href="/style/fixed.css" title="fluid" media="screen" />
	<script type="text/javascript" src="/js/jquery-1.6.1.min.js"></script>
	<script type="text/javascript" src="/js/jquery-ui-1.8.14.custom.min.js"></script>
	<script type="text/javascript" src="/js/excanvas.min.js"></script>
	<script type="text/javascript" src="/js/jquery.flot.min.js"></script>
	<script type="text/javascript" src="/js/jquery.flot.pie.min.js"></script>
	<script type="text/javascript" src="/js/jquery.flot.stack.min.js"></script>
	<script type="text/javascript" src="/js/jquery.dataTables.min.js"></script>
	<script type="text/javascript" src="/js/jquery.labelify.js"></script>
	<script type="text/javascript" src="/js/iphone-style-checkboxes.js"></script>
	<script type="text/javascript" src="/js/jquery.ui.selectmenu.js"></script>
	<script type="text/javascript" src="/js/vanadium-min.js"></script>
	<script type="text/javascript" src="/js/jquery.cleditor.min.js"></script>
	<script type="text/javascript" src="/js/superfish.js"></script>
	<script type="text/javascript" src="/js/jquery.colorbox-min.js"></script>
	<script type="text/javascript" src="/js/styleswitch.js"></script>
	<script type="text/javascript" src="/js/fullcalendar.min.js"></script>
	<script type="text/javascript" src="/js/jquery.uploadify.v2.1.4.min.js"></script>
	<script type="text/javascript" src="/js/uploadify.js"></script>
	<script type="text/javascript" src="/js/jquery.tipsy.js"></script>
	<script type="text/javascript" src="/js/gcal.js"></script>
	<script type="text/javascript" src="/js/swfobject.js"></script>
	<script type="text/javascript" src="/js/jquery.pnotify.min.js"></script>
	<script type="text/javascript" src="/js/examples.js"></script>
	<script type="text/javascript" src="/js/sidemenu.js">// Strictly for sidebar </script>
	<!-- Toolbar for Demo Only -->
	<link rel="stylesheet" type="text/css" href="/demo/toolbar.css" />
	<link rel="stylesheet" media="screen" type="text/css" href="/demo/colorpicker/css/colorpicker.css" />
	<script type="text/javascript" src="/demo/colorpicker/js/colorpicker.js"></script>
	<!-- Demo js Only -->
	<script type="text/javascript" src="/js/demo.js"></script>
	<!--[if lt IE 9]>
	    <script type="text/javascript" src="/js/html5.js"></script>
	<![endif]-->
	<!--[if IE 7]>
	    <link rel="stylesheet" type="text/css" href="/style/IE7.css" />
	<![endif]-->
</head>
<body>
    <div id="sidebar">
		<nav>
            <div id="user" class="clearfix">
                <img src="/demo/avatar.png" alt="" />
                <strong class="username">${sessionScope.isLogin}</strong>
                <ul class="piped">
                    <li><a href="${pageContext.request.contextPath}/logout">Logout</a></li>
                </ul>
            </div>

			<ul id="sidemenu">
                <li>
                    <a href="${pageContext.request.contextPath}/changenotice" class="clearfix">
                        <span id="notification_count" class="notification"></span>
                        <span class="icon"><img src="/images/menu/msg.png" /></span>
                        <span class="title">알람</span>
                    </a>
                </li>
			    <li>
                    <a href="${pageContext.request.contextPath}/lab" class="clearfix">
                        <span class="icon"><img src="/images/menu/tables.png" /></span>
                        <span class="title">실습실</span>
                    </a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/computer" class="clearfix">
                        <span class="icon"><img src="/images/menu/charts.png" /></span>
                        <span class="title">컴퓨터</span>
                    </a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/sw" class="clearfix">
                        <span class="icon"><img src="/images/menu/form.png" /></span>
                        <span class="title">소프트웨어</span>
                    </a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/swlicense" class="clearfix">
                        <span class="icon"><img src="/images/menu/pages.png" /></span>
                        <span class="title">소프트웨어 라이선스</span>
                    </a>
                </li>
                <c:if test="${sessionScope.authority eq 'A'}">
	                <li>
	                    <a href="${pageContext.request.contextPath}/account" class="clearfix">
	                        <span class="icon"><img src="/images/menu/settings.png" /></span>
	                        <span class="title">사용자</span>
	                    </a>
	                </li>
                </c:if>
            </ul>
		</nav>
	</div>
	
	<script>
	$('document').ready(function(){
		$.ajax({
			url : "/changenotice/check",
			type : "get",
			headers : {
				"Content-Type" : "application/json;charset=UTF-8"
			},
			data : { 
			},
			dataType : "json",
			success : function(data) {
				$("#notification_count").text(data.count);
			},
			error: function (request, status, error) {
		    	alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
			}
		});
	});
	</script>