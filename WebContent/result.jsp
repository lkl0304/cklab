<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="header.jsp"/>

<div class="result">
	<div class="mini-top">
		<div>
			<p>成果展示</p>
		</div>
	</div>
	<div class="my-box result">
		<div class="container">
			<div class="my-title text-center"><br>
				<h1>自主研发 自主创新</h1>
				<p class="text-muted">实验室成员在金萍、宗瑜两位教授的的悉心栽培下，成长迅速。涌现出一批又一批令人耳目一新的项目。 <br>就让我们一起看看下面吧！</p>
			</div>
			<div id="Slideshow_lkl">
				
				<div>
					<div class="active">
						<div id="result-box" class="row">
							<c:forEach items="${requestScope.articles }" var="art" varStatus="in">
							<div class="col-lg-3 col-md-3 col-sm-4 col-xs-12">
								<div class="thumbnail">
									<img src="<%=request.getContextPath() %>/${art.photo }" alt="例子">
									<div class="caption text-center">
										<h4>${art.title }</h4>
										<p class="text-muted">${art.intro }</p>
										<a href="<%=request.getContextPath() %>/article/${art.id }">Read More>></a>
									</div>
								</div>
							</div>
							</c:forEach>
						</div>
					</div>
					
				</div>
			</div>

		</div>
	</div>
	<!-- <script type="text/javascript" src="style/js/slider.js"></script>引入标签页轮播脚本 -->
</div>
<script type="text/javascript" src="<%=request.getContextPath() %>/style/js/ajaxLoad.js"></script>
<script type="text/javascript">
	ajaxLoad(${requestScope.pages }, "result", "result-box");  // 启动ajax加载数据
</script>
<jsp:include page="footer.jsp"/>
</body>
</html>