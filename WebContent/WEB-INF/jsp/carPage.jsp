<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<title>车辆管理</title>
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
						<h1>车辆管理</h1>
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
							<h3 class="card-title">车辆列表</h3>
						</div>
						<!-- /.card-header -->
						<div class="card-body">
							<form action="/graduate/car/list" method="post">
								<div class="form-group">
									<div class="row container-fluid">
										<div class="col-3">
											<input name="brand" type="text" class="form-control" placeholder="品牌" value="${param.brand}"/>
										</div>
										<div class="col-3">
											<input name="cartype" type="text" class="form-control" placeholder="车型" value="${param.cartype}"/>
										</div>
										<div class="col-2" style="position:absolute;right:0;">
											<button type="submit" class="btn btn-primary btn-sm">查询</button>
											<a href="/graduate/car/form" role="button" class="btn btn-primary btn-sm">发布</a>
										</div>
									</div>
								</div>
							</form>
							<table id="example2" class="table table-bordered table-striped">
								<thead>
									<tr>
										<th>品牌</th>
										<th>车型</th>
										<th>车牌号</th>
										<th>租赁价格(/天)</th>
										<th>简介</th>
										<th>座位数(座)</th>
										<th>保险费(/天)</th>
										<th>油量</th>
					                    <th>操作</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${datalist}" var="car">
										<tr>
											<td><a href="/graduate/car/form?id=${car.id}">
												${car.brand}
											</a></td>
											<td>
												${car.cartype}
											</td>
											<td>
												${car.number}
											</td>
											<td>
												${car.price}
											</td>
											<td>
												${car.contents}
											</td>
											<td>
												${car.seat}
											</td>
											<td>
												${car.safe}
											</td>
											<td>
												${car.oil}
											</td>
											<td>
							    				<a href="/graduate/car/form?id=${car.id}" class="btn btn-sm btn-success">更改</a>
												<a href="/graduate/car/delete?id=${car.id}" class="btn btn-sm btn-danger" onclick="return confirmx('确认要下架该车辆吗？', this.href)">下架</a>
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