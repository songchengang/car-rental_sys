<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>AdminLTE 3 | Dashboard</title>
	<!-- Tell the browser to be responsive to screen width -->
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- Font Awesome -->
	<link rel="stylesheet" href="/static/plugins/font-awesome/css/font-awesome.min.css">
	<!-- Ionicons -->
	<link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
	<!-- Theme style -->
	<link rel="stylesheet" href="/static/dist/css/adminlte.min.css">
	<!-- iCheck -->
	<link rel="stylesheet" href="/static/plugins/iCheck/flat/blue.css">
	<!-- Morris chart -->
	<link rel="stylesheet" href="/static/plugins/morris/morris.css">
	<!-- jvectormap -->
	<link rel="stylesheet" href="/static/plugins/jvectormap/jquery-jvectormap-1.2.2.css">
	<!-- Date Picker -->
	<link rel="stylesheet" href="/static/plugins/datepicker/datepicker3.css">
	<!-- Daterange picker -->
	<link rel="stylesheet" href="/static/plugins/daterangepicker/daterangepicker-bs3.css">
	<!-- bootstrap wysihtml5 - text editor -->
	<link rel="stylesheet" href="/static/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">
	<!-- Google Font: Source Sans Pro -->
	<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
	<!-- daterange picker -->
	<!-- iCheck for checkboxes and radio inputs -->
	<link rel="stylesheet" href="/static/plugins/iCheck/all.css">
	<!-- Bootstrap Color Picker -->
	<link rel="stylesheet" href="/static/plugins/colorpicker/bootstrap-colorpicker.min.css">
	<!-- Bootstrap time Picker -->
	<link rel="stylesheet" href="/static/plugins/timepicker/bootstrap-timepicker.min.css">
	<!-- Select2 -->
	<link rel="stylesheet" href="/static/plugins/select2/select2.min.css">
</head>
<body class="hold-transition sidebar-mini">
  <!-- Navbar -->
  <nav class="main-header navbar navbar-expand bg-white navbar-light border-bottom">
    <!-- Right navbar links -->
    <ul class="navbar-nav ml-auto">
      <!-- Messages Dropdown Menu -->
      <li class="nav-item dropdown">
        <a class="btn btn-sm" href="/graduate/logout">
          	退出
        </a>
      </li>
    </ul>
  </nav>
  <!-- /.navbar -->
<div class="tlinks"></div>
  <!-- Main Sidebar Container -->
  <aside class="main-sidebar sidebar-dark-primary elevation-4">
    <!-- Brand Logo -->
    <a href="index3.html" class="brand-link">
      <img src="/static/dist/img/AdminLTELogo.png" alt="AdminLTE Logo" class="brand-image img-circle elevation-3"
           style="opacity: .8">
      <span class="brand-text font-weight-light">汽车租赁平台</span>
    </a>

    <!-- Sidebar -->
    <div class="sidebar">
      <!-- Sidebar user panel (optional) -->
      <div class="user-panel mt-3 pb-3 mb-3 d-flex">
        <div class="image">
          <img src="/static/dist/img/user2-160x160.jpg" class="img-circle elevation-2" alt="User Image">
        </div>
        <div class="info">
          <a href="#" class="d-block">${currentUser.name }</a>
        </div>
      </div>

      <!-- Sidebar Menu -->
      <nav class="mt-2">
        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
          <!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
          <li class="nav-item">
            <a href="/graduate/user/person" class="nav-link">
              <i class="nav-icon fa fa-circle-o text-primary"></i>
              <p>
               	 个人信息
              </p>
            </a>
          </li>
          <c:if test="${currentUser.auth == '2' }">
	          <li class="nav-item">
	            <a href="/graduate/car/rentlist" class="nav-link">
	              <i class="nav-icon fa fa-circle-o text-danger"></i>
	              <p>
	               	租赁列表
	              </p>
	            </a>
	          </li>
	          <li class="nav-item">
	            <a href="/graduate/orders/list" class="nav-link">
	              <i class="nav-icon fa fa-circle-o text-warning"></i>
	              <p>
	               	 我的订单
	              </p>
	            </a>
	          </li>
          </c:if>
          <c:if test="${currentUser.auth == '0' }">
	          <li class="nav-item has-treeview">
	            <a href="#" class="nav-link">
	              <i class="nav-icon fa fa-circle-o text-info"></i>
	              <p>
	               	 用户管理
	                <i class="right fa fa-angle-left"></i>
	              </p>
	            </a>
	            <ul class="nav nav-treeview">
	              <li class="nav-item">
	                <a href="/graduate/user/list?auth=2" class="nav-link">
	                  <i class="fa fa-circle-o nav-icon"></i>
	                  <p>会员管理</p>
	                </a>
	              </li>
	              <li class="nav-item">
	                <a href="/graduate/user/list?auth=1" class="nav-link">
	                  <i class="fa fa-circle-o nav-icon"></i>
	                  <p>员工管理</p>
	                </a>
	              </li>
	            </ul>
	          </li>
	          <li class="nav-item">
	            <a href="/graduate/orders/list" class="nav-link">
	              <i class="nav-icon fa fa-circle-o text-warning"></i>
	              <p>
	               	 订单记录
	              </p>
	            </a>
	          </li>
          </c:if>
          <c:if test="${currentUser.auth == '1' }">
	          <li class="nav-item">
	            <a href="/graduate/car/list" class="nav-link">
	              <i class="nav-icon fa fa-circle-o text-success"></i>
	              <p>
	               	 车辆管理
	              </p>
	            </a>
	          </li>
	          <li class="nav-item">
	            <a href="/graduate/maintain/list" class="nav-link">
	              <i class="nav-icon fa fa-circle-o text-warning"></i>
	              <p>
	               	 车辆保养
	              </p>
	            </a>
	          </li>
	          <li class="nav-item">
	            <a href="/graduate/safe/list" class="nav-link">
	              <i class="nav-icon fa fa-circle-o text-danger"></i>
	              <p>
	               	 车辆保险
	              </p>
	            </a>
	          </li>
	          <li class="nav-item">
	            <a href="/graduate/repair/list" class="nav-link">
	              <i class="nav-icon fa fa-circle-o text-info"></i>
	              <p>
	               	 车辆维修
	              </p>
	            </a>
	          </li>
	          <li class="nav-item">
	            <a href="/graduate/rules/list" class="nav-link">
	              <i class="nav-icon fa fa-circle-o text-success"></i>
	              <p>
	               	 车辆违章
	              </p>
	            </a>
	          </li>
          </c:if>
        </ul>
      </nav>
      <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
  </aside>
<!-- ./wrapper -->

<!-- jQuery -->
<script src="/static/plugins/jquery/jquery.min.js"></script>
<!-- jQuery UI 1.11.4 -->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
<script>
  $.widget.bridge('uibutton', $.ui.button)
</script>
<!-- Bootstrap 4 -->
<script src="/static/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- Morris.js charts -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
<script src="/static/plugins/morris/morris.min.js"></script>
<!-- Sparkline -->
<script src="/static/plugins/sparkline/jquery.sparkline.min.js"></script>
<!-- jvectormap -->
<script src="/static/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
<script src="/static/plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
<!-- jQuery Knob Chart -->
<script src="/static/plugins/knob/jquery.knob.js"></script>
<!-- daterangepicker -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.10.2/moment.min.js"></script>
<script src="/static/plugins/daterangepicker/daterangepicker.js"></script>
<!-- datepicker -->
<script src="/static/plugins/datepicker/bootstrap-datepicker.js"></script>
<!-- Bootstrap WYSIHTML5 -->
<script src="/static/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
<!-- Slimscroll -->
<script src="/static/plugins/slimScroll/jquery.slimscroll.min.js"></script>
<!-- FastClick -->
<script src="/static/plugins/fastclick/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="/static/dist/js/adminlte.js"></script>
<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
<script src="/static/dist/js/pages/dashboard.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="/static/dist/js/demo.js"></script>
<!-- DataTables -->
<script src="/static/plugins/datatables/jquery.dataTables.min.js"></script>
<script src="/static/plugins/datatables/dataTables.bootstrap4.min.js"></script>
<!-- SlimScroll -->
<script src="/static/dist/js/adminlte.min.js"></script>
<!-- jQuery -->
<script src="/static/plugins/jquery/jquery.min.js"></script>
<!-- Select2 -->
<script src="/static/plugins/select2/select2.full.min.js"></script>
<!-- InputMask -->
<script src="/static/plugins/input-mask/jquery.inputmask.js"></script>
<script src="/static/plugins/input-mask/jquery.inputmask.date.extensions.js"></script>
<script src="/static/plugins/input-mask/jquery.inputmask.extensions.js"></script>
<!-- date-range-picker -->
<!-- bootstrap color picker -->
<script src="/static/plugins/colorpicker/bootstrap-colorpicker.min.js"></script>
<!-- bootstrap time picker -->
<script src="/static/plugins/timepicker/bootstrap-timepicker.min.js"></script>
<!-- SlimScroll 1.3.0 -->
<!-- iCheck 1.0.1 -->
<script src="/static/plugins/iCheck/icheck.min.js"></script>
<!-- Page script -->
<script>
  $(function () {
    $("#example1").DataTable();
    $('#example2').DataTable({
      "paging": true,
      "lengthChange": false,
      "searching": false,
      "ordering": true,
      "info": true,
      "autoWidth": false
    });
  });
  
  //删除方法
  function confirmx(message, href) {
      if (confirm(message)){
      	window.location.href = href;
      }
      return false;
  }; 
  
  $('input[type="checkbox"].flat-red, input[type="radio"].flat-red').iCheck({
      checkboxClass: 'icheckbox_flat-green',
      radioClass   : 'iradio_flat-green'
    })
</script>
<style>
	.control-label{
		margin-left: 50px;
		margin-top: 7px;
	}
	.control-button{
		margin-left: 218px;
	}
</style>
</body>
</html>
