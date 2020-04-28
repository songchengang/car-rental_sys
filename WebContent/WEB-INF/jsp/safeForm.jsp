<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<title>车辆保险</title>
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
						<h1>车辆保险</h1>
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
							<h3 class="card-title">保险单${not empty safe.id?'修改':'新增'}</h3>
						</div>
						<!-- /.card-header -->
						<div class="card-body">
							<form class="form-horizontal" action="/graduate/safe/save" method="post">
								<input class="form-control" type="hidden" name="id" value="${safe.id}">
								<div class="form-group  row">
									<label for="inputcarid3" class="col-2 control-label">车辆</label>
									<div class="col-6">
										<select name="carid" type="text" class="form-control" required="required" placeholder="车辆" value="${safe.carid}">
											<option value=""></option>
											<c:forEach items="${carlist}" var="car">
												<option value="${car.id }" ${safe.carid == car.id?'selected':''}>${car.brand }-${car.cartype }-${car.number }</option>
											</c:forEach>
										</select>
									</div>
								</div>
								<div class="form-group  row">
									<label for="inputprice3" class="col-2 control-label">保险费</label>
									<div class="col-6">
									<input name="price" type="text" id="inputprice3" class="form-control" required="required" value="${safe.price}" placeholder="保险费"/>
									</div>
								</div>
								<div class="form-group  row">
									<label for="inputbegintime3" class="col-2 control-label">保险开始时间</label>
									<div class="col-6">
									<input name="begintime" type="date" id="inputbegintime3" class="form-control" required="required" value="${safe.begintime}" placeholder="保险开始时间"/>
									</div>
								</div>
								<div class="form-group  row">
									<label for="inputendtime3" class="col-2 control-label">保险结束时间</label>
									<div class="col-6">
									<input name="endtime" type="date" id="inputendtime3" class="form-control" required="required" value="${safe.endtime}" placeholder="保险结束时间"/>
									</div>
								</div>
									<div class="form-group  row">
									<label for="inputcompany3" class="col-2 control-label">保险公司</label>
									<div class="col-6">
									<input name="company" type="text" id="inputcompany3" class="form-control" required="required" value="${safe.company}" placeholder="保险公司"/>
									</div>
								</div>
									<div class="form-group  row">
									<label for="inputnumber3" class="col-2 control-label">保险单号</label>
									<div class="col-6">
									<input name="number" type="text" id="inputnumber3" class="form-control" required="required" value="${safe.number}" placeholder="保险单号"/>
									</div>
								</div>
								<div class="form-group control-button">
									<div class="col-6">
										<button type="submit" class="btn btn-default">提交</button>
										<a href="/graduate/safe/list" class="btn btn-default">返回</a>
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