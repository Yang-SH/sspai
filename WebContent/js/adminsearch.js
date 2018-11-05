$(function() {

	$("#searchForm").submit(function() {
		if (checkSearch()) {
			return true;
		} else {
			return false;
		}
	});

});
// 检查搜索内容是否为空
function checkSearch() {
	if ($("[name=name]").val() == "" || $("[name=name]").val() == null) {
		showMsg("搜索内容不能为空！", "danger");
		return false;
	} else {
		return true;
	}
}
function showMsg(msg, type) {
	// 'top','center',
	$.notify({
		title : '<strong>提示</strong>',
		message : '' + msg,
	}, {
		type : type,
		animate : {
			enter : 'animated bounceInDown',
			exit : 'animated bounceOutUp'
		},
		animate : {
			enter : 'animated fadeInDown',
			exit : 'animated fadeOutUp'
		},
		placement : {
			from : 'top',
			align : 'center'
		}
	});
}