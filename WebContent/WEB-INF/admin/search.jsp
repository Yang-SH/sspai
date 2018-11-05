<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="apple-touch-icon" sizes="76x76"
	href="./assets/img/apple-icon.png">
<link rel="icon" type="image/png" sizes="96x96"
	href="./assets/img/favicon.png">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>查询</title>
<meta
	content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0'
	name='viewport' />
<meta name="viewport" content="width=device-width" />


<!-- Bootstrap core CSS     -->
<link href="./assets/css/bootstrap.min.css" rel="stylesheet" />

<!-- Animation library for notifications   -->
<link href="./assets/css/animate.min.css" rel="stylesheet" />

<!--  Paper Dashboard core CSS    -->
<link href="./assets/css/paper-dashboard.css" rel="stylesheet" />

<link href="./assets/css/user.css" rel="stylesheet" />

<!--  Fonts and icons     -->
<link
	href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css"
	rel="stylesheet">
<link href='https://fonts.googleapis.com/css?family=Muli:400,300'
	rel='stylesheet' type='text/css'>
<link href="./assets/css/themify-icons.css" rel="stylesheet">

	<link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="css/comment.css">
	<link rel="stylesheet" type="text/css" href="css/index.css">
	<link rel="stylesheet" type="text/css" href="css/door.css">
</head>
<body>

	<div class="wrapper">
		<div class="sidebar" data-background-color="white"
			data-active-color="danger">

			<!--
		Tip 1: you can change the color of the sidebar's background using: data-background-color="white | black"
		Tip 2: you can change the color of the active button using the data-active-color="primary | info | success | warning | danger"
	-->

			<div class="sidebar-wrapper">
				<div class="logo">
					<a href="#" class="simple-text"> ${loginAdmin.account} </a>
				</div>

				<ul class="nav">
					<li><a href="chosenList.adminAction"> <i class="ti-panel"></i>
							<p>精选管理</p>
					</a></li>
					<li><a href="admin.adminAction"> <i class="ti-user"></i>
							<p>用户管理</p>
					</a></li>
					<li><a href="tagList.adminAction"> <i class="ti-direction"></i>
							<p>菜单管理</p>
					</a></li>
					<li><a href="sortList.adminAction"> <i class="ti-map"></i>
							<p>专题管理</p>
					</a></li>
					<li><a href="articleList.adminAction"> <i class="ti-book"></i>
							<p>文章管理</p>
					</a></li>
					<li><a href="sortList.adminAction"> <i class="ti-wallet"></i>
							<p>分类管理</p>
					</a></li>
					<li class="active"><a href="toSearch.adminAction"> <i
							class="ti-search"></i>
							<p>查询</p>
					</a></li>
				</ul>
			</div>
		</div>

		<div class="main-panel">
			<nav class="navbar navbar-default">
			<div class="container-fluid">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle">
						<span class="sr-only">Toggle navigation</span> <span
							class="icon-bar bar1"></span> <span class="icon-bar bar2"></span>
						<span class="icon-bar bar3"></span>
					</button>
					<a class="navbar-brand" href="#">查询</a>
				</div>

				<div class="collapse navbar-collapse">
					<ul class="nav navbar-nav navbar-right">
						<!-- <li>
                            <a href="toaddSort.adminAction" class="dropdown-toggle" >
                                <i class="ti-save"></i>
								<p>添加</p>
                            </a>
                        </li> -->
					</ul>

				</div>
			</div>

			</nav>


			<div class="content">
				<div class="row">
					<div  style="margin:18px; 20px;" class="card">
						<div style="padding:10px" class="text-center">
							<form action="search.adminAction" id="searchForm" method="post">
								<input  type="text" value="" name="name" placeholder="搜索" class="form-control" />
								<button type="submit" id="search" style="width:80px;height: 35px;" class="btn ">搜索</button>
							</form>
						</div>
					</div>
				</div>

				<div class="card">
					<div class="row">
						<div class="col-md-12">
							<div class="nav-tabs-navigation">
								<div class="nav-tabs-wrapper">
									<ul id="tabs" class="nav nav-tabs" data-tabs="tabs">
										<li class="active"><a href="#article" data-toggle="tab">文章</a></li>
										<li><a href="#user" data-toggle="tab">用户</a></li>
										<li><a href="#topic" data-toggle="tab">专题</a></li>
										<li><a href="#sort" data-toggle="tab">分类</a></li>
									</ul>
								</div>
							</div>
							<div id="my-tab-content" class="tab-content text-center">
								<div class="tab-pane active" id="article">
									<c:forEach items="${searchArticles}" var="article" >
										<div class="article-card">
											<dt>
												<div class="user-card block">
													<a href="javascript:;" class="avatar">
														<img class="img-responsive img-circle" src="${pageContext.request.contextPath}${article.user.head_path}">
													</a>
													<h4>
														<a href="javascript:;" class="">${article.user.nickname}</a>
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
													<img src="${pageContext.request.contextPath}${article.pic_path}" class="media-object door_banner">
												</a>
												<section class="media-body">
													<h3 class="title media-heading">
														<a href="javascript:;" class="">${article.article_name}</a>
													</h3>
													<summary class="desc">
														${fn:substring(article.content,0,200)}
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
								<div class="tab-pane" id="user">
									<ul class="list-unstyled team-members">
									<c:forEach items="${searchUsers}" var="user" >
                                            <li>
                                                <div class="row">
                                                    <div class="col-xs-3">
                                                            <img src="assets/img/faces/face-0.jpg" alt="Circle Image" style="width: 50px;height: 50px;margin: 0px;" class="img-circle">
                                                    </div>
                                                    <div class="col-xs-3">
                                                        <span style="display: inline-block;margin-top: 20px;" >${user.nickname}</span>
                                                    </div>
													<div class="col-xs-3">
                                                        <span style="display: inline-block;margin-top: 20px;" >${user.email}</span>
                                                    </div>
                                                    <div class="col-xs-3">
                                                        <a href="findUser.adminAction?userid=${user.id}" class="btn primary " style="display: inline-block;margin-top: 10px;"><i class="ti-search"></i></a>
                                                    </div>
                                                </div>
                                            </li>
										
									</c:forEach>
									</ul>
								</div>
								<div class="tab-pane" id="topic">
									<div class="content">
										<dl class="side-section">
											<dt>
											</dt>
											<c:forEach items="${searchTopics}" var="topic" >
															<dd class="col-md-3">
																<a href="javascript:;" class="column-card">
																	<header>
																		<img src="images/pic20.jpg" class="banner" lazy="loaded" />
																	</header>
																	<section>
																		<h4 class="title">
																			${topic.name}
																		</h4>
																		<p>
																			刺客信条好玩好玩
																		</p>
																		<footer>
																			<label>
																				<var>1352</var>
																				人关注
																			</label>
																			<div class="action">
																				<span class="btn dark-out-line">查看专栏</span>
																			</div>
																		</footer>
																	</section>
																</a>
															</dd>
															
											</c:forEach>
										</dl>
									</div>
								</div>
								
								<div class="tab-pane" id="sort">
									<c:forEach items="${searchSorts}" var="sort" >
										<a href="findSort.adminAction?sortid=${sort.id}" style="display: inline-block;background-color: #E6E6E6;font-size: 0.75rem;line-height: 1.41666667;padding: 5px 12px 6px 11px;margin: 10px 3px;" >#${sort.name}</a>
									</c:forEach>
								</div>
							</div>
						</div>
					</div>
				</div>

			</div>

			<footer class="footer">
			<div class="container-fluid">
				<nav class="pull-left">
				<ul>

					<li><a href="#"> ${loginAdmin.account} </a></li>
					<li><a href="http://blog.creative-tim.com"> Blog </a></li>
					<li><a href="#/license"> Licenses </a></li>
				</ul>
				</nav>
				<div class="copyright pull-right">
					&copy;
					<script>
						document.write(new Date().getFullYear())
					</script>
					, made with <i class="fa fa-heart heart"></i> by <a href="#">Creative
						Tim</a>. More Templates <a href="http://www.cssmoban.com/"
						target="_blank" title="模板之家">少数派</a> - Collect from <a
						href="http://www.cssmoban.com/" title="网页模板" target="_blank">少数派</a>
				</div>
			</div>
			</footer>
		</div>
	</div>
</body>

<!--   Core JS Files   -->
<script src="./assets/js/jquery-1.10.2.js" type="text/javascript"></script>
<script src="./assets/js/bootstrap.min.js" type="text/javascript"></script>

<!--  Checkbox, Radio & Switch Plugins -->
<script src="./assets/js/bootstrap-checkbox-radio.js"></script>

<!--  Charts Plugin -->
<script src="./assets/js/chartist.min.js"></script>

<!--  Notifications Plugin    -->
<script src="./assets/js/bootstrap-notify.js"></script>

<!-- Paper Dashboard Core javascript and methods for Demo purpose -->
<script src="./assets/js/paper-dashboard.js"></script>

<!-- 表单验证 -->
<script src="./js/adminsearch.js"></script>
</html>