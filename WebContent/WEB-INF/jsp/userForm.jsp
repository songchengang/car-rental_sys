<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>用户管理页面</title>
</head>
<body>
<div class="wrapper">
	<%@ include file="./commom/head.jsp"%>
	<!-- Content Wrapper. Contains page content -->
	<div class="content-wrapper">
		<!-- Content Header (Page header) -->
		<section class="content-header">
			<div class="container-fluid">
				<div class="row mb-2">
					<div class="col-sm-6">
						<h1>${user.auth=='1'?'员工':'会员' }管理</h1>
					</div>
				</div>
			</div>
			<!-- /.container-fluid -->
		</section>
		<!-- Main content -->
		<section class="content">
			<div class="row">
				<div class="col-12">
					<div class="card">
						<div class="card-header">
							<h3 class="card-title">${user.auth=='1'?'员工':'会员' }${not empty user.id?'修改':'新增'}</h3>
						</div>
						<!-- /.card-header -->
						<div class="card-body">
							<!-- 提交后转到用户controller中的save方法 -->
							<form class="form-horizontal" action="/graduate/user/save" method="post">
								<input class="form-control" type="hidden" name="id" value="${user.id}">
								<input class="form-control" type="hidden" name="auth" value="${user.auth}">
								<div class="form-group row">
									<label for="inputname3" class="col-2 control-label">姓名</label>
									<div class="col-6">
										<input name="name" type="text" id="inputname3"
											class="form-control" required="required" value="${user.name}"
											placeholder="姓名" />
									</div>
								</div>
								<div class="form-group row">
									<label for="inputphone3" class="col-2 control-label">电话号</label>
									<div class="col-6">
										<input name="phone" type="text" id="inputphone3"
											class="form-control" required="required" value="${user.phone}"
											placeholder="电话号" />
									</div>
								</div>
								<div class="form-group row">
									<label for="inputgender3" class="col-2 control-label">性别</label>
									<div class="col-6">
										<select type="text" name="gender" class="form-control" id="inputgender3" value="${user.gender}"
											placeholder="性别">
											<option value=""></option>
											<option value="男" ${user.gender =='男'?'selected':'' }>男</option>
								    		<option value="女" ${user.gender =='女'?'selected':'' }>女</option>
										</select>
									</div>
								</div>
								<div class="form-group row">
									<label for="inputpassword3" class="col-2 control-label">密码</label>
									<div class="col-6">
										<input name="password" type="text" id="inputpassword3"
											class="form-control" required="required" value="${user.password}"
											placeholder="密码" />
									</div>
								</div>
								<div class="form-group control-button">
									<div class="col-6">
										<button type="submit" class="btn btn-default">提交</button>
										<a href="/graduate/user/list?auth=${user.auth }" class="btn btn-default">返回</a>
									</div>
								</div>
							</form>
						</div>
						<!-- /.card-body -->
					</div>
					<!-- /.card -->
				</div>
				<!-- /.col -->
			</div>
			<!-- /.row -->
		</section>
		<!-- /.content -->
	</div>
	<!-- /.content-wrapper -->
</div>
</body>
</html>