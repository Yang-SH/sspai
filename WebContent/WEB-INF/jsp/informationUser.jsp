<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta charset="UTF-8">
<meta name="description" content="sspai">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="generator" content="Codeply">
<title>修改用户信息</title>
<script type="text/javascript" src="js/jquery-1.8.3.js"></script>
<!-- <link rel="stylesheet" href="http://cdn.bootcss.com/twitter-bootstrap/3.0.3/css/bootstrap.min.css"> -->
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="css/comment.css">
<link rel="stylesheet" type="text/css" href="css/personalinfo.css">
<!-- <script src="http://cdn.bootcss.com/html5shiv/3.7.0/html5shiv.min.js"></script>
<script src="http://cdn.bootcss.com/respond.js/1.3.0/respond.min.js"></script> -->

</head>
<body style="background-color:#FAFBFC">
	<!-- 登录 -->
	<div id="myModal" class="modal fade">
    	<div class="modal-dialog"> 
    	<!-- 登陆 -->  	
            <form method="post" action="login.userAction">
	            <div class="modal-body">
		            <button id="cha" type="button" class="close" data-dismiss="modal">×</button>
		            <h2 style="text-align: center;">
					<img src="images/3.jpg"/>
		            <strong>少数派</strong></h2>
		            <div class="text-right"><a style="text-decoration: none;" href="register.html">+注册</a></div>
		            <br>
		            <div class="form-group">
		            	<input class="form-control" type="email" placeholder="邮箱" name="user_email" />
		            </div>
	            	<div class="form-group">
		            	<input class="form-control" type="password" placeholder="密码" name="user_password" />
		            </div>
		            <div class="form-group text-left">
		            	<label id="klogin" for="keepLogin">
		            		<input style="height: auto;" type="checkbox" id="keepLogin"/>&nbsp;记住密码
		            	</label>
		            	<a class="pull-right" href="#">
		            	忘记密码</a>
		            </div>
		            <div class="form-group">
		            	<button style="outline: none;" id="login_btn" class="btn" type="submit">登录</button>
		            </div>
	            </div>
            </form>
            <div class="modal-footer">
				<div class="text-center">
					<div class="xinlang">
						<img class="xinlang img-circle img-responsive" src="images/5.jpg">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<img class="weixin img-circle img-responsive" src="images/4.jpg">
					</div>
					<p></p>
					<span>用社交帐号快捷登录</span>
				</div>
            </div>
        </div>
    </div>
    <!-- 登录 -->
	
	<!--导航条开始  -->
	<header>
		<nav class="navbar navbar-fixed-top one" id="nav">
		<div class="container">	
			<div style="margin-top: 2px;" class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#example-navbar-collapse">
					<span class="sr-only">切换导航</span>  
                    <span class="icon-bar"></span>  
                    <span class="icon-bar"></span>  
                    <span class="icon-bar"></span>  
				</button>
				<a href="#" class="navbar-brand"><img src="images/2.png" class="img-circle img-responsive "></a>
				<a style="padding-left:4px;" class="navbar-brand navbar_barand2" href="#">少数派</a>
			</div>
			
			<h1>
				<span style="color: #9B9BB1;">#</span><span id="title">Android</span>
			</h1>		
	<c:choose>
		<c:when test="${loginUser!=null }">
			
				<!-- 登录后的菜单 -->
			<div id="login_after">
			<div class="collapse navbar-collapse" id="example-navbar-collapse navbar-toggleable-xs">
				<ul style="margin-top: 4px;" class="nav navbar-nav pull-right">
    				<li class="nav-item active"><a class="nav-link" href="gowrite.articleAction"><span class="icon icon-pencil"></span></a></li>
    				<li class="nav-item">
    				<a class="nav-link search" href="#">
    					<span><i class="icon icon-search"></i></span>
    				</a></li>	
					<li class="search_inp">
						<form id="s" action="search.articleAction" method="post">
							<input  class="form-group search_input" type="text" name="search" placeholder="搜索" />
						</form>
					</li>
					<li class="nav-item">
    				<a class="nav-link" href="#">
    					<span><i class="glyphicon glyphicon-bell"></i></span>
    				</a></li>
					<li id="btn_login" class="nav-item"><a class="nav-link" href="#" data-toggle="popover"><img src="${pageContext.request.contextPath}${loginUser.head_path}" class="img-circle img-responsive" style="width: 30px; height: 30px;"></a></li>
    			</ul>
			</div> 
			</div>
			<!-- 登录后的菜单 -->		
		</c:when>
		<c:otherwise>
			<!-- 登录前的菜单 -->
			<div id="login_before">
			<div class="collapse navbar-collapse" id="example-navbar-collapse navbar-toggleable-xs">
				<ul style="margin-top: 4px;" class="nav navbar-nav pull-right">
    				<li class="nav-item active"><a class="nav-link" href="gowrite.articleAction"><span class="icon icon-pencil"></span></a></li>

    				<li class="nav-item">
    				<a class="nav-link search" href="#">
    					<span><i class="icon icon-search"></i></span>
    				</a></li>
					
					<li class="search_inp">
						<form id="s" action="search.articleAction" method="post">
							<input  class="form-group search_input" type="text" name="search" placeholder="搜索" />
						</form>
					</li>

					<li class="nav-item"><a class="nav-link" href="#myModal" data-toggle="modal">登录</a></li>
    			</ul>
			</div>
			</div>
			<!-- 登录前的菜单 -->
		</c:otherwise>
	</c:choose>
			
		</div>
	</nav>
		<div style="height: 64px;"></div>
		<!-- 副导航 -->
		<nav class="navbar" id="nav2">
			<div class="container">
				<table class="table table-bordered">
					<thead >
						<th class="text-center"><a href="topicList.topicAction"><i class="icon icon-road"></i>&nbsp;专题广场</a></th>
						<th class="text-center"><a href="#"><i class="icon icon-th"></i>&nbsp;Matrix</a></th>
						<th class="text-center"><a href="#"><i class="icon icon-calendar">&nbsp;</i>付费栏目</a></th>
						<th class="text-center"><a href="#">效率工具</a></th>
						<th class="text-center"><a href="#">手机摄影</a></th>
						<th class="text-center"><a href="#">生活方式</a></th>
						<th class="text-center"><a href="#">游戏</a></th>
						<th class="text-center"><a href="#">硬件</a></th>
					</thead>
				</table>
			</div>
		</nav>
		<!-- 副导航 -->
	</header>
	<!-- 导航条结束 -->

	
	<div id="main_body" class="container">
		<ul>
			<li class="active"><a href="#" id="j">基本信息</a></li>
			<li><a href="#" id="z">帐号密码</a></li>
			<li><a href="#" id="x">消息与邮件</a></li>
			<li><a href="#" id="s">实名验证</a></li>
		</ul>
		<!-- 基本信息 -->
		<div id="setingbody" class="tab-content base_message">
			<div id="tab1">
				<img src="${pageContext.request.contextPath}${loginUser.head_path}" class="img-circle img-responsive img">
				<div class="info">
					<h3><strong>个人头像</strong></h3>
					<p class="desc">请使用最大不超过 500k 的图片</p>
					<div class="el-upload">
						<button class="btn btn-danger" type="button">选择文件</button>
					</div>
				</div>
			</div>
			<!-- 修改个人信息 -->
			<form method="post" action="modification.userAction">
				<div class="form-group">
					<label for="user_nickname">昵称<span style="color: red">*</span></label>
					<p></p>
					<input type="text" id="user_nickname" name="user_nickname" class="form-control" placeholder="请输入昵称" value="${loginUser.nickname}" />
				</div>
				<div class="form-group">
					<label for="user_job">职业</label>
					<p></p>
					<input type="text" id="user_job" name="user_job" class="form-control" placeholder="请输入职业" />
				</div>
				<div class="form-group">
					<label for="good_at">擅长领域</label>
					<p></p>
					<input type="text" id="good_at" name="user_good_at" class="form-control" placeholder="请输入文字，用逗号分隔"  value="${loginUser.good_at}"/>
				</div>
				<div class="form-group">
					<label for="user_introduce">个人简介</label>
					<p></p>
					<div>
						<textarea class="el-textarea" placeholder="请输入个人简介" rows="4" maxlength="200" id="user_introduce" name="user_introduce" >${loginUser.introduce}</textarea>
					</div>
				</div>
				<div class="form-group text-center">
					<button name="btn" class="btn btn-primary btn-lager">保存</button>
				</div>
			</form>
		</div>
		<!-- 基本信息 -->

		<!-- 帐号密码 -->
		<div id="setingbody" class="tab-content user_pwd">
		<!-- 修改密码 -->
			<form method="post" action="passwd.userAction">
				<div class="form-group">
					<label for="user_email">绑定邮箱</label>
					<p></p>
					<input type="text" id="user_email" readonly="readonly" name="user_email" class="form-control" placeholder="请输入电子邮箱" value="${loginUser.email}"/>
				</div>
				<div class="form-group">
					<label for="user_password
					">修改密码</label>
					<p><span id="a_user_newpassword" style="color:red"></span></p>
					<input type="password" id="user_newpassword" name="user_newpassword" class="form-control" placeholder="请输入新密码" />
					<p><span id="a_user_rnewpassword" style="color:red"></span></p>
					<input type="password" id="user_rnewpassword" name="user_rnewpassword" class="form-control" placeholder="请再次输入新密码" />
				</div>
				<br>
				<hr style="border: 1px solid rgba(155,155,155,.3);">
				<div class="form-group">
					<input type="password" id="user_password" name="user_password" class="form-control" placeholder="更改邮箱或修改密码前请输入原密码" />
				</div>
				<div class="form-group text-center">
					<button name="btn" class="btn btn-primary btn-lager" type="submit">保存</button>
				</div>
			</form>
		</div>
		<!-- 帐号密码 -->
	</div>

	<!-- 底部 -->
	<div class="footer">
	    <div class="container">
	    	<br><br>
	        <div class="row footer-top">
	           <div class="row">
	           		<ul class="list-inline text-center foot_icon">
	           			<li><a href="#"><img class="img-circle img-responsive" src="images/7.jpg"></a></li>
	           			<li><a href="#"><img class="img-circle img-responsive" src="images/5.jpg"></a></li>
	           			<li><a href="#"><img class="img-circle img-responsive" src="images/8.jpg"></a></li>
	           			<li><a href="#"><img class="img-circle img-responsive" src="images/9.jpg"></a></li>
	           		</ul>
	           </div>
	           <br>
	           <div class="row">
	              <ul class="list-inline text-center foot_ul">
	              	<li><a href="#">支持我们</a></li>
	              	<li><a href="#">作者招募</a></li>
	              	<li><a href="#">用户协议</a></li>
	              	<li><a href="#">FAQ</a></li>
	              	<li><a href="#">Contact Us</a></li>
	              </ul>
	           </div>
        	</div>
	        <div class="row footer-bottom">
	            <ul class="list-inline text-center">
	                <li style="color: #ccc; font-size: 12px">&copy;2013-2017 少数派 | 粤ICP备09128966号-4 | CC BY-NC 4.0</li>
	            </ul>
	        </div>
	        <br>
    	</div>
	</div>
	<!-- 底部 -->
	<!-- script包 -->
	<script type="text/javascript" src="js/jquery-3.1.1.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/comment.js"></script>
	<script type="text/javascript" src="js/personalinfo.js"></script>
</body>
</html>