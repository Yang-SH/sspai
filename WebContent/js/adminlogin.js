$(function(){
	//账号输入失去焦点
	$("[name=account]").blur(function(){
		checkAccount();
	});
	
	//账号输入失去焦点
	$("[name=password]").blur(function(){
		checkPwd();
	});
	
	//进行登录验证
	$("#subBtn").click(function(){
		var flag = true;

		if(!checkAccount()) {
			flag = false;
		}

		if(!checkPwd()) {
			flag = false;
		}
		//alert(flag);
		if(flag){//验证成功使用ajax进行登录
			dologin();
		}
	});
	
});

//账号
function checkAccount() {
	var account = $('[name=account]').val();
	if(account == "" || account.length==0) {
		showNotification('top','center','账号不能为空！');
		return false;
	}
	var reg = /^[a-zA-Z0-9]{4,16}$/; //用于匹配的
	if(!reg.test(account)) {
		showNotification('top','center','账号格式错误！,账号格式必须是4-16位的字母数字');
		return false;
	}
	return true;
}

//密码
function checkPwd() {
	var pwd = $('[name=password]').val();
	if(pwd == "" || pwd.length==0) {
		showNotification('top','center','密码不能为空！');
		return false;
	}
	var reg = /^[a-zA-Z0-9]{4,16}$/; //用于匹配的
	if(!reg.test(pwd)) {
		showNotification('top','center','密码格式错误！,密码格式必须是4-16位的字母数字');
		return false;
	}
	return true;
}

//用与生成通知的函数
function showNotification(from, align,msg){
	color = Math.floor((Math.random() * 4) + 1);
	//alert(align);
	$.notify({
		title: '<strong>错误!</strong>',
		message: ''+msg
	},{
		type: 'danger',
		animate: {
			enter: 'animated bounceInDown',
			exit: 'animated bounceOutUp'
		},
		placement: {
            from: from,
            align: align
        }
	});
	//$.notify("Hello World");//这是一个简单的通知
}

//使用ajax进行登录
function dologin(){
	//alert(1);
	$.ajax({
		type:'post',
		url: 'login.adminAction', 
		data: 'account='+$('[name=account]').val()+'&password='+$('[name=password]').val(),
		dataType: 'json',
		success: function(data) {
			//alert(data);
			//window.location = "main.adminAction";
			if(data.type=='fail'){//失败
				showNotification('top','center','登录失败！请检查账号和密码');
			}else{
				window.location = "admin.adminAction";
			}
		}
	});
	
}