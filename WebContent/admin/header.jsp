<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<title>创客后台</title>
	<link rel="shortcut icon" href="<%=request.getContextPath() %>/images/favicon.ico" />

	<link rel="stylesheet" href="<%=request.getContextPath() %>/bootstrap/css/bootstrap.css">
	<link rel="stylesheet" href="<%=request.getContextPath() %>/style/css/admin_mian.css">
	<script type="text/javascript" src="<%=request.getContextPath() %>/bootstrap/js/jquery.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/bootstrap/js/bootstrap.js"></script>
	
</head>
<body style="margin: 70px 0 0 230px;">
<div style="position: relative;">
	<header class="admin-header">
		<div class="header-left">
			创客 Lab
		</div>
		<div class="header-right">
			<a onclick="xgW();" href="javascript:void(0);">
				<span class="glyphicon glyphicon-tasks"></span>
			</a>
			<div class="dropdown pull-right">
				<a href="javascript:void(0);" class="dropdown-toggle" type="button" data-toggle="dropdown">
					<img src="<%=request.getContextPath() %>/images/admin/more1.png" height="30">
				</a>
				<ul class="dropdown-menu">
				    <li><a href="<%=request.getContextPath() %>" target="_blank"><span class="glyphicon glyphicon-eye-open"></span> 查看网站</a></li>
				    <li><a href="<%=request.getContextPath() %>/admin/logoutad"><span class="glyphicon glyphicon-log-out"></span> 注销</a></li>
				</ul>
			</div>
		</div>
	</header>
	
	<div class="admin-side">
		<ul>
			<li class="active"><a href="<%=request.getContextPath() %>/admin"><span class="glyphicon glyphicon-asterisk"></span> 仪表盘</a></li>
			<li><a href="<%=request.getContextPath() %>/admin/article/publish"><span class="glyphicon glyphicon-pencil"></span> 发布文章</a></li>
			<li><a href="<%=request.getContextPath() %>/admin/article"><span class="glyphicon glyphicon-list-alt"></span> 文章管理</a></li>
			<li><a href="<%=request.getContextPath() %>/admin/member"><span class="glyphicon glyphicon-picture"></span> 成员管理</a></li>
			<li><a href="<%=request.getContextPath() %>/admin/email"><span class="glyphicon glyphicon-envelope"></span> 邮箱管理</a></li>
			<li><a href="<%=request.getContextPath() %>/admin/setting"><span class="glyphicon glyphicon-cog"></span> 系统设置</a></li>
		</ul>
	</div>
	
	<script type="text/javascript" src="<%=request.getContextPath() %>/style/js/admin.js"></script>
	<script type="text/javascript">
		function xgW() {
			var boxW = $('.header-left').outerWidth();
			$.post('<%=request.getContextPath() %>/admin/setWidthad', {width: 300 - boxW});
		}
		Auto(${sessionScope.Width }); // 自动改变侧边栏宽度
	</script>
	
	