<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <!-- Custom fonts for this template-->
  <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="css/sb-admin-2.min.css" rel="stylesheet">
</head>
<body class="bg-gradient-primary">
  <div class="container">
    <!-- Outer Row -->
    <div class="row justify-content-center">
      <div class="col-xl-5 col-lg-12 col-md-9">
        <div class="card o-hidden border-0 shadow-lg my-5">
          <div class="card-body p-0">
            <!-- Nested Row within Card Body -->
            <div class="row">
                <div class="p-5">
                  <form class="user" action="${pageContext.request.contextPath}/lab" id="login_form" method="get">
                    <div class="form-group" style="width: 365px;">
                      <input type="text" class="form-control form-control-user" id="id" placeholder="아이디" name="id" />
                    </div>
                    <div class="form-group" >
                      <input type="password" class="form-control form-control-user" id="password" placeholder="비밀번호" name="password" />
                    </div>
                    <div class="form-group">
                    </div>
                    <div id="notice_area" align="center" ></div>
					<input type="button" name="login_btn" value="로그인" class="btn btn-primary btn-user btn-block" /> 
                    </form>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  <!-- Bootstrap core JavaScript-->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="js/sb-admin-2.min.js"></script>

</body>
<script>
	$("input[name=login_btn]").click(function() {
		var user_id = $("input[name=id]").val();
		var password = $("input[name=password]").val();
		if (user_id != "" 
				&& password != "") {
			$.ajax({
				url : '${pageContext.request.contextPath}/login' ,
				type : 'POST',
				data : {
					id: user_id,
					password: password
				},
				success : function(data) {
					if (data.status == "success") {
						$('#login_form').submit();
					} else if(data.status == "fail") {
						$("#notice_area").text("가입하지 않은 아이디이거나 잘못된 비밀번호입니다.");
						$("#notice_area").css("color","red");
						$("input[name=id]").val("");
						$("input[name=password]").val("");
					}
				}
			});
		} else {
			$("#notice_area").text("아이디와 비밀번호를 모두 입력해주세요.");
			$("#notice_area").css("color","red");
		} 
	});
</script>
</html>
