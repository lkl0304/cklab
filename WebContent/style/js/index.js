$(function(){
	var isRun = true; // 全局变量用于规定是否自动滚动
	$('.tu-slider').mouseover(function(event) {
		isRun = false;
	}).mouseleave(function(event) {
		isRun = true;
	});
	// 按钮滚屏
	$('.btn-all > li').on('click', function(event) {
		var btnArr = $('.btn-all > li');
		var index = $.inArray(this, btnArr); // 获取对应的索引
		showSlider(index);
	});
	// 定时滚屏
	window.setInterval(function() {
		if (isRun) {
			var i = (getIndex() + 1)%4;
			showSlider(i);
		}
	}, 8000);
	// 滑动滚屏
	var startTouchX = 0;
	var endTouchX = 0;
	var bg = $('.bg-all');
	bg.on('touchstart', function(event) {
		startTouchX = event.changedTouches[0].clientX;
	});
	bg.on('touchend', function(event) {
		endTouchX = event.changedTouches[0].clientX;
		var cha = endTouchX - startTouchX;
		
		if (cha > 50) {
			var i = getIndex() - 1;
			if (i < 0) {
				i = 3;
			}
			showSlider(i);
		} else if (cha < -50) {
			var i = getIndex() + 1;
			if (i > 3) {
				i = 0;
			}
			showSlider(i);
		}
	});
});

function showSlider(index) { // 根据给定的索引显示相应的轮播图
	var btnArr = $('.btn-all > li');
	var bgArr = $('.bg-all > div');
	btnArr.eq(index).addClass('active').siblings('[class~="active"]').removeClass('active');
	bgArr.eq(index).addClass('active').siblings('[class~="active"]').removeClass('active');
}
function getIndex() { // 获取当前显示的轮播图索引
	var btnArr = $('.btn-all > li');
	return $.inArray($('.btn-all > li.active')[0], btnArr);
}