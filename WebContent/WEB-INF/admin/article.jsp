<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="apple-touch-icon" sizes="76x76" href="./assets/img/apple-icon.png">
<link rel="icon" type="image/png" sizes="96x96" href="./assets/img/favicon.png">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>文章管理</title>
<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
    <meta name="viewport" content="width=device-width" />


    <!-- Bootstrap core CSS     -->
    <link href="./assets/css/bootstrap.min.css" rel="stylesheet" />

    <!-- Animation library for notifications   -->
    <link href="./assets/css/animate.min.css" rel="stylesheet"/>

    <!--  Paper Dashboard core CSS    -->
    <link href="./assets/css/paper-dashboard.css" rel="stylesheet"/>
    
    <link href="./assets/css/user.css" rel="stylesheet" />

    <!--  Fonts and icons     -->
    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
    <link href='https://fonts.googleapis.com/css?family=Muli:400,300' rel='stylesheet' type='text/css'>
    <link href="./assets/css/themify-icons.css" rel="stylesheet">
</head>
<body >
<div class="wrapper">	
	<div class="sidebar" data-background-color="white" data-active-color="danger">

    <!--
		Tip 1: you can change the color of the sidebar's background using: data-background-color="white | black"
		Tip 2: you can change the color of the active button using the data-active-color="primary | info | success | warning | danger"
	-->

    	<div class="sidebar-wrapper">
            <div class="logo">
                <a href="#" class="simple-text">
                    ${loginAdmin.account}
                </a>
            </div>

            <ul class="nav">
                <li>
                    <a href="chosenList.adminAction">
                        <i class="ti-panel"></i>
                        <p>精选管理</p>
                    </a>
                </li>
                <li >
                    <a href="admin.adminAction">
                        <i class="ti-user"></i>
                        <p>用户管理</p>
                    </a>
                </li>
                <li>
                    <a href="tagList.adminAction">
                        <i class="ti-direction"></i>
                        <p>菜单管理</p>
                    </a>
                </li>
                <li>
                    <a href="topicList.adminAction">
                        <i class="ti-map"></i>
                        <p>专题管理</p>
                    </a>
                </li>
                <li class="active">
                    <a href="articleList.adminAction">
                        <i class="ti-book"></i>
                        <p>文章管理</p>
                    </a>
                </li>
                <li>
                    <a href="sortList.adminAction">
                        <i class="ti-wallet"></i>
                        <p>分类管理</p>
                    </a>
                </li>
                <li>
                	<a href="toSearch.adminAction"> <i
							class="ti-search"></i>
							<p>查询</p>
					</a>
				</li>
            </ul>
    	</div>
    </div>

    <div class="main-panel">
		<nav class="navbar navbar-default">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar bar1"></span>
                        <span class="icon-bar bar2"></span>
                        <span class="icon-bar bar3"></span>
                    </button>
                    <a class="navbar-brand" href="#">文章管理</a>
                </div>
            </div>
        </nav>


         <div class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="header">
                                <h4 class="title">查看文章</h4>
                            </div>
                            <div class="content">
                            		<!-- 隐藏域，放置id -->
                            		<input type="hidden" name="id" value="${article.id}">
                                	<div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label>图片</label>
                                                <c:if test="${article.pic_path!=null}">
                                                	<div class="image icon-container">
                                                		<img alt="..." id="pic" alt="..." class="border-white" src="${pageContext.request.contextPath}${article.pic_path}">
                                                	</div>
                                                </c:if>
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group has-success">
                                                <label>文章名称</label>
                                                <textarea class="form-control" readonly="readonly" placeholder="Here can be your nice text" rows="3">${article.name}</textarea>
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <div class="row">
                                    	<div class="col-md-6">
                                            <div class="form-group">
                                                <label for="exampleInputEmail1">作者</label>
                                                <input type="text" disabled class="form-control border-input" placeholder="文章数" value="${article.user.nickname}">
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group has-success">
                                                <label for="exampleInputEmail1">创建时间</label>
	                                            <input type="text" disabled class="form-control border-input" placeholder="文章数" value="<fmt:formatDate value="${article.create_time}" pattern="yyyy年MM月dd日  HH:mm:ss" />">
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group has-success">
                                                <label for="exampleInputEmail1">内容</label>
                                                <textarea class="form-control" readonly="readonly" placeholder="Here can be your nice text" rows="3">${article.content}</textarea>
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group has-success">
                                                <label for="exampleInputEmail1">状态</label>
                                                <select id="select01" name="stats" class="form-control">
										              	<option value="1" 
										              		<c:if test="${article.stats == 1}">
										              			selected="selected"
										              		</c:if>
										              	>显示</option>
										              	<option value="0" 
										              		<c:if test="${article.stats == 0}">
										              			selected="selected"
										              		</c:if>
										              	>删除</option>
										        </select>
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                            	<label>获赞数</label>
                                                <div class="icon-container">
			                        				<span class="ti-thumb-up">${article.like_num}</span>
			                        			</div>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                            	<label>评论数</label>
                                                <div class="icon-container">
			                        				<span class="ti-comment-alt">${article.comment_num}</span>
			                        			</div>
                                            </div>
                                        </div>
                                    </div>
                                    <br/>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                            	<label>评论</label>
                                                <c:forEach items="${article.commList}" var="com" >
                                                	<p style="width: 100%;">
                                                		<span style="width: 150px;text-align: center;display: inline-block;" >${com.user.nickname}</span>
                                                		
                                                		<span style="width: 350px;text-align: center;display: inline-block;">${com.content}</span>
                                                		
                                                		<span style="width: 200px;text-align: center;display: inline-block;"><fmt:formatDate value="${com.create_time}" pattern="yyyy年MM月dd日  HH:mm:ss" /></span>
                                                	</p>
                                                </c:forEach>
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <div class="clearfix"></div>
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

                        <li>
                            <a href="#">
                                 ${loginAdmin.account}
                            </a>
                        </li>
                        <li>
                            <a href="http://blog.creative-tim.com">
                               Blog
                            </a>
                        </li>
                        <li>
                            <a href="#/license">
                                Licenses
                            </a>
                        </li>
                    </ul>
                </nav>
				<div class="copyright pull-right">
                    &copy; <script>document.write(new Date().getFullYear())</script>, made with <i class="fa fa-heart heart"></i> by <a href="#">Creative Tim</a>. More Templates <a href="http://www.cssmoban.com/" target="_blank" title="模板之家">模板之家</a> - Collect from <a href="http://www.cssmoban.com/" title="网页模板" target="_blank">网页模板</a>
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
	<script src="./js/adminarticle.js"></script>
</html>