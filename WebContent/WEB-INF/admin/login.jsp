<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

    <!--  Fonts and icons     -->
    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
    <link href='https://fonts.googleapis.com/css?family=Muli:400,300' rel='stylesheet' type='text/css'>
    <link href="./assets/css/themify-icons.css" rel="stylesheet">
</head>
<body style="position: relative;" >
	<div style="margin: auto;position: absolute;top: 50%;left: 50%;margin-top: 130px;">
		<div class="container"  >
			<div class="col-md-12">
		        	<label style="margin-left: -150px;font-size: 25px;margin-bottom: 30px;">少数派后台管理</label>
		    </div>
<!-- 			<form id="myform" action="login.adminAction" method="post" > -->
				<div class="row" >
		            <div class="col-md-4" >
		                <div class="form-group">
		                    <label style="margin-left: -225px;">Account</label>
		                    <input type="text" style="margin-left: -220px;" name="account" class="form-control border-input" placeholder="Account" value="">
		                </div>
		            </div>
		        </div>
		
		        <div class="row">
		            <div class="col-md-4">
		                <div class="form-group">
		                    <label style="margin-left: -225px;">Password</label>
		                    <input type="password" style="margin-left: -220px;" name="password" class="form-control border-input" placeholder="Password" value="">
		                </div>
		            </div>
		        </div>
		        
		        <div class="col-md-12">
		        	<button style="margin-left: -100px;" id="subBtn" class="btn btn-default">登录</button>
		        </div>
<!-- 		    </form> -->
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
	<script src="./js/adminlogin.js"></script>
</html>