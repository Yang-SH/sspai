<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="apple-touch-icon" sizes="76x76" href="./assets/img/apple-icon.png">
<link rel="icon" type="image/png" sizes="96x96" href="./assets/img/favicon.png">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>login</title>
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
                <li class="active">
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
                    <a class="navbar-brand" href="#">用户管理</a>
                </div>
            </div>
        </nav>


         <div class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-4 col-md-5">
                        <div class="card card-user">
                            <div class="image">
                                <img src="assets/img/background.jpg" alt="..."/>
                            </div>
                            <div class="content">
                                <div class="author">
                                  <img class="avatar border-white" src="${pageContext.request.contextPath}${findUser.head_path}" alt="..."/>
                                  <h4 class="title">${findUser.nickname}<br />
                                     <a href="#"><small>@${findUser.nickname}</small></a>
                                  </h4>
                                </div>
                                <p class="description text-center">
                                    ${findUser.introduce}
                                </p>
                            </div>
                            <hr>
<!--                             <div class="text-center"> -->
<!--                                 <div class="row"> -->
<!--                                     <div class="col-md-3 col-md-offset-1"> -->
<!--                                         <h5>12<br /><small>Files</small></h5> -->
<!--                                     </div> -->
<!--                                     <div class="col-md-4"> -->
<!--                                         <h5>2GB<br /><small>Used</small></h5> -->
<!--                                     </div> -->
<!--                                     <div class="col-md-3"> -->
<!--                                         <h5>24,6$<br /><small>Spent</small></h5> -->
<!--                                     </div> -->
<!--                                 </div> -->
<!--                             </div> -->
                        </div>
                        <div class="card">
                            <div class="header">
                                <h4 class="title">关注</h4>
                            </div>
                            <div class="content">
                                <ul class="list-unstyled team-members">
                                	<c:forEach items="${attUsers}" var="au" >
                                           <li>
                                               <div class="row">
                                                   <div class="col-xs-3">
                                                       <div class="avatar">
                                                           <img src="${pageContext.request.contextPath}${au.head_path}" alt="Circle Image" class="img-circle img-no-padding img-responsive">
                                                       </div>
                                                   </div>
                                                   <div class="col-xs-6">
                                                       ${au.nickname}
                                                       <br />
                                                       <span class="text-muted"><small>${au.email}</small></span>
                                                   </div>
                                               </div>
                                           </li>
                                    </c:forEach>
                                </ul>
                            </div>
                        </div>
                    </div>
                    
                    <div class="col-lg-8 col-md-7">
                        <div class="card">
                            <div class="header">
                                <h4 class="title">编辑信息</h4>
                            </div>
                            <div class="content">
                                <form>
                                    <div class="row">
                                        <div class="col-md-5">
                                            <div class="form-group">
                                                <label>编号</label>
                                                <input type="text" class="form-control border-input" disabled placeholder="ID" value="${findUser.id}">
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <label>昵称</label>
                                                <input type="text" class="form-control border-input" disabled placeholder="NICKNAME" value="${findUser.nickname}">
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label for="exampleInputEmail1">邮箱地址</label>
                                                <input type="text" disabled class="form-control border-input" placeholder="Email" value="${findUser.email}">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label>个人简介</label>
                                                <textarea class="form-control" readonly="readonly" placeholder="Here can be your nice text" rows="3">${findUser.introduce}</textarea>
<!--                                                 <input type="text" class="form-control border-input" disabled placeholder="Home Address" value="Melbourne, Australia"> -->
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label>擅长领域</label>
                                                <textarea class="form-control" readonly="readonly" placeholder="Here can be your nice text" rows="3">${findUser.good_at}</textarea>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-4">
                                            <div class="form-group">
                                            	<label>获赞数</label>
                                                <div class="icon-container">
			                        				<span class="ti-thumb-up">12</span>
			                        			</div>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                            	<label>关注数</label>
                                                <div class="icon-container">
			                        				<span class="ti-heart">12</span>
			                        			</div>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                           	 	<label>被关注数</label>
                                                <div class="icon-container">
			                        				<span class="ti-link">12</span>
			                        			</div>
                                            </div>
                                        </div>
                                    </div>


<!--                                     <div class="text-center"> -->
<!--                                         <button type="submit" class="btn btn-info btn-fill btn-wd">Update Profile</button> -->
<!--                                     </div> -->
                                    <div class="clearfix"></div>
                                </form>
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
	<script src="./js/adminlogin.js"></script>
</html>