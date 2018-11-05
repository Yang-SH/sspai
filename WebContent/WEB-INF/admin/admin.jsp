<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="apple-touch-icon" sizes="76x76" href="./assets/img/apple-icon.png">
<link rel="icon" type="image/png" sizes="96x96" href="./assets/img/favicon.png">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户管理</title>
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
                    <a class="navbar-brand" href="#">用户管理</a>
                </div>
            </div>
        </nav>


        <div class="content">
			<div class="content table-responsive table-full-width">
			    <table class="table table-striped">
			        <thead>
			            <th>ID</th>
			        	<th>昵称</th>
			        	<th>邮箱</th>
			        	<th>个人简介</th>
			        	<th>擅长领域</th>
			        	<th>操作</th>
			        </thead>
			        <tbody>
			        	<c:forEach items="${userPB.list}" var="user" >
				        	<tr id="us${user.id}">
				            	<td>${user.id}</td>
				            	<td>${user.nickname}</td>
				            	<td>${user.email}</td>
				            	<td>${user.introduce}</td>
				            	<td>${user.good_at}</td>
				            	<td>
				            		<div class="col-md-4">
					            		<div class="icon-container">
	                        				<a href="findUser.adminAction?userid=${user.id}" ><span class="ti-search"></span></a>
	                        			</div>
                        			</div>
                        			<div class="col-md-4">
	                        			<div class="icon-container">
	                        				<span class="ti-trash del" id="${user.id}" ></span>
	                        			</div>
	                        		</div>
	                        		<div class="col-md-4">
	                        		</div>
				            	</td>
				            </tr>
			        	</c:forEach>
			        </tbody>
			    </table>
			
			</div>
        </div>

		<div style="text-align: center; font-size: 16px;">
						<c:if test="${userPB.pageNum>1 }">

							<a style="margin-right: 10px;" href="admin.adminAction?page=1">首页</a>
							<a style="margin-right: 10px;"
								href="admin.adminAction?page=${userPB.pageNum-1}">上一页</a>
						</c:if>
						
						<!-- 参考百度 左五右四  ，左边显示5个数，右边显示4个数-->
						<c:forEach begin="${userPB.pageNum-5>0?userPB.pageNum-5:1}"
							end="${userPB.pageNum+4<userPB.totalPage?userPB.pageNum+4:userPB.totalPage}"
							var="i">

							<!-- 当为当前页时不可以点击 -->
							<c:if test="${userPB.pageNum==i }">
								<font style="color: red; margin-right: 10px;">${i}</font>
							</c:if>

							<c:if test="${userPB.pageNum!=i }">
								<span >
									<a style="margin-right: 15px;"
									href="admin.adminAction?page=${i}">${i}</a>
								</span>
							</c:if>

						</c:forEach>

						<c:if test="${userPB.pageNum<userPB.totalPage && userPB!=null}">

							<a style="margin-right: 10px;"
								href="admin.adminAction?page=${userPB.pageNum+1}">下一页</a>
							<a style="margin-right: 10px;"
								href="admin.adminAction?page=${userPB.totalPage}">尾页</a>
						</c:if>
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
	<script src="./js/user.js"></script>
</html>