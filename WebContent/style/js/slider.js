var $slider_div = $('#Slideshow_lkl > div > div');
var $slider_li = $('#Slideshow_lkl ul > li');
$slider_li.on('click', function(event) { // 点击按钮显示盒子
	var index = $.inArray(this, $slider_li);
	showSliderBox(index);
});
function showSliderBox(index) { // 根据索引显示对应盒子
	$slider_div.eq(index).addClass('active').siblings('.active').removeClass('active');
	$slider_li.eq(index).addClass('active').siblings('.active').removeClass('active');
}
function getBtnIndex() { // 返回当前显示的索引
	return $.inArray($('#Slideshow_lkl ul > li.active')[0], $slider_li);
}