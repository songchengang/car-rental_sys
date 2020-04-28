<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>汽车租赁平台</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="/static/dist/css/adminlte.min.css">
  <!-- iCheck -->
  <link rel="stylesheet" href="/static/plugins/iCheck/square/blue.css">
  <!-- Google Font: Source Sans Pro -->
  <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
</head>
<body class="hold-transition login-page">
<div class="login-box">
	<div class="login-logo">
		<a href="/static/index2.html">
			<b>汽车租赁平台</a>
	</div>
	<!-- /.login-logo -->
	<div class="card">
		<div class="card-body login-card-body">
			<p class="login-box-msg">登录</p>
			<form action="/graduate/dologin" method="post" id="login_form">
				<div class="form-group has-feedback">
					<input type="text" name="username" class="form-control" placeholder="用户名"></div>
				<div class="form-group has-feedback">
					<input type="password" name="password" class="form-control" placeholder="密码"></div>
				<div class="social-auth-links text-center mb-3">
					<a href="#" class="btn btn-block btn-primary" onclick="login();">立即登录</a>
					<a href="#" class="btn btn-block btn-danger" onclick="gotoRegister();">注册账号</a></div>
			</form>
		</div>
		<!-- /.login-card-body --></div>
</div>
<!-- /.login-box -->
<!-- jQuery -->
<script src="/static/plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="/static/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- iCheck -->
<script src="/static/plugins/iCheck/icheck.min.js"></script>
<script>
	$(function() {
		$('input').iCheck({
			checkboxClass: 'icheckbox_square-blue',
			radioClass: 'iradio_square-blue',
			increaseArea: '20%' // optional
		})
	});
   function login() {
        $.ajax({
            url:"/graduate/dologin",
            type:"POST",
            data:$("#login_form").serialize(),
            success:function (result) {
                if(result.code == 100){
                	window.location.href="/graduate/user/person";
                }else {
                    alert(result.extendInfo.login_error);
                }
            }
        });
    };
    
    function gotoRegister() {
        window.location.href= "/graduate/register";
    };
</script>
</body>
</html>
