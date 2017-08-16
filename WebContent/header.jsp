<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
 	<title>软件开发创客实验室</title>
 	<link rel="shortcut icon" href="<%=request.getContextPath() %>/images/favicon.ico" />
	<!-- bootstrap jquery框架 -->
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/bootstrap/css/bootstrap.css">
	<script type="text/javascript" src="<%=request.getContextPath() %>/bootstrap/js/jquery.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/bootstrap/js/bootstrap.js"></script>

	<!-- 自定义样式表 -->
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/style/css/public.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/style/css/header.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/style/css/footer.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/style/css/link.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/style/css/default.css">
	
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/style/css/solution.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/style/css/result.css">
	
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/style/css/join.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/style/css/contact.css">
	<!-- 自定义js脚本 -->
	<script type="text/javascript" src="<%=request.getContextPath() %>/style/js/index.js"></script>

</head>
<body>
	<header>
		<div id="top" class="header-top">
			<div class="visible-xs"> <!-- 响应式小屏幕显示 -->
				<div class="pull-left">
					<a href="<%=request.getContextPath() %>/index"><img src="<%=request.getContextPath() %>/images/header/menu-l.png" alt="大数据" height="30" width="30"></a>
				</div>
				<div class="pull-right">
					<img id="menu" class="btn" src="<%=request.getContextPath() %>/images/header/menu.png" alt="菜单" height="35" width="30">
					<ul class="list-unstyled menu">
						<li><a href="<%=request.getContextPath() %>/news">创客动态</a></li>
						<li><a href="<%=request.getContextPath() %>/notice">通知公告</a></li>
						<li><a href="<%=request.getContextPath() %>/solution">培养方案</a></li>
						<li><a href="<%=request.getContextPath() %>/result">成果展示</a></li>
						<li><a href="<%=request.getContextPath() %>/about">关于我们</a></li>
						<li><a href="<%=request.getContextPath() %>/join">加入我们</a></li>
						<li><a href="<%=request.getContextPath() %>/contact">联系我们</a></li>
					</ul>
				</div>
				<script type="text/javascript">
					$('#menu').click(function(event) {
						$('.menu').slideToggle(300);
					});
				</script>
			</div>
		</div>
		<div class="container">
			<div class="header-body">
				<div style="width: 100%;" class="visible-xs text-center"> <!-- 响应式小屏幕显示 -->
					<img src="<%=request.getContextPath() %>/images/logo.png" height="254">
				</div>
				<div class="hidden-xs"> <!-- 响应式大屏幕显示 -->
					<a href="<%=request.getContextPath() %>/index"><img src="<%=request.getContextPath() %>/images/logo.png" height="50"></a>
				</div>
				<div class="hidden-xs">
					<div style="background: url('<%=request.getContextPath() %>/images/header/tel.png') no-repeat 0 10px; background-size: 25px 25px;">
						<strong>0654 ********</strong><br>
						<span>周一~周五, 9:00 - 20:00</span>
					</div>
					<div style="background: url('<%=request.getContextPath() %>/images/header/mail.png') no-repeat 0 10px; background-size: 25px 25px;">
						<strong>Timmhc@qq.com</strong><br>
                        <span>随时欢迎您的来信！</span>
					</div>
					<div style="background: url('<%=request.getContextPath() %>/images/header/addr.png') no-repeat 0 10px; background-size: 25px 25px;">
						<strong>WanXi University</strong><br>
                        <span>明德楼415室</span>
					</div>
				</div>
			</div>
		</div>
		<div class="header-nav hidden-xs"> <!-- 响应式小屏幕隐藏 -->
			<div class="container">
				<ul style="margin: 0 0 -6px 0;" class="list-inline">
					<li><a href="<%=request.getContextPath() %>/index">首页</a></li>
					<li><a href="<%=request.getContextPath() %>/news">创客动态</a></li>
					<li><a href="<%=request.getContextPath() %>/notice">通知公告</a></li>
					<li><a href="<%=request.getContextPath() %>/solution">培养方案</a></li>
					<li><a href="<%=request.getContextPath() %>/result">成果展示</a></li>
					<li><a href="<%=request.getContextPath() %>/about">关于我们</a></li>
					<li><a href="<%=request.getContextPath() %>/join">加入我们</a></li>
					<li><a href="<%=request.getContextPath() %>/contact">联系我们</a></li>
				</ul>
			</div>
		</div>
	</header>
	<div class="return-top">
		<a href="#top" title="返回顶部"></a>
	</div>
	<script type="text/javascript">
		$(window).scroll(function(event) {
			if ($(window).scrollTop() > $(window).height()/1.5) {
				$('.return-top').css('right', '25px');
			} else {
				$('.return-top').css('right', '-45px');
			}
		});
	</script>