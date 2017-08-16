<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="header.jsp"/>
<style>
	.news .article-box { margin-bottom: 40px; }
</style>
<div class="news">
	<div style="background: url('<%=request.getContextPath() %>/images/news/news-bg.jpg');" class="bgimg-top">
		<div style="background-color: rgba(0,0,0,0.3);" class="text-center">
			<div class="container">
				<p> </p><br>
				<h2>创客动态</h2>
				<p> 记录创客实验室的点点滴滴 </p>
			</div>
		</div>
	</div>
	<div id="art" class="container">
		<div class="my-box">
			<div id="news-box" style="margin-top: 40px;">
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
<script type="text/javascript" src="<%=request.getContextPath() %>/style/js/ajaxLoad.js"></script>
<script type="text/javascript">
	ajaxLoad(${requestScope.pages }, "news", "news-box");  // 启动ajax加载数据
</script>
<jsp:include page="footer.jsp"/>
</body>
</html>