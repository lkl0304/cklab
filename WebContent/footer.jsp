<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<footer class="footer">
		<div class="footer-bg">
			<div class="container">
				 <div class="col-lg-6 col-md-6 col-sm-6">
	                <strong>关于我们</strong>
	                <div>
	                    <p>
	                        WanXi University创客实验室是2016年4月份成立，隶属省重点实验室。实验室目前共有30人，研究方向共计分为三项：分布式网站开发、安卓移动开发、3D游戏开发。
	                    </p>
	                    <p>
	                        实验室成功与科大讯飞大数据研究院、ZeroCoding公司建立长久合作伙伴关系。
	                    </p>
	                </div>
	            </div>
	            <div class="col-lg-3 col-md-3 col-sm-3 col-sm-push-3 col-md-push-3 col-lg-push-3">
	                <strong>联系详情</strong>
	                <div>
	                	<p style="background: url('<%=request.getContextPath() %>/images/footer/tel.png') no-repeat 0 5px; background-size: 14px 14px; padding-left: 25px;">
	                		服务专线：400 069 0309
	                	</p>
		                <p style="background: url('<%=request.getContextPath() %>/images/footer/mail.png') no-repeat 0 5px; background-size: 14px 14px; padding-left: 25px;">
		                	Timmhc@qq.com
		                </p>
		                <p style="background: url('<%=request.getContextPath() %>/images/footer/attr.png') no-repeat 0 5px; background-size: 14px 14px; padding-left: 25px;">
		                	WanXi university 明德楼 415
		                </p>
	                </div>
	            </div>
	       </div>
		</div>
	</footer>
	<style type="text/css">
		#particles-js{
			z-index: -1;
			position: fixed; 
			top: 0;  
			left: 0;
			width: 100vw;
			height: 100%;
			background-color: rgba(255, 255, 255, 0.1);
		}
	</style>
	<div id="particles-js"></div> <!-- 离子背景 -->
	<script src="<%=request.getContextPath() %>/style/js/particles.min.js"></script>
	<script src="<%=request.getContextPath() %>/style/js/app.js"></script>
	<script src="http://cdn.bootcss.com/instantclick/3.0.1/instantclick.min.js"></script> <!-- 快速响应插件 好像并没有卵用~~~ -->