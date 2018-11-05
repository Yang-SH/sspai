<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"
   %>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<title>Insert title here</title>
</head>
<body>
	<form  action="gohomepage.userAction" >
		<table>
			<tr>当前登录用户头像路径:</tr><br>
			<tr></tr><br>
			<tr><input type="text" name="user_head_path" value="${loginUser.head_path}"></tr><br>
			<tr></tr><br>
			<tr>当前登录用户昵称:</tr><br>
			<tr></tr><br>
			<tr><input type="text" id="nickname" name="user_nickname" value="${loginUser.nickname}">
			&emsp;<span style="color:red" id="anickname"></span>
			</tr><br>
			<tr></tr><br>
			<tr>当前登录用户擅长领域:</tr><br>
			<tr></tr><br>
			<tr><input type="text" name="user_good_at" value="${loginUser.good_at}"></tr><br>
			<tr></tr><br>
			<tr>当前登录用户个人简介</tr><br>
			<tr></tr><br>
			<tr><input type="text" name="user_introduce" value="${loginUser.introduce}"></tr>
			<tr></tr><br>
			<tr>当前登录用户写作总字数:</tr><br>
			<tr></tr><br>
			<tr><input type="text" name="user_total_num" value="${loginUser.total_num }"></tr>
			<tr></tr><br>
			<tr>当前登录用户获赞数:</tr><br>
			<tr></tr><br>
			<tr><input type="text" name="user_like_num" value="${loginUser.like_num}"></tr>
			<tr></tr><br>
			<tr>当前登录用户关注数:</tr><br>
			<tr></tr><br>
			<tr><input type="text" name="user_attention_num" value="${loginUser.attention_num}"></tr><br>
			<tr></tr><br>
			<tr>当前登录用户关注的别人的昵称:<input type="text" name="user_head_path" value="<c:forEach items="${loginUser.attentionUser}" var="att">${att.nickname}</c:forEach>">
			当前登录用户关注的别人的头像地址:<input type="text" id="nickname" name="user_nickname" value="<c:forEach items="${loginUser.attentionUser}" var="att">${att.head_path}</c:forEach>">
			当前登录用户关注的别人写的文章数:<input type="text" id="article_nickname" name="article_nickname" value="${loginUser.article_num}">
			</tr><br>
			<tr></tr><br>
			<tr>当前登录 被 用户关注的别人的昵称:<input type="text" name="user_head_path" value="<c:forEach items="${loginUser.beAttentionUser}" var="batt">${batt.nickname}</c:forEach>">
			当前登录用户关注 被 的别人的头像地址:<input type="text" id="nickname" name="user_nickname" value="<c:forEach items="${loginUser.beAttentionUser}" var="batt">${batt.head_path}</c:forEach>">
			当前登录用户关注 被 的别人写的文章数:<input type="text" id="article_nickname" name="article_nickname" value="${loginUser.article_num}">
			</tr><br>
			<tr></tr><br>
			<tr></tr><br>
			<tr>当前登录用户被关注数:</tr><br>
			<tr></tr><br>
			<tr><input type="text" name="user_followed_num" value="${loginUser.followed_num}"></tr><br>
			<tr></tr><br>
			
			<a href="gomodification.userAction">修改资料</a>
			<tr></tr><br>
			<tr>当前登录用户喜欢了文章:</tr><br>
			<tr></tr><br>
			<c:forEach items="${loginUser.likeArticles}" var="art">
				<a href="">${art.name}</a>	
			</c:forEach>
			<tr></tr><br>
			<tr></tr><br>
			<c:forEach items="${loginUser.likeArticles}" var="art">
				${art.content}
			</c:forEach>
			<tr></tr><br>
			<tr></tr><br>
			<c:forEach items="${loginUser.likeArticles}" var="art">
				${art.pic_path}
			</c:forEach>
			<tr></tr><br>
			<tr></tr><br>
			<c:forEach items="${loginUser.likeArticles}" var="art">
				${art.create_time}
			</c:forEach>
			<tr></tr><br>
			<tr></tr><br>
			<tr>当前登录用户点赞时间:</tr><br>
			<tr></tr><br>
			<tr></tr><br>
			<tr><input type="text" name="user_head_path" 
			value="<c:forEach items="${loginUser.likeArticles}" var="art">${art.create_time}</c:forEach>"></tr><br>
			<tr></tr><br>
			
			<tr></tr><br>
			<tr>当前登录用户头像地址:<input type="text" name="user_head_path" value="${loginUser.head_path}">
			当前登录用户昵称:<input type="text" id="nickname" name="user_nickname" value="${loginUser.nickname}">
			文章的作者:<input type="text" id="article_nickname" name="article_nickname" value="<c:forEach items="${loginUser.myComments}" var="mc">${mc.article.user.nickname}</c:forEach>">
			评论文章的标题:<input type="text" id="article_topic" name="article_topic" value="<c:forEach items="${loginUser.myComments}" var="mc">${mc.article.article_name}</c:forEach>"></tr><br>
			<tr></tr><br>
				<tr></tr><br>
			<tr>评论内容:</tr><br>
			<tr></tr><br>
			<tr><input type="text" name="user_head_path" 
			value="<c:forEach items="${loginUser.myComments}" var="mc">${mc.content}</c:forEach>"></tr><br>
			<tr></tr><br>
			<tr>评论时间:</tr><br>
			<tr></tr><br>
			<tr><input type="text" name="user_head_path" 
			value="<c:forEach items="${loginUser.myComments}" var="mc">${mc.create_time}</c:forEach>"></tr><br>
		</table>
</form>
</body>
</html>