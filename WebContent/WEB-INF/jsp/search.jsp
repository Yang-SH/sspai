<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
	<link rel="stylesheet" type="text/css" href="css/index.css">
	<link rel="stylesheet" type="text/css" href="css/door.css">
	<link rel="stylesheet" type="text/css" href="css/homepage.css">
	<link rel="stylesheet" type="text/css" href="css/search.css">
	<script type="text/javascript" src="js/jquery-1.8.3.js"></script>
	<script src="http://cdn.bootcss.com/html5shiv/3.7.0/html5shiv.min.js"></script>
	<script src="http://cdn.bootcss.com/respond.js/1.3.0/respond.min.js"></script>
	<script type="text/javascript">
		$(function(){
			$(document).keyup(function(events){
				if(events.keyCode=="13"){  //events.keyCode=13回车键
					/* alert("确认要提交吗？"); */
				}
			});
		});
	</script>
</head>
<body style="background-color:#FAFBFC" class="search-body">
	<!-- 登录 -->
	<div id="myModal" class="modal fade">
    	<div class="modal-dialog">  	
            <form method="post" action="#">
	            <div class="modal-body">
		            <button id="cha" type="button" class="close" data-dismiss="modal">×</button>
		            <h2 style="text-align: center;">
					<img src="images/3.jpg"/>
		            <strong>少数派</strong></h2>
		            <div class="text-right"><a style="text-decoration: none;" href="register.html">+注册</a></div>
		            <br>
		            <div class="form-group">
		            	<input class="form-control" type="email" placeholder="邮箱" name="email" />
		            </div>
	            	<div class="form-group">
		            	<input class="form-control" type="password" placeholder="密码" name="password" />
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
					<a href="queryAll.articleAction" class="navbar-brand"><img src="images/2.png" class="img-circle img-responsive "></a>
					<a style="padding-left:4px;" class="navbar-brand navbar_barand2" href="queryAll.articleAction">少数派</a>
				</div>
				
				<!-- <h1>
					<span style="color: #9B9BB1;">#</span><span id="title">Android</span>
				</h1> -->
				
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
										<input  class="form-group search_input" type="text" placeholder="搜索" name="search"/>
									</form>
								</li>
								<li class="nav-item">
			    				<a class="nav-link" href="#">
			    					<span><i class="glyphicon glyphicon-bell"></i></span>
			    				</a></li>
								<li id="btn_login" class="nav-item"><a class="nav-link" href="#" data-toggle="popover"><img src="${pageContext.request.contextPath}${loginUser.head_path}" style="width: 30px;height: 30px;" class="img-circle img-responsive"></a></li>
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
			    				<li class="nav-item active"><a class="nav-link" href="#"><span class="icon icon-pencil"></span></a></li>
			
			    				<li class="nav-item">
			    				<a class="nav-link search" href="#">
			    					<span><i class="icon icon-search"></i></span>
			    				</a></li>
								
								<li class="search_inp">
									<form id="s" action="search.articleAction" method="post">
										<input  class="form-group search_input" type="text" placeholder="搜索" name="search"/>
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
	
	<!-- 主体 -->
	<div class="container ">
		<div class="well well-sm">
			<header>
				<div class="inner">
					<form method="post" action="search.articleAction" class="search-form-wrap">
						<div class="search-form">
							<input type="text" placeholder="请输入搜索关键词" class="text" name="search" value="${requestScope.search }"/>
							<button type="submit" class="btn">搜索</button>
						</div>
					</form>
				</div>
			</header>
			<p style="height: 100px;"></p>
			<div>
				<ul class="nav nav-pills">
					<li class="active"><a href="#tab1" data-toggle="tab">文章(<span>${requestScope.articlele.article_num}</span>)</a></li>
					<li><a href="#tab2" data-toggle="tab">作者(<span>${UserNum}</span>)</a></li>
					<li><a href="#tab3" data-toggle="tab">专题(<span>${TopicNum}</span>)</a></li>
				</ul>
			</div>
		</div>
		<div class="result-wrap col-md-9">
			<div class="router-main tab-content">
				<div class="tab-pane active" id="tab1">
				<c:forEach var="article" items="${requestScope.Articles }">
					<div class="article-card">
						<dt>
							<div class="user-card block">
								<a href="javascript:;" class="avatar">
									<img class="img-responsive img-circle" src="images/10.jpg">
								</a>
								<h4>
									<a href="findUser.userAction?userid=${article.user.id}" class="">${article.user.nickname }</a>
								</h4>
								<div class="time"><fmt:formatDate value="${article.create_time}" pattern="yyyy年MM月dd日  HH:mm:ss" /></div>
							</div>
							<div class="more">
								<span>
									<a href="javascript:;">
									<i class="glyphicon glyphicon-link"></i>
									</a>
								</span>
							</div>
						</dt>
						<dd class="media">
							<a href="javascript:;" class="pull-right thumb">
								<img src="images/pic16.jpg" class="media-object door_banner">
							</a>
							<section class="media-body">
								<h3 class="title media-heading">
									<a href="articleId.articleAction?opr=${article.id }">${article.article_name}</a>
								</h3>
								<summary class="desc">
									${fn:substring(article.content,0, 200)}
								</summary>
							</section>
							<footer class="meta">
								<div class="actions">
									<span class="like-view">
										<i class="glyphicon glyphicon-heart-empty"></i>
										<sup>${article.like_num}</sup>
									</span>
									<a href="javascript:;" class="btn-comment">
										<i class="glyphicon glyphicon-comment"></i>
										<sup>${article.comment_num}</sup>
									</a>
								</div>
							</footer>
						</dd>
					</div>
				</c:forEach>
				</div>
				<div style="margin-bottom: 20px;" class="tab-pane fade" id="tab2">
					<div class="user-search-list">
						<c:forEach items="${findUsers}" var="fUser" >
							<div class="user-card block size100" data-v-bd430356>
								<a href="findUser.userAction?userid=${fUser.id}" class="avatar">
									<img src="${pageContext.request.contextPath}${fUser.head_path}" lazy="loaded" style="width: 50px;height: 50px;">
								</a>
								<h4>
									<a href="findUser.userAction?userid=${fUser.id}">${fUser.nickname}</a>
								</h4>
								<div data-v-bd430356="" class="desc">${fUser.article_num!=0?fUser.article_num:0} 篇文章</div>
							</div>	
						</c:forEach>
					</div>
				</div>
				<div class="tab-pane fade" id="tab3">
					<!-- <div class="no-data">暂无应用</div> -->
					<c:forEach items="${findTopics}" var="topic" >
							<a href="findByTopic.articleAction?topicId=${topic.id}" class="topic-card" data-v-4948e0bc> <img
								data-v-4948e0bc class="banner" src="${pageContext.request.contextPath}${topic.pic_path }"
								lazy="loaded">
								<div data-v-4948e0bc class="mask">
									<h4 data-v-4948e0bc>${topic.name}</h4>
									<span data-v-4948e0bc="" class="btn">查看专题</span>
								</div>
					</c:forEach>
				</div>
			</div>
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
</body>
</html>