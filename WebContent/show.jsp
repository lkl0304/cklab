<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="header.jsp"/>
<link rel="stylesheet" href="<%=request.getContextPath() %>/article/editor.css">

<style type="text/css">
	.note { margin: 50px 0; }
	.note > div.note-title { margin: 0 0 40px; }
	.note > div.note-content { word-break: break-all; }
	.note > div.note-footer { margin: 20px 0 0 0; }
	@media screen and (max-width: 640px){
		div.note { margin: 20px 0; }
	}
</style>

<div class="show">
	<div class="container">
		<div class="note">
			<div class="note-title text-center note-header">
				<h1>${article.title }</h1>
				<p class="text-muted">时间: <time>${article.time }</time>&nbsp;&nbsp;阅读: ${article.views }</p><br>
				<p class="text-center">${article.intro }</p>
			</div>
			<div class="note-content"><!-- 通过load加载数据 --></div>
			<div class="note-footer">
				<div class="text-center">
					<button onclick="like(${article.id });" class="btn btn-info">点赞&nbsp;|&nbsp;<span>${article.likes }</span></button>
					<a href="../${article.type }" class="btn  btn-default">返回列表</a>
				</div>
				<hr>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	$('div.note-content').load('<%=request.getContextPath() %>/${article.path }');
	var can = true;  // 每次只能点赞一次
	function like(id) {
		if (can == true) {
			$.post('like', {id: id});
			var num = parseInt($('button > span').text());
			$('button > span').text(num + 1);
		}
		can = false;
	}
</script>
<jsp:include page="footer.jsp"/>
</body>
</html>