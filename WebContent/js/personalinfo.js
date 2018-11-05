$(function(){
    var lis=$("li");
    $.each(lis,function(i){
    $(lis[i]).click(function(e){
    $(".active").removeClass('active');
    $(this).addClass('active');
        });
    });

    $("#z").click(function(){
    	$(".user_pwd").show(300);
    	$(".base_message").hide(300);
    	$("#title").html("");
    	$("#title").html("帐号密码");
    });
    $("#j").click(function(){
    	$(".base_message").show(300);
    	$(".user_pwd").hide(300);
    	$("#title").html("");
    	$("#title").html("基本信息");
    });

    $("#user_password").blur(function(){
        checkPwd();
    });

    $("#user_rpassword").blur(function(){
        checkrPwd();
    });
});

    // 表单验证
    function checkPwd(){
        var $psd = $("#user_password");
        if ($psd.val()=="") {
            alert("密码不能为空");
            return false;
        }
        var reg = /^\w{6,20}$/;
        if (!reg.test($psd.val())) {
            alert("密码需要6到20位");
            return false;
        }else{
            return true;
        }
    }

    function checkrPwd(){
        var $psd = $("#user_password");
        var $rpsd = $("#user_rpassword");
        if ($rpsd.val()=="") {
            alert("确认密码不能为空");
            return false;
        }
        if ($psd.val()!= $rpsd.val()){
            alert("两次密码不一致");
            return false;
        }else{
            return true;
        }
    }