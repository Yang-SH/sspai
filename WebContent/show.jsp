<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>markdown编辑器</title>
		<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
    	<meta name="viewport" content="width=device-width" />

		<script src="http://libs.baidu.com/jquery/2.1.4/jquery.min.js"></script>
		<script src="js/marked.js"></script>
		<script src="js/ace.js"></script>
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
			html{
			line-height: 1.15;
			font-size: 16px;
			font-family: -apple-system, BlinkMacSystemFont, "PingFang SC", "Hiragino Sans GB", "Microsoft YaHei", "微软雅黑", 'helvetica neue', helvetica, ubuntu, roboto, noto, 'segoe ui', Arial, sans-serif;
			}
		</style>

</head>
<body style="color: #292525;font-weight: 400;" >

		<div id='container'>
			<!--显示区-->
			<div id="preview" name="content" class="markdown-body" style="width: 700px;margin: 0 auto;word-break: normal;word-wrap: break-word;padding-top: 50px;">${content }</div>
		</div>
</body>

<script src="./assets/js/bootstrap.min.js" type="text/javascript"></script>

	<!--  Checkbox, Radio & Switch Plugins -->
	<script src="./assets/js/bootstrap-checkbox-radio.js"></script>

	<!--  Charts Plugin -->
	<script src="./assets/js/chartist.min.js"></script>

    <!--  Notifications Plugin    -->
    <script src="./assets/js/bootstrap-notify.js"></script>

    <!-- Paper Dashboard Core javascript and methods for Demo purpose -->
	<script src="./assets/js/paper-dashboard.js"></script>
<script>
		var acen_edit = ace.edit('mdeditor');
		acen_edit.setTheme('ace/theme/chrome');
		acen_edit.getSession().setMode('ace/mode/markdown');
		acen_edit.renderer.setShowPrintMargin(false);
		$("#mdeditor").keyup(function() {
			$("#preview").html(marked(acen_edit.getValue()));
		});

		function insertText(val) {
			acen_edit.insert(val); //光标位置插入
		}
		$("#theme").change(function() {
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
	</script>

</html>