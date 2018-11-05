<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="comment.articleAction" method="post">
		<textarea rows="10" cols="30" name="content"></textarea><br/>
		<input type="submit" value="发送"/>
	</form>
	
	<c:forEach var="comment" items="${requestScope.listComment }">
		${comment.content}<br/>
	</c:forEach>
	
	<form action="reply.articleAction" method="post">
		<textarea rows="10" cols="30" name="content"></textarea><br/>
		<input type="submit" value="发送"/>
	</form>
</body>
</html>