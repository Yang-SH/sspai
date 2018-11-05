<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"
   %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
	<meta name="description" content="sspai">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="generator" content="Codeply">
	
	<title>少数派</title>
	
	<link rel="stylesheet" href="http://cdn.bootcss.com/twitter-bootstrap/3.0.3/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="css/register.css">
	<script src="http://cdn.bootcss.com/html5shiv/3.7.0/html5shiv.min.js"></script>
	<script src="http://cdn.bootcss.com/respond.js/1.3.0/respond.min.js"></script>
</head>
<body style="background-color:#FAFBFC ">
	        <div class="modal-body">
	        <a href="login.userAction" style="text-decoration: none; color: #292525"><h2 style="text-align: center;">
			<img src="images/3.jpg"/>
		    <strong>少数派</strong></h2></a>
		    <p class="text-center"><span class="shuzi">数字生活消费指南</span></p>
		    </div>
		    <br>
		    <div class="well">
		    <form method="post" action="register.userAction">
			    <div class="form-group">
			        <input class="form-control email_i" type="email" placeholder="邮箱" name="user_email" />
			    </div>
			    <div class="form-group">
			        <input class="form-control username_i" type="text" placeholder="昵称" name="user_nickname" />
			    </div>
		        <div class="form-group">
			        <input class="form-control password_i" type="password" placeholder="密码" name="user_password" />
			    </div>
			    <div class="form-group text-left">
			        <label id="klogin" for="keepLogin">
			            <input style="height: auto;" type="checkbox" id="keepLogin"/>&nbsp;我已阅读并同意《<a href="#" style="text-decoration: none;">少数派用户协议</a>》
			        </label>
			    </div>
			    <div class="form-group">
			        <button name="submit" id="login_btn" class="btn" type="submit">注册</button>
			    </div>
		    </form>
		    </div>
	<!-- script包 -->
	<script type="text/javascript" src="js/jquery-3.1.1.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
</body>
</html>