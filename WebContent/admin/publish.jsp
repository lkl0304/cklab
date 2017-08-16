<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="header.jsp"/>
<script type="text/javascript">
	// 改变侧边栏激活
	changeTab(1);
</script>
<script type="text/javascript" src="<%=request.getContextPath() %>/admin/wEditor/wangEditor.min.js"></script>
<style>
    .write-bottom { padding: 0 20px 15px 0; } /* 底部按钮 */
    div[class='input-group'] label { color: #fff; }
    #img img { width: 100%; height: 120px; line-height: 120px; text-align: center; border: 2px dashed #2F8099; }
</style>
<div class="admin-content">
    <div class="admin-box">
    	<div class="col-lg-12 col-xs-12">
    		<h4>发布文章</h4>
    	</div>
        
        <div style="padding: 0;" class="col-lg-12 col-xs-12">
            <form id="artform">
            	<input type="text" name="id" style="display: none;" value="${requestScope.article.id }">  <!-- 全部根据该值判断是新建还是修改 -->
            	<input type="text" name="article.time" style="display: none;">
            	<input type="text" name="article.status" value="0" style="display: none;">
                <div style="padding: 0 0 0 5px;" class="col-lg-9 col-xs-9">
                    <div class="col-lg-8 col-xs-8">
                        <div class="form-group">
                            <div class="input-group">
                                <label style="background-color: #792F5C;" class="input-group-addon">标题</label>
                                <input type="text" class="form-control" name="article.title" placeholder="文章标题 (必须)" value="${requestScope.article.title }" required="required">
                            </div>
                            <span class="text-danger"></span>
                        </div>
                    </div>
                    <div class="col-lg-4 col-xs-4">
                        <div class="form-group">
                            <div class="input-group">
                                <select id="type" class="form-control" name="article.type">
                                    <option value="news">创客动态</option>
                                    <option value="notice">通知公告</option>
                                    <option value="result">成果展示</option>
                                </select>
                                <label style="background-color: #64298B;" class="input-group-addon bg-info">分类</label>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-12 col-xs-12">
                        <div class="form-group">
                            <div class="input-group">
                                <label style="background-color: #316b9d;" class="input-group-addon">简介</label>
                                <textarea name="article.intro" class="form-control" rows="3" style="resize: none;" maxlength="150" placeholder="文章简介150字内">${requestScope.article.intro }</textarea>
                            </div>
                            <span class="text-danger"></span>
                        </div>
                    </div>
                </div>
                
            	<input style="display: none;" accept="image/*" type="file" name="file">
                <div style="padding: 0 25px 0 0;" class="col-lg-3 col-xs-3">
                    <div id="img">
                    	<c:choose>
                    		<c:when test="${requestScope.article.type == 'result' }">
                    			<img style="cursor: crosshair;" title="缩略图" src="../../${requestScope.article.photo }" name="true" alt="点此添加缩略图">
                    		</c:when>
                    		<c:otherwise>
                    			<img title="缩略图" name="false" alt="仅成果展示可添加">
                    		</c:otherwise>
                    	</c:choose>
                    </div>
                </div>
                
                <input type="text" name="article.path" value="${requestScope.article.path }" style="display: none;">
                <input type="text" name="article.content" value="" style="display: none;">  <!-- 暂存文章内容 不向数据库中保存 -->
                <input type="reset" style="display: none;">
            </form>
        </div>
        
    	<div class="col-lg-12 col-xs-12">
    		<span class="text-danger"></span>
    		<div id="M-editor" style="width: 99%; margin: 0 auto;"></div>
    	</div>
    	
        <div class="write-bottom">
    		<div class="text-right">
                <button id="vbtn" class="btn btn-default">返回列表</button>      
                <button id="cbtn" class="btn btn-warning">保存草稿</button>
                <button id="pbtn" class="btn btn-success">发布文章</button>
            </div>
    	</div>
    	        
    	<script type="text/javascript">
    		var E = window.wangEditor;
            var editor = new E('#M-editor')
            editor.customConfig.uploadImgShowBase64 = true; // 设置用base64保存图片
            editor.customConfig.uploadImgMaxSize = 0.2 * 1024 * 1024; // 设置图片大小限制200k
            editor.customConfig.uploadImgMaxLength = 6; // 限制一篇文章最多上传6张照片 没办法 一次上传数据最大1.5兆 多了可能就获取不到了
            editor.create() // 创建
            function getHtml() { return editor.txt.html(); }
            function setHtml(val){ editor.txt.html(val); }
            function clearAll(){ editor.txt.clear(); }
            
            // 预加载数据
            var artPath = '${requestScope.article.path }';
            var imgPath = $('#img > img').attr('src');
            $('option[value="${requestScope.article.type }"]').attr('selected','selected');  // 改变类型按钮默认选项
            if (artPath.length > 1) {
            	// console.log('文章路径存在 通过post加载')
                $.post("<%=request.getContextPath() %>/" + artPath, function(data) {
                    setHtml(data);
                });
            }
            
            // 监听select类型选择 改变是否能添加图片
            $('#type').change(function(event) {
                var val = $(this).val();
                var $img = $('#img > img');
                if (val == 'result') {
                	$img.css('cursor', 'crosshair').attr('alt', '点此添加缩略图').attr('name', 'true');
                } else {
                	$img.css('cursor', 'auto').attr('alt', '仅成果展示可添加').attr('name', 'false');
                }
            });

            // 监听行为按钮 保存文章 需要表单验证 标题 简介 内容 
            $('.write-bottom button').on('click', function(event) {
                event.preventDefault();
                var id = $(this).attr('id');
                var type = $('#type').val();

                if (id == 'vbtn') {
                    location.href = "<%=request.getContextPath() %>/admin/article";
                } else {
                	if (CheckForm()) {
                		if (type == 'result') {
                            uploadImg(id == 'cbtn'?0:1); // 只有成果才上传图片
                        } else {
                            uploadArt(id == 'cbtn'?0:1);
                        }
					}
				}
            });
            // 表单验证
            function CheckForm() {
				var title = $('input[name="article.title"]').val();
				var intor = $('[name="article.intro"]').val();
				var content = getHtml();
				console.log(content)
				if (title.length < 4) {
					$('[name="article.title"]').parent('div').next('span').text('标题太短了！');
				} else if (intor.length < 15) {
					$('[name="article.intro"]').parent('div').next('span').text('简介不能小于15字！');
				} else if (content.length < 20) {
					$('#M-editor').prev('span').text('内容太少了！');
				} else {
					return true;
				}
				return false;
            }

            // 文件上传
            function uploadArt(status){
                $('input[name="article.content"]').val(getHtml()); // 使用article.content暂存文本 文本最大1.5M
                $('input[name="article.status"]').val(status);  // 设置文章是否发布

                var data = $('#artform').serialize();
                $.post('../addart', data, function(data) {
                    if (data.length > 1) {
                        alert(status == 0?'保存成功!':'发布成功！');
                        clearAll();  // 清空数据
                        $('input[type="reset"]').click();
                        location.href='../article';
                    }
                });
            }
            function uploadImg(status){
            	//if ($('input[name="file"]').val() != "") {  // 图片不是空的就上传 否则不传 改 留给后端判断 保证图片有图片 没上传图片则用默认图片
            		var formData = new FormData();
                    formData.append('id', $('input[name="id"]').val());
                    formData.append('file', $('input[name="file"]')[0].files[0]);
                    
                    $.ajax({
                        url: '<%=request.getContextPath() %>/upload',
                        type: 'post',
                        cache: false,
                        data: formData,
                        processData: false,
                        contentType: false,
                        beforeSend: function(){
                            console.log("正在上传文件");
                        },
                        success: function(data) { 
                            if(data.length > 1){
                                console.log("成功");
                                uploadArt(status); // 保证图片上传成功后才上传文章
                            }else{
                                console.log("失败");
                            }
                        },
                        error: function(responseStr) { 
                            console.log("error");
                        } 
                    });
            }
            // 监听点击图片事件
            var canClick = true; // 全局变量 确保十秒内只激活一次input
            $('#img > img').on('click', function(event) {
                var c = $(this).attr('name');
                
                if (c == 'true') {
                	if (canClick == true) {
                		$('input[name="file"]').click();
                        setTimeout(function() {
                            canClick = true;
                        }, 10000);
					}
                	canClick = false;
                }
            });
            // 实现图片上传前本地预览
            $('input[name="file"]').change(function(event) {
            	var size = (this.files[0].size / 1024).toFixed(0);
            	var path = getObjectURL(this.files[0]);
                console.log(size + "kb");
                if (size > 0) {
                	if (size > 200) {
    					alert('图片最大200kb 请重新选择！');
    				} else {
    					$('#img > img').attr('src', path);
					}
                }
            });
            function getObjectURL(file) {
                var url = null;
                if (window.createObjectURL!=undefined){ // basic
                    url = window.createObjectURL(file);
                } else if (window.URL!=undefined) { // mozilla(firefox)
                    url = window.URL.createObjectURL(file);
                } else if (window.webkitURL!=undefined) { // webkit or chrome
                    url = window.webkitURL.createObjectURL(file);
                }
                return url;
            }
            
            // 隐藏提示框
            $('#artform').find('input, textarea').focus(function(event) {
            	$(this).parent('div').next('span').text('');
        	});
            $('#M-editor').click(function () {
            	$(this).prev('span').text('');
			})
        </script>
    </div>
</div>

<jsp:include page="footer.jsp"/>