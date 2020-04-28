<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<title>车辆保养</title>
	<meta name="decorator" content="default"/>
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
						<h1>车辆保养</h1>
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
							<h3 class="card-title">车辆保养列表</h3>
						</div>
						<!-- /.card-header -->
						<div class="card-body">
							<form action="/graduate/maintain/list" method="post">
								<div class="form-group">
									<div class="row container-fluid">
										<div class="col-3">
											<select name="carid" type="text" class="form-control" placeholder="车辆" value="${param.carid}">
												<option value="">选择车辆</option>
												<c:forEach items="${carlist}" var="car">
													<option value="${car.id }" ${param.carid == car.id?'selected':''}>${car.brand }-${car.cartype }-${car.number }</option>
												</c:forEach>
											</select>
										</div>
										<div class="col-2" style="position:absolute;right:0;">
											<button type="submit" class="btn btn-primary btn-sm">查询</button>
											<a href="/graduate/maintain/form" role="button" class="btn btn-primary btn-sm">新增</a>
										</div>
									</div>
								</div>
							</form>
							<table id="example2" class="table table-bordered table-striped">
								<thead>
									<tr>
										<th>车辆</th>
										<th>保养部位</th>
										<th>保养金额</th>
										<th>保养时间</th>
					                    <th>操作</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${datalist}" var="maintain">
										<tr>
											<td><a href="/graduate/maintain/form?id=${maintain.id}">
												${maintain.carname}
											</a></td>
											<td>
												${maintain.contents}
											</td>
											<td>
												${maintain.price}
											</td>
											<td>
												${maintain.time}
											</td>
											<td>
							    				<a href="/graduate/maintain/form?id=${maintain.id}" class="btn btn-sm btn-success">修改</a>
												<a href="/graduate/maintain/delete?id=${maintain.id}" class="btn btn-sm btn-danger" onclick="return confirmx('确认要删除该车辆保养吗？', this.href)">删除</a>
											</td>
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