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

<link rel="stylesheet"
	href="http://cdn.bootcss.com/twitter-bootstrap/3.0.3/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="css/comment.css">
<link rel="stylesheet" type="text/css" href="css/index.css">

<!--  Fonts and icons     -->
<link href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
<link href='https://fonts.googleapis.com/css?family=Muli:400,300' rel='stylesheet' type='text/css'>
<link href="./assets/css/themify-icons.css" rel="stylesheet">
<style type="text/css">
		#love{
			cursor:pointer;
		}
		.color{
			color:red;
		}
		.likecolor{
			color:#D7191A;
			border:#D7191A;
		}
		.likecolor2{
			border:1px solid #D7191A;
		}
	</style>
<script type="text/javascript" src="js/jquery-1.8.3.js"></script>
<script src="http://cdn.bootcss.com/html5shiv/3.7.0/html5shiv.min.js"></script>
<script src="http://cdn.bootcss.com/respond.js/1.3.0/respond.min.js"></script>
<script type="text/javascript">
		$(function(){
			$("h3>a").hover(
				function(){
					$(this).css("color","red");
				},
				function(){
					$(this).css("color","black");
				}
			);
			var count=1;
			$("[class=contact]").click(function(){
				$.ajax({
					type:"post",
					url:"query.articleAction",
					data:"",
					dataType:"json",
					success:function(articles){
						console.log(articles);
						if(count>articles.length){
							alert("哥们！到底啦");
							return;
						}
						for(var i=count;i<count+5; i++){
							if(count>articles.length){
								break;
							}
							var article=articles[i];
							var testDate = new Date();
							//testDate.setTime(article.create_time);//时间的毫秒数进行转化，例如150237984000毫秒
							//var testStr = testDate.toLocaleFormat();// format("yyyy年MM月dd日  hh:mm:ss");
							var testStr = testDate.Format("yyyy年MM月dd日 hh:mm:ss");
							count=count+5;
							var $newNode=$("<dl class='article-card thumbnails'><dt><div class='user-card block'><a href='javascript:;' class='avatar'><img class='img-responsive img-circle' src='images/article.user.head_path'></a><h4><a href='javascript:;' class=''>"+article.user.nickname+"</a></h4><div class='time'>"+testStr+"</div></div><div class='more'><span><a href='javascript:collection.acticleAction;'><i class='glyphicon glyphicon-link'></i></a></span></dt><dd class=''><a href='javascript:;' class='thumbnail'><img src='images/pic3.jpg'></a><section class='title'><h3><a style='text-decoration: none;color:black;' href='articleId.articleAction?opr="+article.id+"'>"+article.article_name+"</a></h3></section><summary class='desc'>"+article.content.substring(0,200)+"</summary><footer class='meta'><div class='actions'><span class='like-view' readonly='readonly' style='cursor:default;'><i class='glyphicon glyphicon-heart-empty' id='love' style='cursor:default;'></i><sup>"+article.like_num+"</sup></span><a href='javascript:;' class='btn-comment' readonly='readonly'><i class='glyphicon glyphicon-comment' style='cursor:default;'></i><sup style='cursor:default;'>"+article.comment_num+"</sup></a></div></footer></dd></dl>");
							$("[class=col-md-9]>dl").after($newNode);
							$("h3>a").hover(
									function(){
										$(this).css("color","red");
									},
									function(){
										$(this).css("color","black");
									}
								);
							/* $("#love").click(function(){
								like();
							}); */
						}
					}
				});
			});
			$(document).keyup(function(events){
				if(events.keyCode=="13"){  //events.keyCode=13回车键
					/* alert("确认要提交吗？"); */
				}
			});
			/* $("#love").click(function(){
				like();
			}); */
		});
		
		function like(){
			/* console.log("控制台："+$("[name=user]").val()); */
			if($("[name=user]").val()!=null && $("[name=user]").val()!=""){
				$.ajax({
					type:"post",
					url:"like.articleAction?articleId="+$("[name=articleId]").val()+"&userId="+$("[name=userId]").val(),
					success:function(result){
						if(result==1){
							$("#likeNum").text(parseInt($("#likeNum").text())+1);
							$("#love").addClass("likecolor");
							$("#likeNum").addClass("likecolor");
							alert("点赞成功！");
						}else{
							$("#likeNum").text(parseInt($("#likeNum").text())-1);
							$("#love").removeClass("likecolor");
							$("#likeNum").removeClass("likecolor");
							alert("取消点赞！");
						}
					}
				});
			}else{
				$("#myModal").modal("show");
			}
		}
		
	</script>
</head>
<body style="background-color: #FAFBFC">
	<!-- 登录 -->
	<div id="myModal" class="modal fade">
		<div class="modal-dialog">
			<form method="post" action="login.userAction">
				<div class="modal-body">
					<button id="cha" type="button" class="close" data-dismiss="modal">×</button>
					<h2 style="text-align: center;">
						<img src="images/3.jpg" /> <strong>少数派</strong>
					</h2>
					<div class="text-right">
						<a style="text-decoration: none;" href="goregister.userAction">+注册</a>
					</div>
					<br>
					<div class="form-group">
						<input class="form-control" type="email" placeholder="邮箱"
							name="user_email" />
					</div>
					<div class="form-group">
						<input class="form-control" type="password" placeholder="密码"
							name="user_password" />
					</div>
					<div class="form-group text-left">
						<label id="klogin" for="keepLogin"> <input
							style="height: auto;" type="checkbox" id="keepLogin" />&nbsp;记住密码
						</label> <a class="pull-right" href="#"> 忘记密码</a>
					</div>
					<div class="form-group">
						<button style="outline: none;" id="login_btn" class="btn"
							type="submit">登录</button>
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
	<header> <nav class="navbar navbar-fixed-top one" id="nav">
	<div class="container">
		<div style="margin-top: 2px;" class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#example-navbar-collapse">
				<span class="sr-only">切换导航</span> <span class="icon-bar"></span> <span
					class="icon-bar"></span> <span class="icon-bar"></span>
			</button>
			<a href="queryAll.articleAction" class="navbar-brand"><img src="images/2.png"
				class="img-circle img-responsive "></a> <a
				style="padding-left: 4px;" class="navbar-brand navbar_barand2"
				href="queryAll.articleAction">少数派</a>
		</div>


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
							<input  class="form-group search_input" type="text" placeholder="搜索"  name="search"/>
						</form>
					</li>
					<li class="nav-item">
    				<a class="nav-link" href="#">
    					<span><i class="glyphicon glyphicon-bell"></i></span>
    				</a></li>
					<li id="btn_login" class="nav-item"><a class="nav-link" href="#" data-toggle="popover"><img src="${pageContext.request.contextPath}${loginUser.head_path}" class="img-circle img-responsive" style="width: 30px;height: 30px"></a></li>
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
	<!-- 副导航 --> <nav class="navbar" id="nav2">
	<div class="container">
		<table class="table table-bordered">
			<thead>
				<th class="text-center"><a href="topicList.topicAction"><i
						class="icon icon-road"></i>&nbsp;专题广场</a></th>
				<th class="text-center"><a href="#"><i class="icon icon-th"></i>&nbsp;Matrix</a></th>
				<th class="text-center"><a href="#"><i
						class="icon icon-calendar">&nbsp;</i>付费栏目</a></th>
				<th class="text-center"><a href="#">效率工具</a></th>
				<th class="text-center"><a href="#">手机摄影</a></th>
				<th class="text-center"><a href="#">生活方式</a></th>
				<th class="text-center"><a href="#">游戏</a></th>
				<th class="text-center"><a href="#">硬件</a></th>
			</thead>
		</table>
	</div>
	</nav> <!-- 副导航 --> </header>
	<!-- 导航条结束 -->

	<!-- 主体 -->

	<div id="home" class="view">
		<!-- 大图片 -->
		<div class="top-banner">
			<div class="first">
				<a href="javascript:;" target="_blank"> <img src="images/5.png"
					style="width: 100%;" />
				</a>
			</div>
		</div>
		<!-- 大图片 -->

		<div class="container essay">
			<div class="row">
				<!-- 左侧信息展示 -->
				<div class="col-md-9">
					<c:forEach var="article" items="${Articles }" end="3">
						<dl class="article-card thumbnails">
							<dt>
								<div class="user-card block">
									<a href="findUser.userAction?userid=${article.user.id}" class="avatar"> <img
										class="img-responsive img-circle" style="width: 40px;height: 40px;"
										src="${pageContext.request.contextPath}${article.user.head_path}">
									</a>
									<h4>
										<a href="findUser.userAction?userid=${article.user.id}" class="">${article.user.nickname }</a>
									</h4>
									<div class="time">
										<fmt:formatDate value="${article.create_time}" pattern="yyyy年MM月dd日  HH:mm:ss" />
									</div>
								</div>
								<div class="more">
									<span> <a href="javascript:collection.acticleAction;">
											<i class="glyphicon glyphicon-link"></i>
									</a>
									</span>
								</div>
							</dt>
							<dd class="">
								<a href="javascript:;" class="thumbnail"> <img src="${pageContext.request.contextPath}${article.pic_path}">
								<!--${article.pic_path}  -->
								</a>
								<section class="title">
								<h3><a style="text-decoration: none;color:black;" href="articleId.articleAction?opr=${article.id }">${article.article_name}</a></h3>
								</section>
								<summary class="desc">
								${fn:substring(article.content,0, 200)} </summary>
								<footer class="meta">
								<div class="actions">
									<span class="like-view" readonly="readonly" style="cursor:default;"> <i
										class="glyphicon glyphicon-heart-empty" id="love" style="cursor:default;"></i> <sup id="likeNum">${article.like_num}</sup>
									</span> <a href="javascript:;" class="btn-comment"> <i
										class="glyphicon glyphicon-comment" style="cursor:default;"></i> <sup style="cursor:default;">${article.comment_num}</sup>
									</a>
								</div>
								</footer>
							</dd>
						</dl>
					</c:forEach>
					<input type="hidden" value="${sessionScope.loginUser }" name="user">
					<input type="hidden" value="${article.id }" name="articleId">
                	<input type="hidden" value="${article.user.id }" name="userId">
					<div class="side">
						<a href="javascript:;" class="contact">加载更多</a>
					</div>
				</div>
				<!-- 左侧信息展示 -->

				<!-- 侧边栏精选信息 -->
				<div class="col-md-3 side">
					<a href="javascript:;" class="contact">寻求合作 | 支持我们</a>
					<dl class="side-section matrix-section">
						<dt>
							<h3>Matrix精选</h3>
						</dt>
						<dd>
							<ul>
								<c:forEach items="${chosenArticle}" var="art">
									<li>
										<h5 class="title">
											<a href="articleId.articleAction?opr=${art.id }">${art.article_name}</a>
										</h5>
										<div class="user-card size48">
											<a href="javascript:;"><img
												class="img-responsive img-circle" src="${pageContext.request.contextPath}${art.user.head_path}"
												lazy="loaded" style="width: 24px; height: 24px;"></a>
											<h4>
												<a href="javascript:;" class="">${art.user.nickname}</a>
											</h4>
										</div>
									</li>
								</c:forEach>
							</ul>
						</dd>
					</dl>
					<dl class="side-section">
						<dt>
							<h3>推荐专题</h3>
							<a href="#" class="more">查看全部</a>
						</dt>
						<dd>
							<c:forEach items="${suggestTopics}" var="topic" >
								<a href="findByTopic.articleAction?topicId=${topic.id}" class="topic-card" data-v-4948e0bc> <img
									data-v-4948e0bc class="banner" src="${pageContext.request.contextPath}${topic.pic_path }"
									lazy="loaded">
									<div data-v-4948e0bc class="mask">
										<h4 data-v-4948e0bc>${topic.name}</h4>
										<span data-v-4948e0bc="" class="btn">查看专题</span>
									</div>
							</c:forEach>
							
						</dd>
					</dl>
					<dl class="side-section"></dl>
				</div>
				<!-- 侧边栏精选信息 -->
			</div>
		</div>
	</div>

	<!-- 主体 -->


	<!-- 底部 -->
	<div class="footer">
		<div class="container">
			<br>
			<br>
			<div class="row footer-top">
				<div class="row">
					<ul class="list-inline text-center foot_icon">
						<li><a href="#"><img class="img-circle img-responsive"
								src="images/7.jpg"></a></li>
						<li><a href="#"><img class="img-circle img-responsive"
								src="images/5.jpg"></a></li>
						<li><a href="#"><img class="img-circle img-responsive"
								src="images/8.jpg"></a></li>
						<li><a href="#"><img class="img-circle img-responsive"
								src="images/9.jpg"></a></li>
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
					<li style="color: #ccc; font-size: 12px">&copy;2013-2017 少数派 |
						粤ICP备09128966号-4 | CC BY-NC 4.0</li>
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
	<script type="text/javascript" src="js/index.js"></script>
</body>
</html>