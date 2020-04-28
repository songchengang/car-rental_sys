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
<body class="hold-transition register-page">
<div class="register-box">
	<div class="register-logo">
		<a href="/static/index2.html">
			<b>汽车租赁平台</a>
	</div>
	<div class="card">
		<div class="card-body register-card-body">
			<p class="login-box-msg">注册</p>
			<form action="/static/index.html" method="post" id="register_form">
				<div class="form-group has-feedback">
					<input type="text" name="name" class="form-control" placeholder="用户名">
				</div>
				<div class="form-group has-feedback">
					<input type="text" name="phone" class="form-control" placeholder="电话号码">
				</div>
				<div class="form-group has-feedback">
					<select type="text" name="gender" class="form-control" placeholder="性别">
						<option value="">性别</option>
						<option value="男" ${user.gender =='男'?'selected':'' }>男</option>
			    		<option value="女" ${user.gender =='女'?'selected':'' }>女</option>
					</select>
				</div>
				<div class="form-group has-feedback">
					<input type="password" name="password" class="form-control" placeholder="密码">
				</div>
				<div class="form-group has-feedback">
					<input type="password" name="newpassword" class="form-control" placeholder="确认密码">
				</div>
				<div class="social-auth-links text-center mb-3">
					<a href="#" class="btn btn-block btn-primary" onclick="register();">立即注册</a>
					<a href="#" class="btn btn-block btn-danger" onclick="gotoLogin();">去登录</a></div>
			</form>
		</div>
		<!-- /.form-box -->
	</div>
	<!-- /.card -->
</div>
<!-- /.register-box -->

<!-- jQuery -->
<script src="/static/plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="/static/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- iCheck -->
<script src="/static/plugins/iCheck/icheck.min.js"></script>
<script>
  $(function () {
    $('input').iCheck({
      checkboxClass: 'icheckbox_square-blue',
      radioClass   : 'iradio_square-blue',
      increaseArea : '20%' // optional
    })
  });
  function register() {
      if(!validate()) {
          return false;
      }
      $.ajax({
          url:"/graduate/doRegister",
          type:"POST",
          data:$("#register_form").serialize(),
          success:function (result) {
          	if(result.code == 100){
          		alert("注册成功");
          		window.location.href="/graduate/user/person";
              }else {
                  alert(result.extendInfo.register_error);
              }
          }
      });
  };

  function validate() {
      var inputName = $("input[name='name']").val();
      var inputPassword = $("input[name='password']").val();
      var inputNewPassword = $("input[name='newpassword']").val();
       if(inputName == '' || inputName == null) {
          alert("请输入用户名！");
          return false;
      }
      if(inputPassword == '' || inputPassword == null) {
          alert("请输入密码！");
          return false;
      }
      if(inputPassword != inputNewPassword) {
          alert("输入的两次密码不同，请重新输入！");
          return false;
      }
      return true;
  }

  function gotoLogin() {
      window.location.href= "/graduate/login";
  };
</script>
</body>
</html>
