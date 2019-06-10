/*!
 * 使用须知：仅供INDEX页面使用
 * 必要条件：先载入jQuery1.4+
 * 
 * Copyright 2010-4, Hugo Zhang
 */
$(document).ready(function() {
						   
	//页面框架自适应浏览器可视面积
	confSize();
	
	//左侧导航栏隐藏、显示控制条悬停样式
	$(".toggle").hover(
		function(){$(this).addClass("toggle-hover")}, 
		function(){$(this).removeClass("toggle-hover")} 
	);
	
	//左侧导航栏隐藏、显示控制
	$(".toggle").toggle(
		function(){
			$("#main-nav").animate( { width:'hide',opacity:'hide' }, 500);
			$("#main-content").animate( { marginLeft:'0' }, 500);
			$(this).addClass("toggle-open");
			},
		function(){
			$("#main-nav").animate( { width:'show',opacity:'show' }, 500);
			$("#main-content").animate( { marginLeft:'200' }, 500);
			$(this).removeClass("toggle-open");
			}
	);

});

//浏览器窗口大小改变时
$(window).resize(function(){
	//页面框架自适应浏览器可视面积
	//alert('resize');
	confSize();
});

//设定浏览器最小宽度和高度值
var minW = 1004;
var minH = 600;

function setMinSize(w, h){
	minW = w;
	minH = h;
}

//重置页面框架元素宽度与高度
function confSize(){
	var w = $(window).width(); //取得浏览器窗口宽度
	var h = $(window).height(); //取得浏览器窗口高度
	if (w < minW)
		w = minW;
	if (h < minH)
		h = minH;
	$("#header-wrap,#main-wrap").width(w); //统一页面框架宽度
	$("#siderbar-box,#main-nav,#main-content,#main-content-box,#content-box").height(h - 82); //统一页面框架高度
}