$(function() {
	
	$(".del").click(function(){
		console.log($(this).context.id);
		showDelNot($(this).context.id);
	});

});

//弹出删除框
function showDelNot(id){
	$.notify({
		icon: 'https://randomuser.me/api/portraits/med/men/77.jpg',
		title: '提示：',
		message: '确定要删除吗？',
	},{
		type: 'danger',
		delay: 1,
		icon_type: 'image',
		template: '<div data-notify="container" class="col-xs-11 col-sm-3 alert alert-{0}" role="alert">' +
			'<span data-notify="title">{1}</span>' +
			'<span data-notify="message">{2}</span>' +
			'<button href="#" onclick="delChosen('+id+');" class="btn btn-danger btn-sm" id="delBtn" >确定</button>'+
		'</div>'
	});
}

function delChosen(id){
	//showMsg('id:'+id,'info');//测试所用
	
	$.ajax({
		type:'post',
		url: 'setChosen.adminAction', 
		data: 'id='+id+'&chosen=0',//chosen=0为0表示不是精选
		dataType: 'json',
		success: function(data) {
			console.log(data);
			if(data.type=='fail'){//失败
				showMsg('精选删除失败！','danger');
			}else{
				$("#ch"+id).remove();//删除那条数据
				showMsg('精选删除成功！','info');
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