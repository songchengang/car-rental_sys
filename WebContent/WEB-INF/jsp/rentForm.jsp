<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<title>租赁列表</title>
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
						<h1>汽车租赁</h1>
					</div>
				</div>
			</div>
			<!-- /.container-fluid -->
		</section>
		<!-- Main content -->
		<form class="form-horizontal" action="/graduate/orders/save" method="post">
			<section class="content">
				<div class="row">
					<div class="col-12">
						<div class="card">
							<div class="card-header">
								<h3 class="card-title">选择日期</h3>
							</div>
							<!-- /.card-header -->
							<div class="card-body">
								<div class="form-group row">
									<label for="inputcarbrand3" class="col-2 control-label">车辆品牌</label>
									<div class="col-6">
										<input type="text" id="inputcarbrand3" class="form-control" value="${car.brand}" readonly/>
									</div>
								</div>
								<div class="form-group row">
									<label for="inputcartype3" class="col-2 control-label">车型</label>
									<div class="col-6">
										<input type="text" id="inputcartype3" class="form-control" value="${car.cartype}" readonly/>
									</div>
								</div>
								<div class="form-group row">
									<label for="inputcarprice3" class="col-2 control-label">租赁价格(/天)</label>
									<div class="col-6">
										<input type="text" id="inputcarprice3" class="form-control" value="${car.price}" readonly/>
									</div>
								</div>
								<div class="form-group row">
									<label for="inputrentime3" class="col-2 control-label">租用时间</label>
									<div class="col-6">
										<input name="rentime" type="date" id="inputrentime3" class="form-control" required="required" onchange="optrent();" value="${time}" placeholder="租用时间"/>
									</div>
								</div>
								<div class="form-group row">
									<label for="inputreturntime3" class="col-2 control-label">归还时间</label>
									<div class="col-6">
										<input name="returntime" type="date" id="inputreturntime3" class="form-control" required="required" onchange="optrent();" placeholder="归还时间"/>
									</div>
								</div>
								<!-- <div class="form-group control-button">
									<div class="col-6">
										<a href="#" class="btn btn-default" onclick="optrent();">下一步</a>
									</div>
								</div> -->
							</div>
							<!-- /.card-body -->
						</div>
						<!-- /.card -->
					</div>
					<!-- /.col -->
				</div>
				<!-- /.row -->
			</section>
			
			<section class="content" id="rentDiv" style="display:none;">
				<div class="row">
					<div class="col-12">
						<div class="card">
							<div class="card-header">
								<h3 class="card-title">在线支付</h3>
							</div>
							<!-- /.card-header -->
							<div class="card-body">
								<input class="form-control" type="hidden" name="carid">
								<div class="form-group row">
									<label for="inputcarnumber3" class="col-2 control-label">车牌号</label>
									<div class="col-6">
										<input type="text" id="inputcarnumber3" class="form-control" readonly/>
									</div>
								</div>
								<div class="form-group row">
									<label for="inputsafe3" class="col-2 control-label">是否购买保险服务</label>
									<div class="col-6">
										<label>
				                			<input type="radio" name="safe" class="flat-red" checked value="0">
					                		<label>是</label>
					                	</label>
					                	<label>
					                    	<input type="radio" name="safe" class="flat-red" value="1">
					                  		<label>否</label>
					                  	</label>
									</div>
								</div>
								<div class="form-group row" id="carsafeDiv">
									<label for="inputcarsafe3" class="col-2 control-label">保险费(/天)</label>
									<div class="col-6">
										<input type="text" id="inputcarsafe3" class="form-control" readonly/>
									</div>
								</div>
								<div class="form-group row">
									<label for="inputdate3" class="col-2 control-label">租用天数</label>
									<div class="col-6">
										<input type="text" name="date" id="inputdate3" class="form-control" placeholder="租用天数" readonly/>
									</div>
								</div>
								<div class="form-group row">
									<label for="inputprice3" class="col-2 control-label">支付费用</label>
									<div class="col-6">
										<input name="price" type="text" id="inputprice3" class="form-control" placeholder="支付费用" readonly/>
									</div>
								</div>
								<div class="form-group row">
									<label for="inputname3" class="col-2 control-label" style="margin-top: 37px;">支付方式</label>
									<div class="col-6">
					                	<label>
					                		<input type="radio" name="buytype" class="flat-red" checked value="微信钱包">
					                		<img src="/static/images/wx.jpg" alt="" height="100px" width="100px"/>
					                	</label>
					                	<label>
					                    	<input type="radio" name="buytype" class="flat-red" value="支付宝">
					                  		<img src="/static/images/zfb.png" alt="" height="100px" width="100px"/>
					                  	</label>
					                  	<label>
					                    	<input type="radio" name="buytype" class="flat-red" value="银行卡">
					                  		<img src="/static/images/yhk.jpg" alt="" height="100px" width="100px"/>
					                  	</label>
									</div>
								</div>
								<div class="form-group row">
									<label for="inputprice3" class="col-2 control-label">租用规则</label>
									<div class="col-6" style="color:#666;margin-left: -20px;">
										<ul>
											<li>取车地址：虹桥机场T2 P3停车场</li>
											<li>取车凭证：中华人民共和国驾驶证、身份证。</li>
											<li>退款规则：取车12小时前可免费退款。</li>
											<li>油费说明：若油箱不满则收取50元加油服务费。</li>
											<li>支付说明：每完成一笔订单，会员信用+10，当信用超过100时，每单可以减20元。</li>
										</ul>
									</div>
								</div>
								<div class="form-group control-button">
									<div class="col-6">
										<button type="submit" class="btn btn-default">支付</button>
										<a href="/graduate/car/rentlist" class="btn btn-default">返回</a>
									</div>
								</div>
							</div>
							<!-- /.card-body -->
						</div>
						<!-- /.card -->
					</div>
					<!-- /.col -->
				</div>
				<!-- /.row -->
			</section>
		</form>
		<!-- /.content -->
	</div>
	<!-- /.content-wrapper -->
</div>
<script type="text/javascript">
	$("input[name=safe]").click(function(){
	    var safe = $(this).val();
	    if(safe==0) {
	    	$("#carsafeDiv").show();
	    	changeTime();
	    } else {
	    	$("#carsafeDiv").hide();
	    	changeTime();
	    }
	});
	function changeTime() {
		var returntime = new Date($("#inputreturntime3").val());
		var rentime = new Date($("#inputrentime3").val());
		if(rentime - returntime>1) {
			alert("归还日期不能小于租用日期");
			$("#inputreturntime3").val('');
		}
		var index = Math.abs(parseInt((returntime - rentime)/1000/3600/24))+1; 
		var carprice = parseInt($("#inputcarprice3").val());
		var safeprice = parseInt($("#inputcarsafe3").val());
		var safe = $('input:radio[name="safe"]:checked').val();
		var price = 0;
		if(safe==0) {
			price = (carprice+safeprice)*index;
	    } else {
	    	price = carprice*index;
	    }
		$("#inputdate3").val(index);
		var xinyong = '${currentUser.xinyong}';
		if(xinyong >= 100) {
			price = price - 20;
		}
		$("input[name='price']").val(price);
	}
	
	function optrent() {
		var brand = '${car.brand}';
		var cartype = '${car.cartype}';
		var price = '${car.price}';
		var seat = '${car.seat}';
		var begintime = $("#inputrentime3").val();
		var endtime = $("#inputreturntime3").val();
		if(begintime == null || begintime == '') {
			alert("请选择租用日期");
			return false;
		}
		if(endtime == null || endtime == '') {
			alert("请选择归还日期");
			return false;
		}
		if(new Date(begintime) - new Date(endtime)>1) {
			alert("归还日期不能小于租用日期，请重新选择归还日期");
			$("#inputreturntime3").val('');
			return false;
		}
		$.ajax({
			 url:"/graduate/car/optrent",
			 type:"post",
			 data: {
				 'brand':brand,
				 'cartype':cartype,
				 'price':price,
				 'seat':seat,
				 'begintime':begintime,
				 'endtime':endtime
			 },
			 success:function (result) {
				if (result.code == 100){
				    $("#rentDiv").show();
				    var car = result.dataInfo;
				    $("input[name='carid']").val(car['id']);
				    $("#inputcarnumber3").val(car['number']);
				    $("#inputcarsafe3").val(car['safe']);
				    changeTime();
				}else {
					$("#rentDiv").hide();
				    alert(result.msg);
				}
			}
			
		});
	}
</script>
</body>
</html>