<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>个人信息</title>
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
						<h1>个人信息</h1>
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
							<div class="row">
								<h3 class="card-title" style="dispaly:inline">个人信息</h3>
								<a href="#" id="updatePerson" class="btn btn-primary btn-sm" style="position:absolute;right:3%;" onclick="update();">修改</a>
							</div>
						</div>
						<!-- /.card-header -->
						<div class="card-body col-10" style="margin:10px auto 20px auto;" id="tableDiv">
							<table class="table table-bordered">
								<tr>
									<th>姓名</th>
									<td>${currentUser.name }</td>
									<th>电话号</th>
									<td>${currentUser.phone }</td>
								</tr>
								<tr>
									<th>性别</th>
									<td>${currentUser.gender }</td>
									<th>密码</th>
									<td>${currentUser.password }</td>
								</tr>
								<c:if test="${currentUser.auth=='2' }">
								<tr>
									<th>信用</th>
									<td colspan="3">${currentUser.xinyong }</td>
								</tr>
								<tr>
									<th>押金</th>
									<td>${currentUser.yajin!=''&&currentUser.yajin!=null&&currentUser.yajin!=0?currentUser.yajin:'未缴纳' }</td>
									<th>押金状态</th>
									<td>${currentUser.yajin!=''&&currentUser.yajin!=null&&currentUser.yajin!=0?(currentUser.yjstate=='1'?'冻结':'正常'):'' }</td>
								</tr>
								<tr>
									<th>支付方式</th>
									<td>${currentUser.yjtype }</td>
									<th>押金操作</th>
									<td>
										<c:choose>
											<c:when test="${currentUser.yajin!=''&&currentUser.yajin!=null&&currentUser.yajin!=0 }">
												<a href="#" class="btn btn-sm btn-success" onclick="returnyj();">退还</a>
											</c:when>
											<c:otherwise>
												<a href="/graduate/user/payyj" class="btn btn-sm btn-success">缴纳</a>
											</c:otherwise>
										</c:choose>
									</td>
								</tr>
								</c:if>
							</table>
						</div>
						
						<div class="card-body col-10" style="margin:0 auto; display:none" id="formDiv">
							<form class="form-horizontal" action="/graduate/user/save" method="post">
								<input class="form-control" type="hidden" name="id" value="${currentUser.id}">
								<input class="form-control" type="hidden" name="auth" value="${currentUser.auth}">
								<input class="form-control" type="hidden" name="flag" value="person">
								<div class="form-group row">
									<label for="inputname3" class="col-1 control-label">姓名</label>
									<div class="col-6">
										<input name="name" type="text" id="inputname3"
											class="form-control  required" value="${currentUser.name}"
											placeholder="姓名" readonly/>
									</div>
								</div>
								<div class="form-group row">
									<label for="inputphone3" class="col-1 control-label">电话号</label>
									<div class="col-6">
										<input name="phone" type="text" id="inputphone3"
											class="form-control  required" value="${currentUser.phone}"
											placeholder="电话号" />
									</div>
								</div>
								<div class="form-group row">
									<label for="inputgender3" class="col-1 control-label">性别</label>
									<div class="col-6">
										<select type="password" name="gender" class="form-control" id="inputgender3" value="${user.gender}"
											placeholder="性别">
											<option value=""></option>
											<option value="男" ${currentUser.gender =='男'?'selected':'' }>男</option>
								    		<option value="女" ${currentUser.gender =='女'?'selected':'' }>女</option>
										</select>
									</div>
								</div>
								<div class="form-group row">
									<label for="inputpassword3" class="col-1 control-label">密码</label>
									<div class="col-6">
										<input name="password" type="text" id="inputpassword3"
											class="form-control  required" value="${currentUser.password}"
											placeholder="密码" />
									</div>
								</div>
								<div class="form-group control-button">
									<div class="col-6">
										<button type="submit" class="btn btn-default">修改</button>
										<a  href="/graduate/user/person" class="btn btn-default">返回</a>
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
<script type="text/javascript">
	function update() {
		$("#tableDiv").hide();
		$("#formDiv").show();
		$("#updatePerson").hide();
	}
	
	function returnyj() {
		var id = $("input[name='id']").val();
		$.ajax({
            url:"/graduate/user/returnyj?id="+id,
            type:"post",
            success:function (result) {
                if (result.code == 100){
                    alert("押金退还成功!");
                    window.location.href="/graduate/user/person";
                }else {
                    alert(result.msg);
                }
            }
        });
	}
</script>
</body>
</html>