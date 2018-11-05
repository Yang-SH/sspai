$(function() {

	$(".del").click(function() {
		console.log($(this).context.id);
		showDelNot($(this).context.id);
	});

	$("select[name=stats]").change(function() {
		console.log("stats:" + $(this).val());
		// alert($(this).val());
		var stats = $(this).val();
		// 获取文章id
		var id = $("[name=id]").val();
		console.log("article id:" + id);
		updateStats(stats, id);

	});

	$(".isCho").click(function() {
		setChosen($(this).context.id);
	});

});

// 此方法用户更新文章的状态
// stats：状态，id：文章的id
function updateStats(stats, id) {
	$.ajax({
		type : 'post',
		url : 'updateArticle.adminAction',
		data : 'id=' + id + '&stats=' + stats,
		dataType : 'json',
		success : function(data) {
			console.log(data);
			if (data.type == 'fail') {// 失败
				showMsg('文章更新失败！', 'danger');
			} else {
				showMsg('文章更新成功！', 'info');
			}
		}
	});
}

function setChosen(id) {
	$.ajax({
		type : 'post',
		url : 'setChosen.adminAction',
		data : 'id=' + id + '&chosen=1',
		dataType : 'json',
		success : function(data) {
			console.log(data);
			if (data.type == 'fail') {// 失败
				if(data.data!=null){
					showMsg('设置精选失败！只能添加5个精选！', 'danger');
				}else{
					showMsg('设置精选失败！', 'danger');
				}
			} else {
				$("#cho"+id).html("精选");
				showMsg('设置精选成功！', 'info');
			}
		}
	});
}

// 弹出删除框
function showDelNot(id) {
	$
			.notify(
					{
						icon : 'https://randomuser.me/api/portraits/med/men/77.jpg',
						title : '提示：',
						message : '确定要删除吗？',
					},
					{
						type : 'danger',
						delay : 1,
						icon_type : 'image',
						template : '<div data-notify="container" class="col-xs-11 col-sm-3 alert alert-{0}" role="alert">'
								+ '<span data-notify="title">{1}</span>'
								+ '<span data-notify="message">{2}</span>'
								+ '<button href="#" onclick="delArticle('
								+ id
								+ ');" class="btn btn-danger btn-sm" id="delBtn" >确定</button>'
								+ '</div>'
					});
}

function delArticle(id) {
	// showMsg('id:'+id,'info');//测试所用

	$.ajax({
		type : 'post',
		url : 'deleteArticle.adminAction',
		data : 'id=' + id,
		dataType : 'json',
		success : function(data) {
			console.log(data);
			if (data.type == 'fail') {// 失败
				showMsg('文章删除失败！', 'danger');
			} else {
				// $("#tp"+id).children(".stats").text("删除");//删除那条数据
				showMsg('文章删除成功！', 'info');
			}
		}
	});
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