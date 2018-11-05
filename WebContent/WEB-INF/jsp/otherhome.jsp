<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"
   %>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>   
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="description" content="sspai">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="generator" content="Codeply">
	
	<title>少数派</title>
	
	<link rel="stylesheet" href="http://cdn.bootcss.com/twitter-bootstrap/3.0.3/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="css/comment.css">
	<link rel="stylesheet" type="text/css" href="css/homepage.css">
	<link rel="stylesheet" type="text/css" href="css/index.css">
	<link rel="stylesheet" type="text/css" href="css/door.css">
	<link rel="stylesheet" type="text/css" href="css/otherhomepage.css">
	<script src="http://cdn.bootcss.com/html5shiv/3.7.0/html5shiv.min.js"></script>
	<script src="http://cdn.bootcss.com/respond.js/1.3.0/respond.min.js"></script>
	
</head>

<body style="background-color:#FAFBFC">
	<!-- 登录 -->
	<div id="myModal" class="modal fade">
    	<div class="modal-dialog">  	
            <form method="post" action="gologin.userAction">
	            <div class="modal-body">
		            <button id="cha" type="button" class="close" data-dismiss="modal">×</button>
		            <h2 style="text-align: center;">
					<img src="images/3.jpg"/>
		            <strong>少数派</strong></h2>
		            <div class="text-right"><a style="text-decoration: none;" href="goregister.userAction">+注册</a></div>
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
					<span style="color: #9B9BB1;">#</span><span id="title">${findUser.nickname}</span>
				</h1>
		<c:choose>
			<c:when test="${findUser==null }">	
				<!-- 登录前的菜单 -->
				<div id="login_before">
				<div class="collapse navbar-collapse" id="example-navbar-collapse navbar-toggleable-xs">
					<ul style="margin-top: 4px;" class="nav navbar-nav pull-right">
	    				<li class="nav-item active"><a class="nav-link" href="goWrite.articleAction"><span class="icon icon-pencil"></span></a></li>

	    				<li class="nav-item">
	    				<a class="nav-link search" href="javascript:;">
	    					<span><i class="icon icon-search"></i></span>
	    				</a></li>
						
						<li class="search_inp">
							<form id="s" action="javascript:;" method="post">
								<input class="form-group search_input" type="text" name="search" placeholder="搜索" />
							</form>
						</li>

						<li class="nav-item"><a class="nav-link" href="#myModal" data-toggle="modal">登录</a></li>
	    			</ul>
				</div>
				</div>
				<!-- 登录前的菜单 -->
				</c:when>
			<c:otherwise>
				<!-- 登录后的菜单 -->
				<div id="login_after">
				<div class="collapse navbar-collapse" id="example-navbar-collapse navbar-toggleable-xs">
					<ul style="margin-top: 4px;" class="nav navbar-nav pull-right">
	    				<li class="nav-item active"><a class="nav-link" href="goWrite.articleAction"><span class="icon icon-pencil"></span></a></li>
	    				<li class="nav-item">
	    				<a class="nav-link search" href="#">
	    					<span><i class="icon icon-search"></i></span>
	    				</a></li>
						
						<li class="search_inp">
							<form id="s" action="#" method="post">
								<input  class="form-group search_input" type="text" name="search" placeholder="搜索" />
							</form>
						</li>

						<li class="nav-item">
	    				<a class="nav-link" href="#">
	    					<span><i class="glyphicon glyphicon-bell"></i></span>
	    				</a></li>
						<li id="btn_login" class="nav-item"><a class="nav-link" href="#" data-toggle="popover"><img style="width:30px;height: 30px; " src="${pageContext.request.contextPath}${loginUser.head_path}" class="img-circle img-responsive"></a></li>
	    			</ul>
				</div> 
				</div>
				<!-- 登录后的菜单 -->
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
	
	<!-- 主体 -->
	<div class="main">
		<div class="user-homepage container">
			<header>
				<div class="inner">
					<div class="user-intro">
						<a href="javascript:;" class="avatar active">
							<img src="${pageContext.request.contextPath}${findUser.head_path}" lazy="loaded" style="width: 60px; height: 60px;">
						</a>
						<div class="body">
							<input type="hidden" name="id" value="${findUser.id}" />
							<h1>${findUser.nickname}</h1>
							<p style="color: rgb(155, 155, 155); margin: 0px 0px 10px; font-size: 14px;">${findUser.good_at}</p>
							<summary>${findUser.introduce}</summary>
							<div class="statistic">
								<label>
									写作总字数 :
									<strong>${findUser.total_num }</strong>
								</label>
								<label>
									获赞数 :
									<strong>${findUser.like_num}</strong>
								</label>
								<label>
									关注 :
									<strong>${findUser.attention_num}</strong>
								</label>
								<label>
									被关注 :
									<strong>${findUser.followed_num}</strong>
								</label>
							</div>
							<div class="console">
								<span>
									<!-- 加判断,是否为关注状态-->
									<c:if test="${is_att}">
										<a class="btn dark-out-line" id="attention">取消关注</a>
									</c:if>
									<c:if test="${!is_att}">
										<a class="btn dark-out-line" id="attention">关注</a>
									</c:if>
									<!-- <a href="javascript:;" class="btn dark-out-line">私信</a> -->
								</span>
							</div>
						</div>
						<hr>
						<ul class="nav nav-tabs">
							<li class="active"><a href="#tab1" data-toggle="tab">评论</a></li>
							<li><a href="#tab2" data-toggle="tab">个人文章</a></li>
							<li><a href="#tab3" data-toggle="tab">喜欢文章</a></li>
						</ul>
					</div>
				</div>
			</header>
			<div class="tab-content">
				<!-- 评论 -->
					<div class="tab-pane active" id="tab1">
						<c:forEach items="${findUser.myComments}" var="mc">
							<div>
								<dl class="article-card dynamic-card">
									<dt>
										<div class="user-card block size40">
											<a href="findUser.userAction?userid=${findUser.id}" class="avatar">
												<img class="img-circle img-responsive" src="${pageContext.request.contextPath}${findUser.head_path}" style="width: 40px;height: 40px">
											</a>
											<h4>
												<a href="findUser.userAction?userid=${findUser.id}" class="uname">${findUser.nickname}</a>
												<em>
												评论了
													<a href="findUser.userAction?userid=${mc.article.user.id}">${mc.article.user.nickname}</a>
												的文章
													<a href="javascript:;">${mc.article.article_name}</a>
											</em>.
											</h4>
											<time><fmt:formatDate value="${mc.create_time}" pattern="yyyy年MM月dd日  HH:mm:ss" /></time>
										</div>
									</dt>
									<dd>
										<blockquote class="comment-quote">
											<a href="javascript">${mc.content}</a>
										</blockquote>
									</dd>
								</dl>							
							</div>
						</c:forEach>
					</div>
				
				<!-- 个人文章 -->
				<div class="tab-pane fade" id="tab2">
					<c:forEach items="${findUser.myArticles}" var="ma">
						<div class="article-card">
							<dt>
								<div class="user-card block">
									<a href="findUser.userAction?userid=${findUser.id}" class="avatar">
										<img class="img-responsive img-circle" style="width:50px;height:50px;" src="${pageContext.request.contextPath}${findUser.head_path}">
									</a>
									<h4 style="display:-webkit-box;">
										<a href="findUser.userAction?userid=${findUser.id}" class="">${findUser.nickname}</a>
										&nbsp;
										<div style="margin-top: 0px;" class="time"></div>
									</h4>
									<time><fmt:formatDate value="${ma.create_time}" pattern="yyyy年MM月dd日  HH:mm:ss" /></time>
								</div>
							</dt>
							<dd class="media">
								<a href="findUser.userAction?userid=${ma.id}" class="pull-right thumb">
									<img src="${pageContext.request.contextPath}${ma.pic_path}" class="media-object door_banner">
								</a>
								<section class="media-body">
									<h3 class="title media-heading">
									<!--标题-->
										<a href="javascript:;" class="">${ma.name}</a>
									</h3>
									<!--内容-->
									<summary class="desc">
										${fn:substring(ma.content,0,200)}
									</summary>
								</section>
								<footer class="meta">
									<div class="actions">
										<span class="like-view">
											<i class="glyphicon glyphicon-heart-empty"></i>
											<sup>4</sup>
										</span>
										<a href="javascript:;" class="btn-comment">
											<i class="glyphicon glyphicon-comment"></i>
											<sup>6</sup>
										</a>
									</div>
								</footer>
							</dd>
					
						</div>
					</c:forEach>
				</div>
				
				<!-- 喜欢文章 -->
				<div class="tab-pane fade" id="tab3">
					<c:forEach items="${findUser.likeArticles}" var="art">
					<div class="article-card">
					
						<dt>
							<div class="user-card block">
								<a href="findUser.userAction?userid=${findUser.id}" class="avatar">
									<img class="img-responsive img-circle" style="width:50px;height:50px;" src="${pageContext.request.contextPath}${findUser.head_path}">
								</a>
								<h4 style="display:-webkit-box;">
									<a href="findUser.userAction?userid=${findUser.id}" class="">${findUser.nickname}</a>
									&nbsp;
									<div style="margin-top: 0px;" class="time">喜欢了文章</div>
								</h4>
								<time><fmt:formatDate value="${art.create_time}" pattern="yyyy年MM月dd日  HH:mm:ss" /></time>
							</div>
						</dt>
						<dd class="media">
							<a href="findUser.userAction?userid=${art.id}" class="pull-right thumb">
								<img src="${pageContext.request.contextPath}${art.pic_path}" class="media-object door_banner">
							</a>
							<section class="media-body">
								<h3 class="title media-heading">
								<!--标题-->
									<a href="javascript:;" class="">${art.name}</a>
								</h3>
								<!--内容-->
								<summary class="desc">
									${fn:substring(art.content,0,200)}
								</summary>
							</section>
							<footer class="meta">
								<div class="actions">
									<span class="like-view">
										<i class="glyphicon glyphicon-heart-empty"></i>
										<sup>4</sup>
									</span>
									<a href="javascript:;" class="btn-comment">
										<i class="glyphicon glyphicon-comment"></i>
										<sup>6</sup>
									</a>
								</div>
							</footer>
						</dd>
					</div>
				</c:forEach>
		</div>
	</div>
	<!-- 主体 -->
	
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
	                <li style="color: #ccc; font-size: 12px">©2013-2017 少数派 | 粤ICP备09128966号-4 | CC BY-NC 4.0</li>
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
	<script type="text/javascript">
	/* 	var attention = document.getElementById("attention");
		attention.onclick = function(){
			alert(attention.text());
			if(attention.text()=="取消关注"){
				attention.text("");
				attention.text("关注");
				
			}else{
				attention.text("");
				attention.text("取消关注");
			}
			
		} */
		
		$(function(){
			
			$("#attention").click(function(){
				/* alert($(this).text()); */
				if($(this).text() == "取消关注"){
					alert("取消关注");
					var id = $("[name=id]").val();
					alert(id);
					sendRequest("delAtt.userAction",id);
					$(this).text("关注");
				}else{
					alert("关注");
					var id = $("[name=id]").val();
					alert(id);
					sendRequest("addAtt.userAction",id);
					$(this).text("取消关注");
				}
			});
			
		});
		
		//进行关注和取消关注,url请求的地址,id关注用户的id
		function sendRequest(url,id){
			$.ajax({
				type: 'post',
				url: url,
				data: 'other_id='+id,
				dataType:'json',
				success:function(result){
					if(result.type=="addsuccess"){
						alert("关注成功!");
					}else if(result.type=="addfail"){
						alert("关注失败");
					}else if(result.type=="delsuccess"){
						alert("已取消关注!");
					}else if(result.type=="delsuccess"){
						alert("取消失败!");
					}
				}
			});
		}
	</script>
</body>
</html>