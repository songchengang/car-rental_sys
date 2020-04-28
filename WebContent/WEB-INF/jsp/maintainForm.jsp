<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<title>车辆保养</title>
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
							<h3 class="card-title">保养单${not empty maintain.id?'修改':'新增'}</h3>
						</div>
						<!-- /.card-header -->
						<div class="card-body">
							<form class="form-horizontal" action="/graduate/maintain/save" method="post">
								<input class="form-control" type="hidden" name="id" value="${maintain.id}">
								<div class="form-group  row">
									<label for="inputcarid3" class="col-2 control-label">车辆</label>
									<div class="col-6">
										<select name="carid" type="text" class="form-control" required="required" placeholder="车辆" value="${maintain.carid}">
											<option value=""></option>
											<c:forEach items="${carlist}" var="car">
												<option value="${car.id }" ${maintain.carid == car.id?'selected':'' }>${car.brand }-${car.cartype }-${car.number }</option>
											</c:forEach>
										</select>
									</div>
								</div>
								<div class="form-group  row">
									<label for="inputcontents3" class="col-2 control-label">保养部位</label>
									<div class="col-6">
										<textarea name="contents" rows="4" id="inputcontents3" class="form-control" required="required" >${maintain.contents}</textarea>
									</div>
								</div>
								<div class="form-group  row">
									<label for="inputprice3" class="col-2 control-label">保养金额</label>
									<div class="col-6">
									<input name="price" type="number" id="inputprice3" class="form-control" required="required" value="${maintain.price}" placeholder="保养金额"/>
									</div>
								</div>
								<div class="form-group  row">
									<label for="inputtime3" class="col-2 control-label">保养时间</label>
									<div class="col-6">
									<input name="time" type="date" id="inputtime3" class="form-control" required="required" value="${maintain.time}" placeholder="保养时间"/>
									</div>
								</div>
								<div class="form-group control-button">
									<div class="col-6">
										<button type="submit" class="btn btn-default">提交</button>
										<a href="/graduate/maintain/list" class="btn btn-default">返回</a>
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