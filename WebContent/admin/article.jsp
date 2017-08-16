<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="header.jsp"/>
<script type="text/javascript">
	// 改变侧边栏激活
	changeTab(2);
</script>
<div class="admin-content">
	<div class="admin-box">
		<div class="col-lg-12 col-xs-12">
			<h4 class="pull-left"><a href="article">文章管理</a></h4>
			<div class="pull-right">
				<form id="searchform" action="article" method="post">
					<input name="title" type="text" placeholder="标题">
					<button type="submit" style="border-radius: 5px;" class="btn btn-default btn-sm">搜索</button>
				</form>
			</div>
		</div>
		
		<div>
			<div class="col-lg-3 col-sm-3 col-xs-12">
				<div class="box-min"  style="background-image: url('<%=request.getContextPath() %>/images/admin/art.png');">
					<div>
						<p>文章总数<a href="article" class="a-btn"><strong>&nbsp;${requestScope.AllNum }&nbsp;</strong></a></p>
						<p>已发布<strong>&nbsp;${requestScope.AllPut }&nbsp;</strong></p>
						<p>未发布<strong>&nbsp;${requestScope.AllDraft }&nbsp;</strong></p>
	 				</div>
				</div>
			</div>
			
			<div class="col-lg-3 col-sm-3 col-xs-12">
				<div class="box-min" style="background-image: url('<%=request.getContextPath() %>/images/admin/news.png');">
					<div>
						<p>动态总数<a href="article?type=news" class="a-btn"><strong>&nbsp;${requestScope.newsNum }&nbsp;</strong></a></p>
						<p>已发布<a href="article?type=news&status=1" class="a-btn"><strong>&nbsp;${requestScope.newPut }&nbsp;</strong></a></p>
						<p>未发布<a href="article?type=news&status=0" class="a-btn"><strong>&nbsp;${requestScope.newDraft }&nbsp;</strong></a></p>
					</div>
				</div>
			</div>

			<div class="col-lg-3 col-sm-3 col-xs-12">
				<div class="box-min" style="background-image: url('<%=request.getContextPath() %>/images/admin/notice.png');">
					<div>
						<p>公告总数<a href="article?type=notice" class="a-btn"><strong>&nbsp;${requestScope.noticeNum }&nbsp;</strong></a></p>
						<p>已发布<a href="article?type=notice&status=1" class="a-btn"><strong>&nbsp;${requestScope.noPut }&nbsp;</strong></a></p>
						<p>未发布<a href="article?type=notice&status=0" class="a-btn"><strong>&nbsp;${requestScope.noDraft }&nbsp;</strong></a></p>
					</div>
				</div>
			</div>

			<div class="col-lg-3 col-sm-3 col-xs-12">
				<div class="box-min"  style="background-image: url('<%=request.getContextPath() %>/images/admin/result.png');">
					<div>
						<p>成果总数<a href="article?type=result" class="a-btn"><strong>&nbsp;${requestScope.resultNum }&nbsp;</strong></a></p>
						<p>已发布<a href="article?type=result&status=1" class="a-btn"><strong>&nbsp;${requestScope.rePut }&nbsp;</strong></a></p>
						<p>未发布<a href="article?type=result&status=0" class="a-btn"><strong>&nbsp;${requestScope.reDraft }&nbsp;</strong></a></p>
	 				</div>
				</div>
			</div>
		</div>
		
		<div class="col-lg-12 col-xs-12 table-responsive">
			<table class="table-bordered table table-striped">
				<thead>
					<tr>
						<td>标题</td>
						<td>时间</td>
						<td>浏览量</td>
						<td>分类</td>
						<td>状态</td>
						<td>操作</td>
					</tr>
				</thead>
				<c:if test="${requestScope.fyrows == null || requestScope.fyrows <= 0 }">
					<tr style="text-align: center;">
						<td colspan="6">${requestScope.fyrows == -1?'无该记录':'暂无数据' } </td>
					</tr>
				</c:if>
				<c:forEach items="${requestScope.articles }" var="art" varStatus="in">
					<tr>
						<td>${art.title }</td>
						<td>${art.time }</td>
						<td>${art.views }</td>
						<td class="art-${art.type }">${art.type == 'news'?'创客动态':art.type == 'notice'?'通知公告':'成果作品' }</td>
						<td>${art.status == 0?'<span class="label label-warning">草稿</span>':'<span class="label label-success">已发布</span>' }</td>
						<td style="width: 150px;">
							<a href="article/${art.id }" class="btn btn-xs btn-primary">编辑</a>
							<button onclick="del(${art.id });" class="btn btn-xs btn-danger">删除</button>
							<a href="<%=request.getContextPath() %>/article/${art.id }" target="_blank" class="btn btn-xs btn-info">查看</a>
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
<script type="text/javascript">
	function Goto(page) {
		if (page <= ${requestScope.pages } && page > 0) {
			if (${requestScope.type != null }) {
				if (${requestScope.status > 1 }) {
					location.href = "article?type=${requestScope.type }&pageNo=" + page;
				} else {
					location.href = "article?type=${requestScope.type }&status=${requestScope.status }&pageNo=" + page;
				}
			} else {
				if (${requestScope.status > 1 }) {
					location.href = "article?pageNo=" + page;
				} else {
					location.href = "article?status=${requestScope.status }&pageNo=" + page;
				}
			}
		}
	}
	// 删除信息
	function del(id){
		console.log('删除 ' + id)
		$.post('delart', {id: id}, function(data) {
			if (data.length > 1) {
				alert("删除成功！");
				Goto(${requestScope.pageNo });
			}
			console.log('删除返回的数据 --> '+data)
		});
	}
	// 搜索信息
	$('#searchform').submit(function(event) {
		var name = $(this).find('input').val();
		if (name.length <= 0) {
			event.preventDefault();
		}
	});
</script>
<jsp:include page="footer.jsp"/>
