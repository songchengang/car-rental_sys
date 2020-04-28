<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
</head>
<body>
<div class="modal fade orderspj-modal" tabindex="-1" role="dialog" aria-labelledby="orderspj-modal">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="card-title">订单评价</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal orderspj_form">
                	<input type="hidden" name="id" >
                    <div class="form-group">
                        <label for="add_age" class="col-3">评价内容</label>
                        <div class="col-12">
                            <textarea type="text" name="evaluate" class="form-control"></textarea>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary orderspj_btn">提交</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<script type="text/javascript">
    <!-- ==========================用户修改操作=================================== -->
    function orderspj(id) { 
		$(".orderspj_form input[name='id']").val(id);
    };

    $(".orderspj_btn").click(function () {
        $.ajax({
            url:"/graduate/orders/setpj/",
            type:"post",
            data:$(".orderspj_form").serialize(),
            success:function (result) {
                if (result.code==100){
                    alert("评价提交成功！");
                    $('.modal-backdrop').remove();
                    window.location.href="/graduate/orders/list";
                }else {
                	alert(result.msg);
                }
            }
        });

    });
</script>
</body>
</html>
