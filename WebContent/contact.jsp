<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="header.jsp"/>
<style>
	table td { border-top: none!important; }
</style>
<div class="contact-us">
	<div class="mini-top">
		<div>
			<p>Contact Us</p>
		</div>
	</div>
	<div class="my-box">
		<div class="container">
			<div class="my-title text-center"><br>
				<h1>Get In Touch!</h1>
				<p class="text-muted">创客实验室致力于挖掘每一位学生兴趣并让其热爱<br>All Insistence Are Enthusiam.</p>
			</div>
			<div> <!-- 第二个孩子 -->
				<div>
					<div class="col-lg-5 col-sm-5 col-xs-12">
						<div>
							<h3>Call Us</h3>
							<p class="text-muted">联系电话： <strong>0564 ********</strong>,<br> Monday - Friday, 9am - 7pm</p>
						</div>
						<div>
							<h3>Drop a Line</h3>
							<p class="text-muted">service@yunshipei.com, <br/>期待您的来信public.</p>
						</div>
						<div>
							<h3>Visit Us</h3>
							<p class="text-muted">安徽省六安市裕安区月亮岛WanXi university 明德楼415室</p>
						</div>
					</div>
					<div class="col-lg-7 col-sm-7 col-xs-12">
						<div id="alert" style="margin: 0 10px; display: none;" class="alert alert-warning">
							<strong>ERROR：</strong><span> </span>
						</div>
						<form id="contact-from">
							<input type="hidden" name="email.time" value="">
							<table class="table">
								<tr>
									<td>
										<input id="name" class="input" type="text" maxlength="4" name="email.name" placeholder="姓名">
									</td>
									<td>
										<select class="input" name="sex">
			                   	         <option value="option1">男</option>
			                      	      <option value="option2">女</option>
		                        		</select>
									</td>
								</tr>
								<tr>
									<td>
										<input id="tel" class="input" type="text" name="email.tel" maxlength="11" placeholder="电话">
									</td>
									<td>
										<input id="email" class="input" type="text" name="email.email" placeholder="Email">
							 		</td>
								</tr>
								<tr>
									<td colspan="2">
									 	<textarea id="say" class="input" rows="4" name="email.content" placeholder="写下你想说的public."></textarea>
									 </td>
								</tr>
								<tr>
									<td colspan="2" class="text-right">
										<a style="width: 120px; background-color: #7C6AA6;" onclick="sendEmail();" href="javascript:void(0);" class="btn btn-info">提交</a>
									</td>
								</tr>
							</table>
							
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
// 发送邮件需要验证表单信息 所有
	var emailreg = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
	var telreg = /^1[34578]\d{9}$/;
	
	function sendEmail() {
		var Edata = $('#contact-from').serialize();
		var name = $('#name').val();
		var tel  = $('#tel').val();
		var email = $('#email').val();
		var say  = $('#say').val();

		if (name.length < 1) {
			$('#alert').fadeIn(200).find('span').text('不打算留下的大名吗?');
		} else if (!telreg.test(tel)) {
			$('#alert').fadeIn(200).find('span').text('手机号码格式不正确!');
		} else if (!emailreg.test(email)) {
			$('#alert').fadeIn(200).find('span').text('邮箱格式不正确!');
		} else if (say.length < 1) {
			$('#alert').fadeIn(200).find('span').text('你不说点什么吗?');
		} else {
			$.post('admin/addeml', Edata, function(data) {
				if (data.length > 1) {
					$('#alert').removeClass('alert-warning').addClass('alert-success').html('发送成功 感谢你的来信！').fadeIn(200);
					Clear();
					setTimeout(function() {
					$('#alert').fadeOut(1).removeClass('alert-success').addClass('alert-warning').html('<strong>ERROR：</strong><span></span>');
					}, 1500);
				}
			});
		}
	}
	$('#contact-from').find('input, textarea').focus(function(event) {
		$('#alert').fadeOut(200);
	});
	function Clear() {
		$('#contact-from').find('input, textarea').val('');
	}
</script>
<jsp:include page="footer.jsp"/>
</body>
</html>