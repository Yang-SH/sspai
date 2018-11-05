<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="apple-touch-icon" sizes="76x76" href="./assets/img/apple-icon.png">
<link rel="icon" type="image/png" sizes="96x96" href="./assets/img/favicon.png">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>专题管理</title>
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
<body>
	
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
                    <a href="admin.adminAction" >
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
                <li class="active">
                    <a href="topicList.adminAction">
                        <i class="ti-map"></i>
                        <p>专题管理</p>
                    </a>
                </li>
                <li>
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
                <li ><a href="toSearch.adminAction"> <i
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
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar bar1"></span>
                        <span class="icon-bar bar2"></span>
                        <span class="icon-bar bar3"></span>
                    </button>
                    <a class="navbar-brand" href="#">专题管理</a>
                </div>
            </div>
        </nav>


         <div class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="header">
                                <h4 class="title">编辑专题</h4>
                            </div>
                            <div class="content">
<!--                                 <form action="updateTopic.adminAction" method="post" > -->
                                	<div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label>图片</label>
                                                <c:if test="${findTopic.pic_path!=null}">
                                                	<div class="image icon-container">
                                                		<img alt="..." id="pic" alt="..." class="border-white" src="${pageContext.request.contextPath}${findTopic.pic_path}">
                                                	</div>
                                                </c:if>
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                            	<input type="file" id="file_pic" name="pic_path" value="" />
                                            </div>
                                        </div>
                                    </div>
                                
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group has-success">
                                                <label>编号</label>
                                                <input type="text" class="form-control border-input" disabled placeholder="ID" name="id" value="${findTopic.id}">
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group has-success">
                                                <label>专题名称</label>
                                                <input type="text" class="form-control" placeholder="NAME" name="name" value="${findTopic.name}">
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <div class="row">
                                    	<div class="col-md-6">
                                            <div class="form-group">
                                                <label for="exampleInputEmail1">文章数</label>
                                                <input type="text" disabled class="form-control border-input" placeholder="文章数". value="${findTopic.article_num}">
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group has-success">
                                                <label for="exampleInputEmail1">是否推荐</label>
<!--                                                 <div class="form-control"> -->
										              <select id="select01" name="is_suggest" class="form-control">
										              	<option value="1" 
										              		<c:if test="${findTopic.is_suggest == true}">
										              			selected="selected"
										              		</c:if>
										              	>是</option>
										              	<option value="0" 
										              		<c:if test="${findTopic.is_suggest == false}">
										              			selected="selected"
										              		</c:if>
										              	>否</option>
										              </select>
<!-- 										        </div> -->
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group has-success">
                                                <label for="exampleInputEmail1">状态</label>
                                                <select id="select01" name="stats" class="form-control">
										              	<option value="1" 
										              		<c:if test="${findTopic.stats == 1}">
										              			selected="selected"
										              		</c:if>
										              	>显示</option>
										              	<option value="0" 
										              		<c:if test="${findTopic.stats == 0}">
										              			selected="selected"
										              		</c:if>
										              	>删除</option>
										        </select>
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <div class="text-center">
                                        <button type="button" class="btn btn-info btn-fill btn-wd">保存更新</button>
                                    </div>

                                    <div class="clearfix"></div>
<!--                                 </form> -->
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
                    &copy; <script>document.write(new Date().getFullYear())</script>, made with <i class="fa fa-heart heart"></i> by <a href="#">Creative Tim</a>. More Templates <a href="http://www.cssmoban.com/" target="_blank" title="模板之家">少数派</a> - Collect from <a href="http://www.cssmoban.com/" title="网页模板" target="_blank">少数派</a>
                </div>
            </div>
        </footer>

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
	<script src="./js/admintopic.js"></script>
</html>