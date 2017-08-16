<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="<%=request.getContextPath() %>/bootstrap/css/bootstrap.css">
	<script type="text/javascript" src="<%=request.getContextPath() %>/bootstrap/js/jquery.js"></script>
	<title>管理员登录</title>
	<style type="text/css">
		.myform {
			width: 300px;
			margin: 8vh auto;
			text-align: center;
			font-family: "隶书";
		}
	</style>
</head>
<body>
	<div class="container">
		<div class="myform">
			<div>
				<h1 class="text-info" style="font-size: 160px;">CK</h1>
			</div>
			<h4>欢迎登录</h4>
			<form method="post">
                <div class="form-group">
                    <input type="text" class="form-control" name="admin.name" placeholder="用户名" required="required">
                </div>
                <div class="form-group">
                    <input type="password" class="form-control" name="admin.pass" placeholder="密码" required="required">
                </div>
                <div class="pull-right">
					<label for="bao">
						<input id="bao" type="checkbox" name="admin.remember" value="true" checked="checked">记住密码&nbsp;
					</label>
				</div>
                <button type="submit" class="btn btn-info btn-group-justified">登 录</button>
                <!-- p class="text-muted text-center"> <a href="#"><small>忘记密码了？</small></a> | <a href="#"><small>注册一个新账号</small></a></p -->
            </form>
		</div>
	</div>
	<script type="text/javascript">
		$('form').submit(function(event) {
			event.preventDefault();
			var data = $('form').serialize();
			console.log(data)
			$.post('loginad', data, function(data) {
				if (data.length > 1) {
					alert('登录成功！')
					location.href = '../admin';
				} else {
					alert('登录失败！')
				}
			});
		});
	</script>
</body>
</html>