<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<title>订单管理</title>
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
						<h1>订单列表</h1>
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
							<h3 class="card-title">订单列表</h3>
						</div>
						<!-- /.card-header -->
						<div class="card-body">
							<form action="/graduate/orders/list" method="post">
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
										<div class="col-3">
											<input name="createname" type="text" class="form-control" placeholder="租赁人" value="${param.createname}"/>
										</div>
										<div class="col-2" style="position:absolute;right:0;">
											<button type="submit" class="btn btn-primary btn-sm">查询</button>
											<!-- <a href="/graduate/orders/form" role="button" class="btn btn-primary btn-sm">新增</a> -->
										</div>
									</div>
								</div>
							</form>
							<table id="example2" class="table table-bordered table-striped">
								<thead>
									<tr>
										<th>所选车辆</th>
										<th>租用时间</th>
										<th>是否购买保险服务</th>
										<th>支付费用</th>
										<th>支付方式</th>
										<th>租用状态</th>
										<th>提交时间</th>
										<th>租赁人</th>
										<th>评价</th>
					                    <th>操作</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${datalist}" var="orders">
										<tr>
											<td><a href="/graduate/orders/form?id=${orders.id}">
												${orders.carname}
											</a></td>
											<td>${orders.rentime}至${orders.returntime}</td>
											<td>${orders.safe == '0'?'是':'否'}</td>
											<td>${orders.price}</td>
											<td>${orders.buytype }</td>
											<td>${orders.qxstate=='1'?'已取消':(orders.qxstate=='2'?'已归还':'已租用')}</td>
											<td>${orders.createtime}</td>
											<td>${orders.createname}</td>
                                            <!-- 判断用户权限是否为会员  -->
											<c:if test="${currentUser.auth == '2' }"> 
												<td><!-- 判断订单状态是否为已完成  -->												
													<c:if test="${orders.qxstate == '2' }">
														<c:if test="${orders.evaluate == null || orders.evaluate == '' }">
															<a href="#" role="button" class="btn btn-sm btn-warning" data-toggle="modal" 
															data-target=".orderspj-modal" onclick="orderspj('${orders.id }')">评价</a>
														</c:if>
														<c:if test="${orders.evaluate != null && orders.evaluate != '' }">${orders.evaluate}</c:if>
													</c:if>
												</td>
												<td>
													<c:if test="${orders.qxstate == '0' }">
                                                    <!-- 判断是否能取消订单 -->
														<c:if test="${orders.hour >= 12 }"><a href="/graduate/orders/updateState?
														id=${orders.id}&&state=1" class="btn btn-sm btn-danger">取消</a></c:if>
														<a href="/graduate/orders/updateState?id=${orders.id}&&state=2" 
														class="btn btn-sm btn-success">还车</a>
								    				</c:if>
								    				<!-- 判断是否能续租订单（订单未被取消） -->
								    				<c:if test="${orders.qxstate != '1' }"><a href="/graduate/car/xrent?id=${orders.carid}
								    				&&time=${orders.returntime}" class="btn btn-sm btn-success">续租</a></c:if>
													</td>
											</c:if>				
											<!-- 赋予管理员删除订单的权限 -->							
											<c:if test="${currentUser.auth == '0' }">
												<td>${orders.evaluate}</td>
												<td><a href="/graduate/orders/delete?id=${orders.id}" class="btn btn-sm btn-danger" 
												onclick="return confirmx('确认要删除该订单吗？', this.href)">删除</a></td>
											</c:if>
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
<%@ include file="orderspj.jsp"%>
</body>
</html>