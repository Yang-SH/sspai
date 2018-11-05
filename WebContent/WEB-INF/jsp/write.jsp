<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>markdown编辑器</title>
		<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
    	<meta name="viewport" content="width=device-width" />

		<link rel="stylesheet" href="http://cdn.bootcss.com/twitter-bootstrap/3.0.3/css/bootstrap.min.css">
		<link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
		<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
	
		
		<link href="css/markdown.css" rel="stylesheet" />
		<style type="text/css">
			* {
				margin: 0;
				padding: 0;
				outline: none;
				border-radius: 0;
			}
			
			html,
			body {
				width: 100%;
				height: 100%;
				font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
				background-color: #ebebeb;
			}
			
			#toolbar {
				height: 50px;
				background-color: #444;
				width: 100%;
				color: #fff;
				line-height: 50px;
			}
			
			button{
				width:75px;
				height:35px;
				border-radius: 20px;
		        box-sizing: border-box;
		        border-width: 2px;
		        background-color: transparent;
		        font-size: 14px;
		        font-weight: 500;
		        padding: 7px 18px;
		        border-color: #66615B;
		        color: #fff;
			}
			
			#container {
				overflow: auto;
				position: absolute;
				bottom: 0;
				left: 0;
				right: 0;
				top: 50px;
			}
			
			#editor-column,
			#preview-column {
				width: 49.5%;
				height: 100%;
				overflow: auto;
				position: relative;
				background-color: #fff;
			}
			
			.pull-left {
				float: left;
			}
			
			.pull-right {
				float: right;
			}
			
			#mdeditor,
			#preview,
			#panel-editor,
			#panel-preview {
				height: 100%;
				width: 100%;
			}
			.font_color{
				color: #fff;
			}
		</style>

</head>
<body>


<nav class="navbar navbar-default navbar-inverse">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#menu">
					<span class="sr-only">展开工具栏</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a href="javascript:;" class="navbar-brand">工具条</a>
			</div>
			<div class="collapse navbar-collapse" id="menu">
				<form>
					<ul class="nav navbar-nav">
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown">字体样式<b class="caret"></b></a>
							<ul class="dropdown-menu">
								<li>
									<bntton style="width: 100%;" class="btn btn-primary btn-sm">加粗</bntton>
								</li>
								<li>
									<bntton style="width: 100%;" class="btn btn-primary btn-sm">斜体</bntton>
								</li>
								<li>
									<bntton style="width: 100%;" class="btn btn-primary btn-sm">引用</bntton>
								</li>
							</ul>
						</li>
					</ul>
				</form>

				<div>
		
				<span class="font_color">样式：</span><select style="margin-top: 15px;" id="theme" size="1">
						<optgroup label="Bright">
							<option value="ace/theme/chrome">Chrome</option>
							<option value="ace/theme/clouds">Clouds</option>
							<option value="ace/theme/crimson_editor">Crimson Editor</option>
							<option value="ace/theme/dawn">Dawn</option>
							<option value="ace/theme/dreamweaver">Dreamweaver</option>
							<option value="ace/theme/eclipse">Eclipse</option>
							<option value="ace/theme/github">GitHub</option>
							<option value="ace/theme/iplastic">IPlastic</option>
							<option value="ace/theme/solarized_light">Solarized Light</option>
							<option value="ace/theme/textmate">TextMate</option>
							<option value="ace/theme/tomorrow">Tomorrow</option>
							<option value="ace/theme/xcode">XCode</option>
							<option value="ace/theme/kuroir">Kuroir</option>
							<option value="ace/theme/katzenmilch">KatzenMilch</option>
							<option value="ace/theme/sqlserver">SQL Server</option>
						</optgroup>
						<optgroup label="Dark">
							<option value="ace/theme/ambiance">Ambiance</option>
							<option value="ace/theme/chaos">Chaos</option>
							<option value="ace/theme/clouds_midnight">Clouds Midnight</option>
							<option value="ace/theme/cobalt">Cobalt</option>
							<option value="ace/theme/gruvbox">Gruvbox</option>
							<option value="ace/theme/idle_fingers">idle Fingers</option>
							<option value="ace/theme/kr_theme">krTheme</option>
							<option value="ace/theme/merbivore">Merbivore</option>
							<option value="ace/theme/merbivore_soft">Merbivore Soft</option>
							<option value="ace/theme/mono_industrial">Mono Industrial</option>
							<option value="ace/theme/monokai">Monokai</option>
							<option value="ace/theme/pastel_on_dark">Pastel on dark</option>
							<option value="ace/theme/solarized_dark">Solarized Dark</option>
							<option value="ace/theme/terminal">Terminal</option>
							<option value="ace/theme/tomorrow_night">Tomorrow Night</option>
							<option value="ace/theme/tomorrow_night_blue">Tomorrow Night Blue</option>
							<option value="ace/theme/tomorrow_night_bright">Tomorrow Night Bright</option>
							<option value="ace/theme/tomorrow_night_eighties">Tomorrow Night 80s</option>
							<option value="ace/theme/twilight">Twilight</option>
							<option value="ace/theme/vibrant_ink">Vibrant Ink</option>
						</optgroup>
					</select>
					&emsp;<span class="font_color">字体大小</span>
						<select id="fontsize" size="1">
							<option value="10px">10px</option>
							<option value="11px">11px</option>
							<option value="12px" selected="selected">12px</option>
							<option value="13px">13px</option>
							<option value="14px">14px</option>
							<option value="16px">16px</option>
							<option value="18px">18px</option>
							<option value="20px">20px</option>
							<option value="24px">24px</option>
						</select>
						&emsp;<span class="font_color">代码折行</span>
						<select id="folding" size="1">
							<option value="manual">manual</option>
							<option value="markbegin" selected="selected">mark begin</option>
							<option value="markbeginend">mark begin and end</option>
						</select>
						&emsp;<span class="font_color">自动换行</span>
						<select id="soft_wrap" size="1">
							<option value="off">Off</option>
							<option value="40">40 Chars</option>
							<option value="80">80 Chars</option>
							<option value="free">Free</option>
						</select>

				</div>
			</div>
	</nav>
	
	<div>
		<div id='container'>
			<div id='editor-column' class='pull-left'>
				<div id='panel-editor'>
					<!--编辑区-->
					<div class="editor-content" id="mdeditor">

					</div>

				</div>
			</div>
			
			<div id='preview-column' class='pull-right'>
				<div id='panel-preview'>
					<!--显示区-->
					<div id="preview" class="markdown-body"></div>
				</div>
			</div>
		</div>
	</div>

	<nav class="navbar navbar-default navbar-fixed-bottom navbar-inverse">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#menu">
					<span class="sr-only">展开工具栏</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a href="javascript:;" class="navbar-brand">添加文章信息</a>
			</div>
			<div class="collapse navbar-collapse" id="menu">
				<form method="post" action="saveArticle.articleAction" id="artForm" >
					<div>
					<span class="font_color">专题：</span>
					<select style="margin-top: 15px;" id="topic_id" name="topic_id" size="1"  >
						<c:forEach items="${allTopics}" var="topic" >
							<option value="${topic.id}">${topic.name}</option>
						</c:forEach>	
					</select>
					&emsp;
					<span class="font_color">分类：</span>
					<select style="margin-top: 15px;" id="sort_id" name="sort_id" size="1"  >
						<c:forEach items="${allSorts }" var="sort" >
							<option value="${sort.id}">${sort.name}</option>
						</c:forEach>		
					</select>
					<textarea style="display: none;" name="content" id="content" ></textarea>
					&emsp;<span class="font_color">名称：</span>	
					<input type="text" name="article_name" id="article_name" placeholder="请输入文章名称" />
					&emsp;
					<button style="margin-top: -5px; " type="submit" class="btn btn-defualt btn-sm">提交</button>
					&emsp;
					<button style="margin-top: -5px; " type="re" class="btn btn-defualt btn-sm">取消</button>
					</div>
				</form>
			</div>
	</nav>


</body>

	<script type="text/javascript" src="js/jquery-3.1.1.js"></script>
	<script src="http://cdn.bootcss.com/html5shiv/3.7.0/html5shiv.min.js"></script>
	<script src="http://cdn.bootcss.com/respond.js/1.3.0/respond.min.js"></script>
	<!-- <script src="http://libs.baidu.com/jquery/2.1.4/jquery.min.js"></script> -->
	<script src="js/marked.js"></script>
	<script src="js/ace/ace.js"></script>
	<script src="./assets/js/bootstrap.min.js" type="text/javascript"></script>
	
	<!--  Checkbox, Radio & Switch Plugins -->
	<script src="./assets/js/bootstrap-checkbox-radio.js"></script>

	<!--  Charts Plugin -->
	<script src="./assets/js/chartist.min.js"></script>

    <!--  Notifications Plugin    -->
    <script src="./assets/js/bootstrap-notify.js"></script>

    <!-- Paper Dashboard Core javascript and methods for Demo purpose -->
	<script src="./assets/js/paper-dashboard.js"></script>
	
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	
<script>
		var acen_edit = ace.edit('mdeditor');
		acen_edit.setTheme('ace/theme/chrome');
		acen_edit.getSession().setMode('ace/mode/markdown');
		acen_edit.renderer.setShowPrintMargin(false);
		$("#mdeditor").keyup(function() {
			$("#preview").html(marked(acen_edit.getValue()));
			$("#content").html(marked(acen_edit.getValue()));
		});

		function insertText(val) {
			acen_edit.insert(val); //光标位置插入
		}
		$("#theme").change(function() {
			console.log("theme");
			acen_edit.setTheme($(this).val());
		})
		$("#fontsize").change(function() {
			acen_edit.setFontSize($(this).val());
		})
		$("#folding").change(function() {
			session.setFoldStyle($(this).val());
		})
		$("#select_style").change(function() {
			acen_edit.setOption("selectionStyle", this.checked ? "line" : "text");
		})
		$("#highlight_active").change(function() {
			acen_edit.setHighlightActiveLine(this.checked);
		})
		$("#soft_wrap").change(function() {
			acen_edit.setOption("wrap", $(this).val());
		})
		$("#show_print_margin").change(function() {
			acen_edit.renderer.setShowPrintMargin(this.checked);
		})
		//保存
		$("#artForm").submit(function(){
			alert("提交");
			var name = $("#article_name").val();
			if(name == null || "" ==name){
				showMsg('文章名称不能为空！', 'danger');
				return false;
			}
			showMsg($("#content").html(), 'danger');
			return true;
			/* console.log($("#mdeditor").html());
			$.ajax({
				type:'post',
				url: 'addArticle.adminAction', 
				data: 'content='+$("#mdeditor").text(),
				dataType: 'json',
				success: function(data) {
					console.log(data);
					//$("#preview").html(data.data+"1");
					window.location.href="show.jsp"; 
				}
			}); */
			
		});
		
		function showMsg(msg, type) {
			// 'top','center',
			$.notify({
				title : '<strong>提示</strong>',
				message : '' + msg,
			}, {
				type : type,
				animate : {
					enter : 'animated bounceInDown',
					exit : 'animated bounceOutUp'
				},
				animate : {
					enter : 'animated fadeInDown',
					exit : 'animated fadeOutUp'
				},
				placement : {
					from : 'top',
					align : 'center'
				}
			});
		}
	</script>

</html>