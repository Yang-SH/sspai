$(window).scroll(function() {
	if ($(".navbar").offset().top > 50) {
		$(".navbar-fixed-top").removeClass("one");
		$(".navbar-fixed-top").removeClass("top-nav2");
		$(".navbar-fixed-top").addClass("top-nav");
		$("#nav a").css("color", "#000");
		$("#title").css("color", "#D7191A");
		$(".search_input").removeClass("input_back");
		$(".search_input").addClass("input_back2");
		// $("#btn_login").addClass("login_btn");
	} else {
		$(".navbar-fixed-top").addClass("top-nav2");
		$(".navbar-fixed-top").removeClass("top-nav");
		$("#nav a").css("color", "#fff");
		$("#title").css("color", "#fff");
		$(".search_input").removeClass("input_back2");
		$(".search_input").addClass("input_back");
		// $("#btn_login").removeClass("login_btn");
	}

});
$(function() {
	// 页面加载是隐藏搜索输入框
	$('.search_inp').toggle();
	$('[data-toggle="popover"]').each(function() {
		var element = $(this);
		var id = element.attr('id');
		var txt = element.html();
		element.popover({
			trigger : 'manual',
			placement : 'bottom', // top, bottom, left or right
			title : '',
			html : 'true',
			content : ContentMethod(txt),
		}).on("mouseenter", function() {
			var _this = this;
			$(this).popover("show");
			$(this).siblings(".popover").on("mouseleave", function() {
				$(_this).popover('hide');
			});
		}).on("mouseleave", function() {
			var _this = this;
			setTimeout(function() {
				if (!$(".popover:hover").length) {
					$(_this).popover("hide")
				}
			}, 100);
		});
	});

	// $('#cha').click(function(){
	// $('#login_before').css("display","none");
	// $('#login_after').css("display","block");
	// });

	$('.search').click(function() {
		$('.search_inp').toggle(300);
		$('.search_inp').focus();
	});
});

function ContentMethod(txt) {
	return '<ul style="line-height:5px;" class="nav nav-pills nav-stacked">'
			+ '<li><a style="color:#494747;" href="gohomepage.userAction">个人主页</a></li>'
			+ '<li><a style="color:#494747;" href="login.userAction">网站主页</a></li>'
			+ '<li><a style="color:#494747;" href="gomodification.userAction">帐号设置</a></li>'
			+ '<li style="border-bottom: 1px solid #ccc;"><a style="color:#494747;" href="#">反馈</a></li>'
			+ '<li><a style="color:#494747;" href="logout.userAction">退出登录</a></li>'
			+ '</ul>';
}

// 日期转换的函数
Date.prototype.Format = function(format) {

	var o = {

		"M+" : this.getMonth() + 1, // month

		"d+" : this.getDate(), // day

		"h+" : this.getHours(), // hour

		"m+" : this.getMinutes(), // minute

		"s+" : this.getSeconds(), // second

		"q+" : Math.floor((this.getMonth() + 3) / 3), // quarter

		"S" : this.getMilliseconds()
	// millisecond

	}

	if (/(y+)/.test(format)) {

		format = format.replace(RegExp.$1, (this.getFullYear() + "")
				.substr(4 - RegExp.$1.length));

	}

	for ( var k in o) {

		if (new RegExp("(" + k + ")").test(format)) {

			format = format.replace(RegExp.$1, RegExp.$1.length == 1 ? o[k]
					: ("00" + o[k]).substr(("" + o[k]).length));

		}

	}

	return format;

}