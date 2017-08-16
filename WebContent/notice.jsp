<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="header.jsp"/>

<style type="text/css">
	.notice .my-box .thumbnail img { display: block; width: 100%; max-height: 120px; margin: 0 auto 10px; }
</style>

<div id="art" class="notice">
	<div style="background: url('images/notice/notice-bg.jpg');" class="bgimg-top">
		<div style="background-color: rgba(0,0,0,0.3);" class="text-center">
			<div class="container">
				<p> </p><br>
				<h2>通知公告</h2>
				<p> 展示创客实验室的最新工作安排 </p>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="my-box">
			<div style="margin-top: 40px;" class="row">
				<div class="col-lg-3 col-sm-3 col-xs-12">
					<div class="thumbnail"> 
						<img src="images/notice/notice.jpg" alt="公告">
						<div class="caption">
							<h4 class="text-center">通知</h4>
							<p class="text-muted">最快</p>
						</div>
					</div>
					<div class="thumbnail"> 
						<img src="images/notice/notice.jpg" alt="公告">
						<div class="caption">
							<h4 class="text-center">公告</h4>
							<p class="text-muted">最新</p>
						</div>
					</div>
				</div>
				<div id="notice-box" class="col-lg-9 col-sm-9 col-xs-12">

					<c:forEach items="${requestScope.articles }" var="art" varStatus="in">
						<div class="article-box">
							<div class="article-header">
								<h3><a href="<%=request.getContextPath() %>/article/${art.id }">${art.title }</a></h3>
								<p>阅读 ${art.views } | 赞 ${art.likes }</p>
							</div>
							<div class="article-body">
								${art.intro }
							</div>
							<div class="article-footer">
								<div>
									<time>${art.time }</time>
								</div>
								<div>
									<a href="<%=request.getContextPath() %>/article/${art.id }">阅读全文 >></a>
								</div>
							</div>
						</div>
					</c:forEach>
					
				</div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript" src="<%=request.getContextPath() %>/style/js/ajaxLoad.js"></script>
<script type="text/javascript">
	ajaxLoad(${requestScope.pages }, "notice", "notice-box");  // 启动ajax加载数据
</script>
<jsp:include page="footer.jsp"/>
</body>
</html>