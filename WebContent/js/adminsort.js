$(function() {
	
	//失去焦点时，检查内容
	$("[name=name]").blur(function(){
		checkName();
	});
	
	$("#upSort").click(function(){
		if(checkName()){//如果检查通过就发送请求
			updateSort();
		}
	});
	
	$("#saveSort").click(function(){
		if(checkName()){//如果检查通过就发送请求
			saveSort();
		}
	});
	
	$(".del").click(function(){
		console.log($(this).context.id);
		showDelNot($(this).context.id);
	});

});

//检查专题名称
function checkName() {

	var name = $("[name=name]").val();
	if (name == "" || name.length == 0) {
		showMsg("分类名称不能为空",'danger');
		return false;
	}
	return true;
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

//更新请求
function updateSort(){
	$.ajax({
		type:'post',
		url: 'updateSort.adminAction', 
		data: 'id='+$('[name=id]').val()+'&name='+$('[name=name]').val()+'&stats='+$('[name=stats]').val(),
		dataType: 'json',
		success: function(data) {
			console.log(data);
			if(data.type=='fail'){//失败
				showMsg('分类更新失败！','danger');
			}else{
				showMsg('分类更新成功！','info');
			}
		}
	});
}

//保存请求
function saveSort(){
	$.ajax({
		type:'post',
		url: 'addSort.adminAction', 
		data: 'name='+$('[name=name]').val()+'&stats='+$('[name=stats]').val(),
		dataType: 'json',
		success: function(data) {
			console.log(data);
			if(data.type=='fail'){//失败
				showMsg('分类保存失败！'+data.data,'danger');
			}else{
				showMsg('分类保存成功！','info');
			}
		}
	});
}

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
			'<button href="#" onclick="delTopic('+id+');" class="btn btn-danger btn-sm" id="delBtn" >确定</button>'+
		'</div>'
	});
}

function delTopic(id){
	//showMsg('id:'+id,'info');//测试所有
	$.ajax({
		type:'post',
		url: 'deleteTopic.adminAction', 
		data: 'id='+id,
		dataType: 'json',
		success: function(data) {
			console.log(data);
			if(data.type=='fail'){//失败
				showMsg('专题删除失败！','danger');
			}else{
				$("#tp"+id).children(".stats").text("删除");//删除那条数据
				showMsg('专题删除成功！','info');
			}
		}
	});
}