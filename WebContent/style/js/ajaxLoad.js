var allPageNum = 1; // 总页数
var nowPageNum = 1; // 全局变量 保存当前页码
var artType    = '';
var boxId      = '';

function ajaxLoad(allPages, type, id){
	allPageNum = allPages;
	artType    = type;
	boxId      = id;
}

$(window).scroll(function(event) {
	if (checkCan(boxId)) {
		if (nowPageNum < allPageNum) {
			//console.log('可以加载 页数--> ' + (nowPageNum +1))
			$.ajax({
				url: 'ajaxLoad',
				type: 'POST',
				dataType: 'json',
				data: {pageNo: ++nowPageNum, type: artType},
				timeout: 1000,
				success: function(data) {
					LoadData(data);
				}
			});
			if (nowPageNum == allPageNum){
				console.log("到底了")
			}
		}
	}
});
function LoadData(dataJson) {
	//console.log('json数据--> ' + dataJson)
	var result_box = $('#' + boxId);
	$.each(dataJson, function(index, val) {
		var newArt = '';
		if (artType == 'result') {
			newArt = '<div class="col-lg-3 col-md-3 col-sm-4 col-xs-12">' +
					 	'<div class="thumbnail">' + 
					 		'<img src="' + val.photo + '" alt="例子">' + 
					 		'<div class="caption text-center">' +
					 			'<h4>' + val.title + '</h4>' +
					 			'<p class="text-muted">' + val.intro +'</p>'+
					 			'<a href="article/' + val.id + '">Read More>></a>'+
					 		'</div>'+
					 	'</div>'+ 
					 '</div>';
		} else {
			newArt = '<div class="article-box">' +
						'<div class="article-header">' + 
							'<h3><a href="article/' + val.id + '">' + val.title + '</a></h3>' +
							'<p>阅读 '+val.views+' | 赞 '+val.likes+'</p>'+
						'</div>'+
						'<div class="article-body">'+val.intro+'</div>'+
						'<div class="article-footer">'+
							'<div><time>'+val.time+'</time></div>' +
							'<div><a href="article/'+val.id+'">阅读全文 >></a></div>'+ 
						'</div>'+
			  		 '</div>';
		}
		result_box.append(newArt);
	});
}

function checkCan(parent) { // 根据最后一条数据的高度判断能否加载数据
	var lastC = $('#' + parent + ' > div:last');
	var lastH = lastC.outerHeight()/4 + lastC.offset().top;
	var litH = $(window).height() + $(window).scrollTop();
	return (lastH < litH)?true:false;
};