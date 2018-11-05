<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
	<link rel="stylesheet" type="text/css" href="css/show.css">
	<style type="text/css">
		span{
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
			$("[name=comment]").focus(function(){
				if($("[name=user]").val()==null || $("[name=user]").val()==""){
					$("#myModal").modal("show");
				}
			});
			$("#send").click(function(){
				if($("[name=user]").val()!=null && $("[name=user]").val()!=""){
					$.ajax({
						type:"post",
						url:"comment.articleAction",
						data:"comment="+$("[name=comment]").val()+"&articleId="+$("[name=articleId]").val()+"&userId="+$("[name=userId]").val(),
						success:function(num){
							/* alert(num); */
							if(num>0){
					 			$.ajax({
					 				type: "post",
					 				url:"queryAllComment.articleAction?articleId="+$("[name=articleId]").val(),
					 				dataType:"json",
					 				success :function(comments) {
										$(".comment-list").html("");
										for(var i=0;i<comments.length;i++){
											var comment=comments[i];
											var testDate = new Date();
											testDate.setTime(comment.create_time);//时间的毫秒数进行转化，例如150237984000毫秒
											var time = testDate.toLocaleFormat();
											var $comment=$("<li class='comment-item'><a class='avatar' href='javascript:;'><img alt='VkinG' src='"+comment.user.head_path+"'></a><section><h5>"+comment.user.nickname+"</h5><div class='body'>"+comment.content+"</div><div class='ext'><time>"+time+"</time></div></section></li>");
											$(".comment-list").append($comment);
				 						}
					 				}
								});
							}else{
								alert("发送失败");
							}
						}
					});
				}else{
					$("#myModal").modal("show");
				}
			});
			$("[class=btn-collection]").hover(
				function(){
					$(this).addClass("color");
				},
				function(){
					$(this).removeClass("color");
				}
				
			);
			$("[class=btn-collection]").click(function(){
				if($("[name=user]").val()!=null && $("[name=user]").val()!=""){
					$.ajax({
						type:"post",
						url:"collection.articleAction?articleId="+$("[name=articleId]").val()+"&userId="+$("[name=userId]").val(),
						success:function(result){
							if(result==1){
								alert("收藏成功！");
							}else{
								alert("已取消收藏！");
							}
						}		
					});
				}else{
					$("#myModal").modal("show");
				}
			});
			$("[class=btn-like]").click(function(){
				/* console.log("控制台："+$("[name=user]").val()); */
				if($("[name=user]").val()!=null && $("[name=user]").val()!=""){
					$.ajax({
						type:"post",
						url:"like.articleAction?articleId="+$("[name=articleId]").val()+"&userId="+$("[name=userId]").val(),
						success:function(result){
							if(result==1){
								$("#likeNum").text(parseInt($("#likeNum").text())+1);
								$("[class=btn-like]").css("border","1px solid red");
								$("#love").addClass("likecolor");
								$("#likeNum").addClass("likecolor");
								alert("点赞成功！");
							}else{
								$("#likeNum").text(parseInt($("#likeNum").text())-1);
								$("[class=btn-like]").css("border","1px solid #000");
								$("#love").removeClass("likecolor");
								$("#likeNum").removeClass("likecolor");
								alert("取消点赞！");
							}
						}
					});
				}else{
					$("#myModal").modal("show");
				}
			});
		});
	</script>
</head>
<body style="background-color:#FAFBFC">
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
										<input  class="form-group search_input" type="text" placeholder="搜索" name="search"/>
									</form>
								</li>
								<li class="nav-item">
			    				<a class="nav-link" href="#">
			    					<span><i class="glyphicon glyphicon-bell"></i></span>
			    				</a></li>
								<li id="btn_login" class="nav-item"><a class="nav-link" href="#" data-toggle="popover"><img src="images/6.jpg" class="img-circle img-responsive"></a></li>
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
	<div class="main container">
		<div class="article-detail">
			<article>
				<img src="images/6.png" class="banner">
				<h1 class="title">纪念碑谷2 Android 版国内发售，你买了吗？</h1>
				<div class="meta">
					<div class="user-card size60">
						<a href="javascript:;" class="avatar">
							<img src="images/6.jpg" class="img-circle img-responsive" style="width: 30px;height: 30px;">
						</a>
						<h4><a href="findUser.userAction?userid=${article.id}">${article.user.nickname }</a></h4>
						<time><fmt:formatDate value="${article.create_time}" pattern="yyyy年MM月dd日  HH:mm:ss" /></time>
						<div class="actions">
							<span class="like-view">
								<i class="glyphicon glyphicon-heart-empty i-like"></i>
								<sup>${article.like_num}</sup>
							</span>
							<a href="javascript:;" class="btn-comment">
								<i class="glyphicon glyphicon-comment i-comment"></i>
								<sup>${article.comment_num}</sup>
							</a>
						</div>
					</div>
				</div>
				<div id="article-content" class="article-content">
					<div class="content wangEditor-txt">
						<div>${article.content}</div>
					</div>
					<div class="tags">
						<span class="label label-default">
							<a href="javascript:;" class="label_child">#游戏</a>
						</span>
						<span style="margin-left: 10px;" class="label label-default">
							<a href="javascript:;" class="label_child">#Android</a>
						</span>
						<span style="margin-left: 10px;"  class="label label-default">
							<a href="javascript:;" class="label_child">#腾讯</a>
						</span>
					</div>
					<div class="copyright">
                  	© 本文著作权归作者所有，并授权少数派独家使用，未经少数派许可，不得转载使用。
                	</div>
                	<hr>
                	<section class="action-region">
	                	<a style="text-decoration: none;" href="javascript:;" class="btn-like">
	                		<i class="glyphicon glyphicon-heart-empty" id="love"></i>
	                		<sup id="likeNum">${article.like_num}</sup>
	                	</a>
	                	<a style="text-decoration: none;" href="javascript:;" class="btn-collection">
	                		分享
	                	</a>
	                	<span style="text-decoration: none;" class="btn-collection">
	                		收藏
	                	</span>
	                	<input type="hidden" value="${sessionScope.loginUser }" name="user">
                	</section>
                	<p></p>
                	<hr>
                	<section class="affiliate-info">
                		<div class="item">
                			<a href="javascript" class="avatar image">
                				<img class="img-circle img-responsive" src="images/10-1.jpg" style="width: 80px;height: 80px;">
                			</a>
                			<div class="body">
                				<h4></h4>
                				<h4><a href="javascript:;">化学心情下2</a></h4>
                				<p>Android 系统、应用技巧</p>
                				<a href="h=javascript:;" class="btn btn-default">关注</a>
                			</div>
                		</div>
                	</section>
                	<hr>
                	<div id="comment-box" class="comment-box">
                		<%-- <form class="comment-form" action="comment.articleAction?articleId=${article.id }&userId=${article.user.id }" method="post"> --%>
                			<div class="form-group">
                				<a class="avatar" style="float: left; margin-right: 20px;" id="pl" href="javascript:;">
                					<img class="img-circle img-responsive" src="images/10-1.jpg" style="width: 40px;height: 40px;">
                				</a>
                				<section>
                					<div class="textarea-wrap">
                						<div class="el-textarea">
                							<textarea name="comment" rows="4" class="el-textarea__inner"></textarea>
                						</div>
                						<input type="submit" class="btn btn-danger" value="发送" id="send">
                						<input type="hidden" value="${article.id }" name="articleId">
                						<input type="hidden" value="${article.user.id }" name="userId">
                					</div>
                				</section>
                			</div>
                		<!-- </form> -->
                		<br><br><br>
                		<h3>评论（${article.comment_num }）</h3>
                		<div>
                			<ul class="comment-list">
		                		<c:forEach var="comment" items="${requestScope.listComment }">
	                				<li class="comment-item">
	                					<a class="avatar" href="javascript:;">
	                						<img alt="VkinG" src="https://cdn.sspai.com/avatar/a348b09f4b7d8d221a0124e5e1690548.?imageMogr2/quality/95/thumbnail/!100x100r/gravity/Center/crop/100x100" lazy="loaded" style="width: 50px; height: 50px;">
	                					</a>
	                					<section>
	                						<h5><a href="findUser.userAction?userid=${comment.user.id}">${comment.user.nickname }</a></h5>
	                						<div class="body">${comment.content }</div>
	                						<div class="ext">
	                							<time><fmt:formatDate value="${comment.create_time}" pattern="yyyy年MM月dd日  HH:mm:ss" /></time>
	                						</div>
	                					</section>
	                				</li>
		                		</c:forEach>
                			</ul>
                		</div>
                	</div>
				</div>
			</article>
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