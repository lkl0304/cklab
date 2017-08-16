<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="header.jsp"/>
<script type="text/javascript">
	// 改变侧边栏激活
	changeTab(3);
</script>
<style>
	.min-inp { height: 34px; border: 1px solid #ccc; border-radius: 4px; }
</style>

<!-- 模态框 不能放在admin-content中 z-index值有影响 -->
	<div class="modal fade" id="MemModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div style="position: relative;" class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						&times;
					</button>
					<h4 class="modal-title" id="myModalLabel">
						添加新成员
					</h4>
					<div id="alert" style="position: absolute; top: 2px; left: 25%; width: 50%; display: none;" class="alert alert-warning">
						<strong>ERROR：</strong><span> </span>
					</div>
				</div>
				<div class="modal-body">
					<form id="memForm">
						<table style="margin: 0;" class="table">
							<thead>
								<tr>
									<td>姓名</td>
									<td>性别</td>
									<td>年级</td>
									<td>电话</td>
									<td>生日</td>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td style="display: none;"><input type="hidden" name="member.id"></td>
									<td><input maxlength="4" name="member.name" type="text" class="form-control"></td>
									<td>
										<select class="min-inp" name="member.sex">
											<option>男</option>
											<option>女</option>
										</select>
									</td>
									<td><input name="member.grade" type="text" class="form-control" maxlength="15"></td>
									<td><input name="member.tel" type="text" class="form-control" maxlength="11"></td>
									<td><input name="member.birth" type="text" class="form-control" maxlength="15"></td>
								</tr>
							</tbody>
						</table>
					</form>
				</div>
				<div class="modal-footer">
					<!-- button type="button" class="btn btn-default" data-dismiss="modal">关闭</button-->
					<button id="addMember" onclick="add();" type="button" class="btn btn-info">确定添加</button>
				</div>
			</div><!-- /.modal-content -->
		</div><!-- /.modal -->
	</div>

<div class="admin-content">

	<div class="admin-box">
		<div class="col-lg-12 col-xs-12">
			<h4 class="pull-left"><a href="member">成员管理</a></h4>
			<div class="pull-right">
				<form id="searchform" action="member" method="post">
					<input name="name" type="text" placeholder="姓名">
					<button type="submit" style="border-radius: 5px;" class="btn btn-default btn-sm">搜索</button>
					<a style="border-radius: 5px;" onclick="addOpen();" href="javascript:void(0)" class="btn btn-info btn-sm">添加新成员</a>
				</form>
			</div>
		</div>
		
		<div class="col-lg-12 col-xs-12 table-responsive">
			<table class="table-bordered table table-striped">
				<thead>
					<tr>
						<td>姓名</td>
						<td>性别</td>
						<td>年级</td>
						<td>电话</td>
						<td>生日</td>
						<td>操作</td>
					</tr>
				</thead>
				<c:if test="${requestScope.rows <= 0 }">
					<tr style="text-align: center;">
						<td colspan="6">${requestScope.rows == -1?'无该记录':'暂无数据' }</td>
					</tr>
				</c:if>
				<c:forEach items="${requestScope.members }" var="mem" varStatus="in">
					<tr id="mem_${mem.id }">
						<td style="display: none;">${mem.id }</td>
						<td>${mem.name }</td>
						<td>${mem.sex }</td>
						<td>${mem.grade }</td>
						<td>${mem.tel }</td>
						<td>${mem.birth }</td>
						<td style="width: 150px;">
							<button onclick="edit(${mem.id });" class="btn btn-xs btn-success">编辑</button>
							<button onclick="del(${mem.id });" class="btn btn-xs btn-danger">删除</button>
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<!-- 分页按钮 -->
		<c:if test="${requestScope.pages > 1}">
		<div class="col-lg-12 col-xs-12 text-center">
			<ul class="pagination">
				<li class="${(requestScope.pageNo == 1 || requestScope.rows <= 0)?'disabled':''}"><a href="javascript:void(0)" onclick="Goto(1);">首页</a></li>
				<li class="${(requestScope.pageNo == 1 || requestScope.rows <= 0)?'disabled':'' }"><a href="javascript:void(0)" onclick="Goto(${requestScope.pageNo - 1});">&laquo;</a></li>
				<c:forEach var="i" begin="1" end="${requestScope.pages}">
					<c:if test="${i <= 10 }">
						<li class="${requestScope.pageNo == i?'active':'' }"><a href="javascript:void(0)" onclick="Goto(${i});">${i}</a></li>
					</c:if>
					<c:if test="${i == 11 }">
						<li class="${requestScope.pageNo >= i?'active':'' }"><a onclick="Goto(${requestScope.pages});">..${requestScope.pages}</a></li>
					</c:if>
				</c:forEach>
				<c:if test="${requestScope.rows <= 0 }">
					<li class="disabled"><a href="javascript:void(0)">1</a></li>
				</c:if>
				<li class="${(requestScope.pageNo == requestScope.pages || requestScope.rows <= 0)?'disabled':'' }"><a href="javascript:void(0)" onclick="Goto(${requestScope.pageNo + 1});">&raquo;</a></li>
				<li class="${(requestScope.pageNo == requestScope.pages || requestScope.rows <= 0)?'disabled':'' }"><a href="javascript:void(0)" onclick="Goto(${requestScope.pages});">尾页</a></li>
			</ul>
		</div>
		</c:if>
	</div>
</div>
<script type="text/javascript">
	// 页面跳转
	function Goto(page) {
		if (page <= ${requestScope.pages } && page > 0) {
			location.href = "member?pageNo=" + page;
		}
	}
	// 添加成员
	function add() {
		if (CheckForm()) {
			$('div[role="dialog"]').on('hide.bs.modal',function() { // 添加监听事件
				location.href = "member?pageNo=" + ${requestScope.pageNo };
			})
			
			var data = $('#memForm').serialize();
			$.post('addmem', data, function(data) {
				if (data.length > 1) {
					$('#alert').removeClass('alert-warning').addClass('alert-success').html('添加成功！').fadeIn(200);
					setTimeout(function() {
						$('div[role="dialog"]').modal('hide'); //关闭模态框
						$('#alert').fadeOut(1).removeClass('alert-success').addClass('alert-warning').html('<strong>ERROR：</strong><span></span>');
					}, 1000);
				}
			});
		}
	}
	// 删除成员
	function del(id) {
		$.post('delmem', {id: id}, function(data) {
			if (data.length > 1) {
				alert("删除成功！");
				location.href = "member?pageNo=" + ${requestScope.pageNo};
			}
		});
	}
	// 修改信息
	function change() {
		var jsonTextInit = JSON.stringify({ dataform: $("#memForm").serializeArray() });  // 将表单转化为json格式保存
		if (CheckForm()) {
			if (JSON.stringify({ dataform: $("#memForm").serializeArray() }) == jsonTextInit) {
				$('#alert').fadeIn(200).find('span').text('内容没有改变！');
			} else {
				$('div[role="dialog"]').on('hide.bs.modal',function() { // 添加监听事件
					location.href = "member?pageNo=" + ${requestScope.pageNo};
				});
				var data = $('#memForm').serialize();
				$.post('changemem', data, function(data) {
					if (data.length > 1) {
						$('#alert').removeClass('alert-warning').addClass('alert-success').html('修改成功！').fadeIn(200);
						setTimeout(function() {
							$('div[role="dialog"]').modal('hide'); //关闭模态框
							$('#alert').fadeOut(1).removeClass('alert-success').addClass('alert-warning').html('<strong>ERROR：</strong><span></span>');
						}, 1000);
					}
				});
			}
		}
		
	};
	// 搜索信息
	$('#searchform').submit(function(event) {
		var name = $(this).find('input').val();
		if (name.length <= 0) {
			event.preventDefault();
		}
	});
	// 启动编辑模态框
	function edit(id){
		var $otds = $('#mem_' + id + '> td');

		var $memForm = $('#memForm');
		var $ntds = $memForm.find('tbody > tr > td');

		$.each($ntds, function(index, val) {
			if (index == 2) {
				if ($otds.eq(index).text() == '女') {
					$(val).find('select > option').eq(1).attr('selected', 'selected');
					$(val).find('select > option').eq(0).removeAttr('selected');
				} else {
					$(val).find('select > option').eq(0).attr('selected', 'selected');
					$(val).find('select > option').eq(1).removeAttr('selected');
				}
			} else {
				$(val).find('input').val($otds.eq(index).text());
			}
		});
		
		$('#myModalLabel').text('修改成员信息'); $('#addMember').text('保存修改').attr('onclick', 'change();');
		$('div[role="dialog"]').modal('show');
	}
	// 启动添加模态框
	function addOpen() {
		$('div[role="dialog"]').modal('show');
	}
	// 模态框事件监听
	$('div[role="dialog"]').on('hidden.bs.modal', function() {
		$('div[role="dialog"]').off('hide.bs.modal');
		$.each($('#memForm').find('tbody > tr > td'), function(index, val) {
			$(val).find('input').val('');
		});
		$('#alert').fadeOut(200);
		$('#myModalLabel').text('添加新成员'); $('#addMember').text('确定添加').attr('onclick', 'add();');
	});
	
	function CheckForm() {
		var telreg = /^1[34578]\d{9}$/;
		var name = $('input[name="member.name"]').val();
		var grade = $('input[name="member.grade"]').val();
		var tel = $('input[name="member.tel"]').val();
		var birth = $('input[name="member.birth"]').val();
		if (name.length < 1) {
			$('#alert').fadeIn(200).find('span').text('姓名不能为空！');
		} else if (grade.length < 1) {
			$('#alert').fadeIn(200).find('span').text('年级不能为空！');
		} else if (!telreg.test(tel)) {
			$('#alert').fadeIn(200).find('span').text('手机号格式不正确!');
		} else if (birth.length < 1) {
			$('#alert').fadeIn(200).find('span').text('生日不能为空！');
		} else {
			return true;
		}
		return false;
	}
	$('#memForm').find('input').focus(function(event) {
		$('#alert').fadeOut(200);
	});
</script>
<jsp:include page="footer.jsp"/>
