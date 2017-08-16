<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="header.jsp"/>

	<div class="admin-content">
		<div class="admin-box">
			<div class="col-lg-12 col-xs-12">
				<h4>仪表盘</h4>
			</div>
			<div>
				<div class="col-lg-3 col-sm-6 col-xs-12">
					<div class="box-min" style="background-image: url('<%=request.getContextPath() %>/images/admin/art.png');">
						<div>
							<p>已发布了</p>
							<p><strong>${requestScope.articleNum }</strong></p>
							<p>篇文章</p>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-sm-6 col-xs-12">
					<div class="box-min" style="background-image: url('<%=request.getContextPath() %>/images/admin/mem.png');">
						<div>
							<p>已经添加</p>
							<p><strong>${requestScope.memberNum }</strong></p>
							<p>名成员</p>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-sm-6 col-xs-12">
					<div class="box-min" style="background-image: url('<%=request.getContextPath() %>/images/admin/mail.png');">
						<div>
							<p>收到</p>
							<p><strong>${requestScope.emailNum }</strong></p>
							<p>封邮件</p>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-sm-6 col-xs-12">
					<div class="box-min" style="background-image: url('<%=request.getContextPath() %>/images/admin/biao.png');">
						<div>
							<p>共有</p>
							<p><strong>${requestScope.viewNum }</strong></p>
							<p>访问量</p>
						</div>
					</div>
				</div>
			</div> <!-- 仪表框end -->
		</div>
	</div>
	
<jsp:include page="footer.jsp"/>