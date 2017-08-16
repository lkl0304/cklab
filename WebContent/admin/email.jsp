<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="header.jsp"/>
<script type="text/javascript">
	// 改变侧边栏激活
	changeTab(4);
</script>
<div class="admin-content">
	<div class="admin-box">
		<div class="col-lg-12 col-xs-12">
			<h4 class="pull-left"><a href="email">邮箱管理</a></h4>
			<div class="pull-right">
				<form id="searchform" action="email" method="post">
					<input name="name" type="text" placeholder="发件人">
					<button type="submit" style="border-radius: 5px;" class="btn btn-default btn-sm">搜索</button>
				</form>
			</div>
		</div>

		<div>
			<div class="col-lg-4 col-sm-4 col-xs-12">
				<div class="box-min" style="background-image: url('<%=request.getContextPath() %>/images/admin/mail.png');">
					<div>
						<p>总邮件数</p>
						<p><strong>${requestScope.rows }</strong></p>
						<p><a href="email" class="a-btn">查看</a></p>
					</div>
				</div>
			</div>

			<div class="col-lg-4 col-sm-4 col-xs-12">
				<div class="box-min" style="background-image: url('<%=request.getContextPath() %>/images/admin/mail_yd.png');">
					<div>
						<p>已读邮件</p>
						<p><strong>${requestScope.open }</strong></p>
						<p><a href="email?status=1" class="a-btn">查看</a></p>
					</div>
				</div>
			</div>

			<div class="col-lg-4 col-sm-4 col-xs-12">
				<div class="box-min"  style="background-image: url('<%=request.getContextPath() %>/images/admin/mail_wd.png');">
					<div>
						<p>未读邮件</p>
						<p><strong>${requestScope.close }</strong></p>
						<p><a href="email?status=0" class="a-btn">查看</a></p>
					</div>
				</div>
			</div>
		</div>
		
		<div class="col-lg-12 col-xs-12 table-responsive">
			<table class="table-bordered table table-striped">
				<thead>
					<tr>
						<td>发件人</td>
						<td>电话</td>
						<td>邮箱</td>
						<td>发送时间</td>
						<td>状态</td>
						<td>操作</td>
					</tr>
				</thead>
				<c:if test="${requestScope.fyrows <= 0 }">
					<tr style="text-align: center;">
						<td colspan="6">${requestScope.fyrows == -1?'无该记录':'暂无数据' } </td>
					</tr>
				</c:if>
				<c:forEach items="${requestScope.emails }" var="email" varStatus="in">
					<tr>
						<td id="emn">${email.name }</td>
						<td>${email.tel }</td>
						<td>${email.email }</td>
						<td>${email.time }</td>
						<td id="status">${email.status == 0?'<span class="label label-warning">未读</span>':'<span class="label label-success">已读</span>' }</td>
						<td style="width: 150px;">						
							<button value="${email.content }" data-id="${email.id}" class="btn btn-xs btn-info" data-toggle="popover">详情</button>
	             			<button onclick="del(${email.id });" class="btn btn-xs btn-danger">删除</button>
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<!-- 分页按钮 -->
		<c:if test="${requestScope.pages > 1}">
		<div class="col-lg-12 col-xs-12 text-center">
			<ul class="pagination">
				<li class="${(requestScope.pageNo == 1 || requestScope.fyrows <= 0)?'disabled':'' }"><a href="javascript:void(0)" onclick="Goto(1);">首页</a></li>
				<li class="${(requestScope.pageNo == 1 || requestScope.fyrows <= 0)?'disabled':'' }"><a href="javascript:void(0)" onclick="Goto(${requestScope.pageNo - 1});">&laquo;</a></li>
				<c:forEach var="i" begin="1" end="${requestScope.pages }">
					<c:if test="${i <= 10 }">
						<li class="${requestScope.pageNo == i?'active':'' }"><a href="javascript:void(0)" onclick="Goto(${i});">${i}</a></li>
					</c:if>
					<c:if test="${i == 11 }">
						<li class="${requestScope.pageNo >= i?'active':'' }"><a onclick="Goto(${requestScope.pages});">..${requestScope.pages}</a></li>
					</c:if>
				</c:forEach>
				<c:if test="${requestScope.fyrows <= 0 }">
					<li class="disabled"><a href="javascript:void(0)">1</a></li>
				</c:if>
				<li class="${(requestScope.pageNo == requestScope.pages || requestScope.fyrows <= 0)?'disabled':'' }"><a href="javascript:void(0)" onclick="Goto(${requestScope.pageNo + 1});">&raquo;</a></li>
				<li class="${(requestScope.pageNo == requestScope.pages || requestScope.fyrows <= 0)?'disabled':'' }"><a href="javascript:void(0)" onclick="Goto(${requestScope.pages});">尾页</a></li>
			</ul>
		</div>
		</c:if>
	</div>
</div>
<script>
	function Goto(page) {
		if (page <= ${requestScope.pages } && page > 0) {
			if (${requestScope.status > 1 }) {
				location.href = "email?pageNo=" + page;
			} else {
				location.href = "email?status=" + ${requestScope.status } + "&pageNo=" + page;
			}
		}
	}
	
	// 删除邮件
	function del(id){
		$.post('deleml', {id: id}, function(data) {
			if (data.length > 1) {
				alert("删除成功！");
				Goto(${requestScope.pageNo });
			}
		});
	}
	// 搜索信息
	$('#searchform').submit(function(event) {
		var name = $(this).find('input').val();
		if (name.length <= 0) {
			event.preventDefault();
		}
	});
	
	$("[data-toggle='popover']").popover({  // 通过弹出框查看邮件
		html: true,
		 trigger: "click", //focus hover
		 placement: "left",
		 container: 'body',
		 title: function () {
			 var name = $('#emn').text();
			 return "<strong>发件人: </strong> " + name;
		},
		 content: function () {
			 $(this).text("隐藏");
			 var text = $(this).attr('value');
			 return "<p><strong>详细内容: </strong></p><div style='min-width: 200px;'><p>" +
			 text + "</p></div>";
		}
	}).on('hide.bs.popover', function () {
		$(this).text("详情").parent('td').prev('td').html('<span class="label label-success">已读</span>');
	}).on('show.bs.popover', function(event) {
		var $btns = $("[data-toggle='popover']");
		var i = $.inArray(this, $btns);
		
		$.each($btns, function(index, val) {
			if (index != i && $(val).text() == "隐藏") {
				$(val).click();
			}
		});
		var id = $(this).attr('data-id');
		$.post('setseml', {id: id });
	});
</script>
<jsp:include page="footer.jsp"/>
