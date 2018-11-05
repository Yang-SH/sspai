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
	<c:forEach var="article" items="${requestScope.listArticle}">
			文章名称：${article.article_name}<br/>
	</c:forEach>
	
	<c:forEach var="article" items="${requestScope.Articles}">
			文章名称：${article.article_name}
			文章内容：${article.content }
			作者：${article.user.nickname }<br/>
	</c:forEach>
	点赞数：${requestScope.likeNum}
</body>
</html>