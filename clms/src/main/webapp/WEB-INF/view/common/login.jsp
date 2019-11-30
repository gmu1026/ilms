<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" >
	<link rel="stylesheet" type="text/css" href="style/style.css" />
    <link rel="stylesheet" type="text/css" href="style/fixed.css" title="fixed" media="screen" />
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<title>지능형 실습실 관리</title>
    <!--[if lt IE 9]><script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script><![endif]-->
    <!--[if !IE 7]><style>#wrap {display:table;height:100%}</style><![endif]-->
</head>

<body id="loginpage">
	<div class="container_16 clearfix">
    	<div class="push_5 grid_6">
        	<!-- <a href="#"><img src="images/biglogo.png" ></a> -->
        </div>
        <div class="clear"></div>
        <div class="widget push_5 grid_6" id="login">
            <div class="widget_title"><h2>로그인</h2></div>
			<form id="login_form" action="${pageContext.request.contextPath}/login" method="post">
				<div class="widget_body">
					<div class="widget_content">
	                    <label class="block" for="id">아이디:</label>
	                    <input type="text" name="id" class="large"/>
	                    <label class="block" for="password">비밀번호:</label>
	                    <input type="password" name="password" class="large" />
	                    <div style="margin-top:10px">
	                    	<div id="notice_area" style="margin-bottom:5px;">${msg}</div>
							<div id="btn_login"><a class="btn right large" href="#">로그인</a></div>
						</div>
						<div class="clear"></div>
					</div>
				</div>
            </form>
        </div>
	</div>

<script>
		 $('document').ready(function() {
			$("#btn_login").click(function() {
				var id = $("input[name=id]").val();
				var password = $("input[name=password]").val();
				
				if (id == '' 
						|| password == '') {
					$("#notice_area").text("입력 값을 확인하세요.");
				} else {
					$("#login_form").submit();				
				}
			});
		}); 
		
	 /* $("#btn_login").click(function() {
		var user_id = $("input[name=id]").val();
		var password = $("input[name=password]").val();
		if (user_id != "" 
				&& password != "") {
			$.ajax({
				url : '${pageContext.request.contextPath}/account/check' , 
				type : 'GET',
				headers : {
					"Content-Type" : "application/json;charset=UTF-8"
				},
				data : {
					id: user_id
				},
				dataType : "json",
				success : function(data) {
					if (data.duplication == "true") {
						$('#login_form').submit();
					} else if(data.duplication == "false") {
						$("#notice_area").text("가입하지 않은 아이디이거나 잘못된 비밀번호입니다.");
						$("#notice_area").css("color","red");
						$("input[name=id]").val("");
						$("input[name=password]").val("");
					}
				}
			});
		} else {
			$("#notice_area").text("입력 값을 확인하세요.");
			$("#notice_area").css("color","red");
		} 
	});  */
</script>
</body>
</html>

        