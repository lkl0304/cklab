/**
* 8.8 lkl 
* 管理员页面专用 
**/

// 几个用于变化宽的全局变量
var $Hleft = $('.header-left');
var $Hright = $('.header-right');
var $side = $('.admin-side');
var $body = $('body');

// 切换页面侧边栏响应
function changeTab(i){
	var $lis = $('.admin-side > ul > li');
	$.each($lis, function(index, val) {
		if(index == i) {
			$(this).addClass('active');
		} else {
			$(this).removeClass('active');
		}
	});
}
// 用于自动改变大小
function Auto(width){
	if (width == 70){
		MinTab();
	} else {
		MaxTab();
	}
}
// 侧边栏放大缩小的滑动效
$('.admin-header > div.header-right > a').click(function(event) {
	if ($Hleft.outerWidth() > 70) {
		MinTab();
	} else {
		MaxTab();
	}
});
function MinTab(){
	$Hleft.css({
		'width': '70px',
		'padding-left': '70px'
	});
	$Hright.css({
		'left': '70px',
		'width': 'calc(100% - 70px)'
	});
	$side.css('width', '70px');
	$body.css('margin', '70px 0 0 70px');
}
function MaxTab(){
	$Hleft.css({
		'width': '230px',
		'padding-left': '90px'
	});
	$Hright.css({
		'left': '230px',
		'width': 'calc(100% - 230px)'
	});
	$side.css('width', '230px');
	$body.css('margin', '70px 0 0 230px');
}