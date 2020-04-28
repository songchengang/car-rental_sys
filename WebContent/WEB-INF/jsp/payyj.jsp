<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>缴纳押金</title>
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
						<h1>缴纳押金</h1>
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
							<h3 class="card-title">缴纳押金</h3>
						</div>
						<!-- /.card-header -->
						<div class="card-body">
							<form class="form-horizontal" action="/graduate/user/pay" method="post">
								<input class="form-control" type="hidden" name="id" value="${currentUser.id}">
								<div class="form-group row">
									<label for="inputname3" class="col-2 control-label" style="margin-top: 37px;">支付方式</label>
									<div class="col-6">
					                	<label>
					                		<input type="radio" name="yjtype" class="flat-red" checked value="微信钱包">
					                		<img src="/static/images/wx.jpg" alt="" height="100px" width="100px"/>
					                	</label>
					                	<label>
					                    	<input type="radio" name="yjtype" class="flat-red" value="支付宝">
					                  		<img src="/static/images/zfb.png" alt="" height="100px" width="100px"/>
					                  	</label>
					                  	<label>
					                    	<input type="radio" name="yjtype" class="flat-red" value="银行卡">
					                  		<img src="/static/images/yhk.jpg" alt="" height="100px" width="100px"/>
					                  	</label>
									</div>
								</div>
								<div class="form-group row">
									<label for="inputgender3" class="col-2 control-label">金额</label>
									<div class="col-6">
										<select type="text" name="yajin" class="form-control" required="required" id="inputgender3" value="${user.yajin}"
											placeholder="金额">
											<option value=""></option>
											<option value="200">200</option>
											<option value="500">500</option>
								    		<option value="1000">1000</option>
								    		<option value="2000">2000</option>
								    		<option value="5000">5000</option>
										</select>
									</div>
								</div>
								<div class="form-group control-button">
									<div class="col-6">
										<button type="submit" class="btn btn-default">提交</button>
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
$('input[type="checkbox"].flat-red, input[type="radio"].flat-red').iCheck({
  checkboxClass: 'icheckbox_flat-green',
  radioClass   : 'iradio_flat-green'
})
</script>
</body>
</html>