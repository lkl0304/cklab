<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="header.jsp"/>
<div class="index">
	<!-- 轮播图 -->
	<div class="tu-slider">
		<div class="bg-all">
			<div class="active">
				<div class="bg-img">
					<div>
						<div>
	                        <h1>创客实验室 一个进阶必备的场所</h1>
	                        <p>全省领先的本科重点实验室，高效的帮助您与网站开发接轨。接触到业界大牛只是起点，成为大牛才是我们的目标！</p>
	                        <div>
	                            <a href="<%=request.getContextPath() %>/about" class="btn btn-danger">了解更多</a>
	                        </div>
						</div>
					</div>
				</div>
			</div>
			<div>
				<div class="bg-img">
					<div>
						<div>
	                        <h1>不仅仅是安卓开发</h1>
	                        <p>我们出发点并不局限于开发安卓程序，我们更想你在开发过程中学会自己发现问题并解决问题，这是培养你的初衷！</p>
	                        <div>
	                            <a href="<%=request.getContextPath() %>/about" class="btn btn-danger">了解更多</a>
	                        </div>
						</div>
					</div>
				</div>
			</div>
			<div>
				<div class="bg-img">
					<div>
						<div>
	                        <h1>为热爱游戏的你量身定制</h1>
	                        <p>谁说热爱游戏有错？我们可以以一种更高端的方式来表现自己的品味，秒杀异样的眼光，没错，那就是3D游戏开发！</p>
	                        <div>
	                            <a href="<%=request.getContextPath() %>/about" class="btn btn-danger">了解更多</a>
	                        </div>
						</div>
					</div>
				</div>
			</div>
			<div>
				<div class="bg-img">
					<div>
						<div>
	                        <h1>How We Work</h1>
	                        <p>在这里，你要做的不仅仅是学习，最重要的是成为一个对社会有用的人！在这里，你会发现实现自己人生价值的乐趣！</p>
	                        <div>
	                            <a href="<%=request.getContextPath() %>/about" class="btn btn-danger">了解更多</a>
	                        </div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="container hidden-xs">  <!-- 小屏幕隐藏 -->
			<ul style="padding: 0; margin: 0;" class="btn-all">
				<li class="active">
					<div>
						<strong><img src="images/index/web.png" alt="网站">网站移动化</strong><br>
						<span>Distributed 架构</span>
					</div>
				</li>
				<li>
					<div>
						<strong><img src="images/index/app.png" alt="安卓">安卓移动开发</strong><br>
						<span>MVC 多层次框架</span>
					</div>
				</li>
				<li>
					<div>
						<strong><img src="images/index/3d.png" alt="3D">unity 3d开发</strong><br>
						<span>Amaze UI 开发框架</span>
					</div>
				</li>
				<li>
					<div>
						<strong><img src="images/index/how.png" alt="HOW">How We Work</strong><br>
						<span>坚持来源于 热爱</span>
					</div>
				</li>
			</ul>
		</div>
	</div>
	<!-- 核心优势 -->
	<div class="container">
		<div class="my-box core">
			<div class="my-title">
				<h1>核心优势</h1>
	            <!-- p class="text-muted">
	            	 拥有雄厚的师资力量，正确的方向引领着创客队伍不断的突破和提升。与科大讯飞，合肥工业大学达成长期合作关系，对每一位进入实验室的成员制定合理的培养方案，达到“分而治之”的效果。
	            </p-->
			</div>
			<div class="row">
				<div class="col-lg-3 col-md-3 col-sm-6 col-sx-12">
					<div> 
						<img src="images/index/core01.jpg" alt="图片加载失败">
						<div class="caption">
							<h4>严格的筛选过程</h4>
							<p class="text-muted">选出有梦想的你，让实验室的每一位成员对你的加入表示欢迎</p>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-md-3 col-sm-6 col-sx-12">
					<div>
						<img src="images/index/core02.jpg" alt="图片加载失败">
						<div class="caption">
							<h4>高效的考核机制</h4>
							<p class="text-muted">大型公司化的成员管理方案，大大提升了创客实验的管理效率。</p>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-md-3 col-sm-6 col-sx-12">
					<div>
						<img src="images/index/core03.jpg" alt="图片加载失败">
						<div class="caption">
							<h4>丰富的项目资源</h4>
							<p class="text-muted">实验室面向校内校外承接各类项目，祝你快速成长。</p>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-md-3 col-sm-6 col-sx-12">
					<div>
						<img src="images/index/core04.jpg" alt="图片加载失败">
						<div class="caption">
							<h4>开放的学习环境</h4>
							<p class="text-muted">无需多余的申请步骤，人均一台高配电脑，随学随用。</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 提供的资源 -->
	<div class="offer container-fluid">
		<div class="row">
			<div class="col-lg-6 col-sm-6 col-xs-12">
				<ul class="list-unstyled">
					<li>
						<div>
							<img src="images/index/share.png" alt="资源分享">
							<div>
								<h4><strong>高效的资源交流与分享</strong></h4>
	                            <p class="text-muted">在实验室，我们对每一位成员一视同仁。通过2年的建设，为您提供各类整合过的资源和经验分享，助您起飞。</p>
                            </div>
						</div>
					</li>
					<li>
						<div>
							<img src="images/index/money.png" alt="经费支持">
							<div>
								<h4><strong>丰富的经费支持体系</strong></h4>
								<p class="text-muted">如果您有想法并付出实施，通过考核后会提供项目经费支持，让您在专心研究的同时，保证你经费无忧。</p>
							</div>
						</div>
					</li>
					<li>
						<div>
							<img src="images/index/life.png" alt="课外生活">
							<div>
								<h4><strong>丰富的课外生活安排</strong></h4>
								<p class="text-muted">春游踏青、健身、聚餐...等一系列活动，让实验室每一位成员通过活动释放自我，彼此之间收获纯洁高尚的友谊。</p>
							</div>
						</div>
					</li>
				</ul>
			</div>
			<div class="col-lg-6 col-sm-6 col-xs-12">
				<div>
					<p>提供创意项目经费、课外研究经费支持。秉承公开、公平、公正原则，助您快速成长。</p>
				</div>
			</div>
		</div>
	</div>
	<!-- 我们的服务 -->
	<div class="container">
		<div class="my-box server">
			<div class="my-title">
				<h1>我们的服务</h1>
	            <!--p class="text-muted">
	            	擅长各类网站，游戏，安卓程序的开发，随时上线并分享优秀的创意想法和好的商业模式，大家进行交流互动对其进行完善。同时，撰写和设计各类文档编排
	            </p-->
			</div>
			<div class="row">
				<div class="col-lg-3 col-sm-3 col-sx-12">
					<div class="thumbnail"> 
						<img src="images/index/web.png" alt="网站组">
						<div class="caption">
							<h4>分布式网站开发</h4>
							<p class="text-muted">PHP、HTML5、Java、Python主流开发语言及多种框架助您高效完成项目</p>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-sm-3 col-sx-12">
					<div class="thumbnail">
						<img src="images/index/app.png" alt="app组">
						<div class="caption">
							<h4>安卓移动开发</h4>
							<p class="text-muted">Activity/Service/Broadcast Receiver/Content Provider/原理及深层实现</p>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-sm-3 col-sx-12">
					<div class="thumbnail">
						<img src="images/index/3d.png" alt="3d游戏">
						<div class="caption">
							<h4>3D游戏开发</h4>
							<p class="text-muted">热爱游戏开发却没有合适资源？在实验室，我们可以为您提供游戏开发技术支持与培养</p>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-sm-3 col-sx-12">
					<div class="thumbnail">
						<img src="images/index/data.png" alt="大数据">
						<div class="caption">
							<h4>大数据应用</h4>
							<p class="text-muted">第三次互联网浪潮下，大数据已经成为时代主题，我们实验室帮您快速进入大数据时代</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 期待你的加入 -->
	<div class="join container-fluid">
		<div class="text-center my-title">
			<h1>期待你的加入</h1>
		</div>
		<div><!-- 用于放大图片的盒子 --></div>
	</div>
	
	<!-- jsp:include page="link.jsp"/ -->
</div>

<jsp:include page="footer.jsp"/>
</body>
</html>