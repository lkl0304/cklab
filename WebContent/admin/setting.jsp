<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="header.jsp"/>
<script type="text/javascript">
	// 改变侧边栏激活
	changeTab(5);
</script>
<div class="admin-content">
	<div class="admin-box">
		<div class="col-lg-12 col-xs-12">
			<h4 style="padding-left: 15px;">系统设置</h4>
		</div>

		<div style="max-height: 480px;" class="col-lg-6 col-xs-6">
			<div class="panel panel-danger">
				<div class="panel-heading">
					<span class="">更改账号</span>
				</div>
				<div class="panel-body">
					<form id="xgmfrom" class="form-horizontal">
						<div class="form-group">
							<label for="opass" class="text-left col-sm-3 control-label">新账号</label>
							<div class="col-sm-9">
								<input type="text" name="nAdmin.name" class="form-control" id="op" placeholder="新账号">
								<span></span>
							</div>
						</div>
						<div class="form-group">
							<label for="npass1" class="text-left col-sm-3 control-label">新密码</label>
							<div class="col-sm-9">
								<input type="password" name="nAdmin.pass" class="form-control" id="np1" placeholder="新密码">
								<span id="xpass"></span>
							</div>
						</div>
						<div class="form-group">
							<label for="npass2" class="text-left col-sm-3 control-label">确定密码</label>
							<div class="col-sm-9">
								<input type="password" class="form-control" id="np2" placeholder="确定密码">
								<span id="xpass2"></span>
							</div>
						</div>
						<input id="xgma" type="button" value="确定修改" class="btn btn-danger btn-group-justified">
					</form>
				</div>
			</div>
		</div>
		
	</div>
</div>
<script type="text/javascript">
	var opt = 0;
	$('#op').blur(function(event) {
		var val = $(this).val();
		if (val == "") {
			$(this).next('span').text('请输入新账号');
		} else if (/\W/.test(val)) {
			$(this).next('span').text('账号不能出现汉字');
		} else if (val.length < 6) {
			$(this).next('span').text('账号最少6位');
		} else {
			opt++;
		}
	}).focus(function(event) {
		$(this).next('span').text('');
	});
	$('#np1').blur(function(event) {
		var val = $(this).val();
		if (val == "") {
			$(this).next('span').text('请输入新密码');
		} else if (/\W/.test(val)) {
			$(this).next('span').text('密码不能出现汉字');
		} else if (val.length < 6) {
			$(this).next('span').text('密码最少6位');
		} else {
			opt++;
		}
	}).focus(function(event) {
		$(this).next('span').text('');
	});
	$('#np2').blur(function(event) {
		var val0 = $('#np1').val();
		var val = $(this).val();
		if (val == "") {
			$(this).next('span').text('不能为空');
		} else if (val !== val0) {
			$(this).next('span').text('两次密码不一样');
		} else {
			opt++;
		}
	}).focus(function(event) {
		$(this).next('span').text('');
	});
	$('#xgma').on('click', function (event) {
		event.preventDefault();
		console.log(opt)
		if (opt >= 3) {
			var data = $('#xgmfrom').serializeArray();
			$.post('changead', data, function(data) {
				if (data.length > 1) {
					alert('修改成功！返回重新登录');
					location.href="../admin";
				} else {
					alert("修改失败！");
				}
			});
		}
	});
	
</script>
<jsp:include page="footer.jsp"/>
