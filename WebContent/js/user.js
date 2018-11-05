$(function(){
	
	$(".del").click(function(){
		console.log($(this).context.id);
		showDelUser($(this).context.id);
	});
	
});

//用与生成通知的函数
function showDelUser(id){
	$.notify({
		icon: 'https://randomuser.me/api/portraits/med/men/77.jpg',
		title: '提示：',
		message: '这会将这个用户下的所有文章删除，确定要删除吗？',
	},{
		type: 'danger',
		delay: 1,
		icon_type: 'image',
		template: '<div data-notify="container" class="col-xs-11 col-sm-3 alert alert-{0}" role="alert">' +
			'<span data-notify="title">{1}</span>' +
			'<span data-notify="message">{2}</span>' +
			'<button href="#" onclick="delUser('+id+');" class="btn btn-danger btn-sm" id="delBtn" >确定</button>'+
		'</div>'
	});
}

function delUser(id){
	//showMsg('id:'+id,'info');//测试所有
	$.ajax({
		type:'post',
		url: 'deleteUser.adminAction', 
		data: 'id='+id,
		dataType: 'json',
		success: function(data) {
			console.log(data);
			if(data.type=='fail'){//失败
				showMsg('删除失败！','danger');
			}else{
				$("#us"+id).remove();//删除那条数据
				showMsg('删除成功！','info');
			}
		}
	});
}

function showMsg(msg,type){
	//'top','center',
	$.notify({
		title : '<strong>提示</strong>',
		message : ''+msg,
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