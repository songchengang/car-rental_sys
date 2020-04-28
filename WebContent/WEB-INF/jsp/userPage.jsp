<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>${param.auth=='1'?'员工':'会员' }管理页面</title>
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
						<h1>${param.auth=='1'?'员工':'会员' }管理</h1>
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
							<h3 class="card-title">${param.auth=='1'?'员工':'会员' }列表</h3>
						</div>
						<!-- /.card-header -->
						<div class="card-body">
							<form action="/graduate/user/list?auth=${param.auth }"
								method="post">
								<div class="form-group">
									<div class="row container-fluid">
										<div class="col-3">
											<input type="text" name="name" class="form-control" value="${param.name }" placeholder="姓名">
										</div>
										
										<div class="col-2" style="position:absolute;right:0;">
											<button type="submit" class="btn btn-primary btn-sm">查询</button>
											<a href="/graduate/user/form?auth=${param.auth}" role="button" class="btn btn-primary btn-sm">新增</a>
										</div>
									</div>
								</div>
							</form>
							<table id="example2" class="table table-bordered table-striped">
								<thead>
									<tr>
										<th>姓名</th>
										<th>电话号</th>
										<th>性别</th>
										<c:if test="${param.auth=='2' }">
											<th>信用</th>
											<th>押金</th>
											<th>支付方式</th>
											<th>押金状态</th>
											<th>冻结押金</th>
										</c:if>
										<th>操作</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${datalist}" var="user">
										<tr>
											<td><a href="/graduate/user/form?id=${user.id}">
													${user.name} </a></td>
											<td>${user.phone}</td>
											<td>${user.gender }</td>
											<c:if test="${param.auth=='2' }">
												<td>${user.xinyong}</td>
												<c:if test="${user.yajin!=''&&user.yajin!=null&&user.yajin!=0 }">
													<td>${user.yajin}</td>
													<td>${user.yjtype}</td>
													<td>${user.yjstate=='1'?'冻结':'正常'}</td>
													<td>
														<c:choose>														
															<c:when test="${user.yjstate == '1' }">
																<a href="/graduate/user/updateState?id=${user.id}
																&&state=0" class="btn btn-sm btn-warning">解冻</a>
															</c:when>
															<c:otherwise>
																<a href="/graduate/user/updateState?id=${user.id}
																&&state=1" class="btn btn-sm btn-warning">冻结</a>
															</c:otherwise>
														</c:choose>
													</td>
												</c:if>
												<c:if test="${user.yajin==''||user.yajin==null||user.yajin==0 }">
													<td>该会员未缴纳押金</td>
													<td></td>
													<td></td>
													<td></td>
												</c:if>
											</c:if>
											<td>
												<a href="/graduate/user/form?id=${user.id}" class="btn btn-sm btn-success">修改</a>
												<a href="/graduate/user/delete?id=${user.id}&&auth=${param.auth}" class="btn btn-sm btn-danger" onclick="return confirmx('确认要删除该管理吗？', this.href)">删除</a></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
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