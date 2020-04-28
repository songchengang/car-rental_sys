<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<title>车辆租赁</title>
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
						<h1>车辆租赁</h1>
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
							<h3 class="card-title">车辆租赁列表</h3>
						</div>
						<!-- /.card-header -->
						<div class="card-body">
							<form action="/graduate/car/rentlist" method="post">
								<div class="form-group">
									<div class="row container-fluid">
										<div class="col-3">
											<input name="brand" type="text" class="form-control" placeholder="品牌" value="${param.brand}"/>
										</div>
										<div class="col-3">
											<input name="cartype" type="text" class="form-control" placeholder="车型" value="${param.cartype}"/>
										</div>
										<div class="col-3">
											<input name="seat" type="text" class="form-control" placeholder="座位数" value="${param.seat}"/>
										</div>
										<div class="col-2" style="position:absolute;right:0;">
											<button type="submit" class="btn btn-primary btn-sm">查询</button>
										</div>
									</div>
								</div>
							</form>
<!-- 							租赁车辆列表 -->
							<table id="example2" class="table table-bordered table-striped">
								<thead>
									<tr>
										<th>品牌</th>
										<th>车型</th>
										<th>租赁价格(/天)</th>
										<th>座位数(座)</th>
										<th>车辆数量</th>
					                    <th>租用</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${datalist}" var="car">
										<tr>
											<td>${car.brand}</td>
											<td>${car.cartype}</td>
											<td>${car.price}</td>
											<td>${car.seat}</td>
											<td>${car.number}</td>
											<td><a href="/graduate/car/rentform?brand=${car.brand}&&cartype=${car.cartype}
											&&price=${car.price}&&seat=${car.seat}" class="btn btn-sm btn-success">租用</a></td>
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