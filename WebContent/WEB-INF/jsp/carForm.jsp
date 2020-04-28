<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<title>车辆管理</title>
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
							<h3 class="card-title">车辆${not empty car.id?'修改':'新增'}</h3>
						</div>
						<!-- /.card-header -->
						<div class="card-body">
							<form class="form-horizontal" action="/graduate/car/save" method="post">
								<input class="form-control" type="hidden" name="id" value="${car.id}">
								<div class="form-group  row">
									<label for="inputbrand3" class="col-2 control-label">品牌</label>
									<div class="col-6">
										<input name="brand" type="text" id="inputbrand3" class="form-control" required="required" value="${car.brand}" placeholder="品牌"/>
									</div>
								</div>
								<div class="form-group  row">
									<label for="inputcartype3" class="col-2 control-label">车型</label>
									<div class="col-6">
										<input name="cartype" type="text" id="inputcartype3" class="form-control" required="required" value="${car.cartype}" placeholder="车型"/>
									</div>
								</div>
								<div class="form-group  row">
									<label for="inputnumber3" class="col-2 control-label">车牌号</label>
									<div class="col-6">
										<input name="number" type="text" id="inputnumber3" class="form-control" required="required" value="${car.number}" placeholder="车牌号"/>
									</div>
								</div>
								<div class="form-group  row">
									<label for="inputprice3" class="col-2 control-label">租赁价格(/天)</label>
									<div class="col-6">
										<input name="price" type="number" id="inputprice3" class="form-control" required="required" value="${car.price}" placeholder="租赁价格"/>
									</div>
								</div>
								<div class="form-group  row">
									<label for="inputcontents3" class="col-2 control-label">简介</label>
									<div class="col-6">
										<textarea name="contents" rows="4" id="inputcontents3" class="form-control" >${car.contents}</textarea>
									</div>
								</div>
								<div class="form-group  row">
									<label for="inputseat3" class="col-2 control-label">座位数(座)</label>
									<div class="col-6">
										<input name="seat" type="number" id="inputseat3" class="form-control" value="${car.seat}" placeholder="座位数"/>
									</div>
								</div>
								<div class="form-group  row">
									<label for="inputsafe3" class="col-2 control-label">保险费(/天)</label>
									<div class="col-6">
										<input name="safe" type="number" id="inputsafe3" class="form-control" required="required" value="${car.safe}" placeholder="保险费"/>
									</div>
								</div>
								<div class="form-group  row">
									<label for="inputoil3" class="col-2 control-label">油量</label>
									<div class="col-6">
										<select name="oil" type="text" id="inputoil3" class="form-control" value="${car.oil}" placeholder="油量">
											<option value="满">满</option>
											<option value="不满">不满</option>
										</select>
									</div>
								</div>
								<div class="form-group control-button">
									<div class="col-6">
										<button type="submit" class="btn btn-default">提交</button>
										<a href="/graduate/car/list" class="btn btn-default">返回</a>
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