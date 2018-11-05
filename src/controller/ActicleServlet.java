package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.bind.ParseConversionEvent;

import org.apache.catalina.TomcatPrincipal;
import org.apache.ibatis.session.SqlSession;

import com.fasterxml.jackson.databind.ObjectMapper;

import dao.UserDAO;
import entity.Article;
import entity.Collection;
import entity.Comment;
import entity.Like;
import entity.Reply;
import entity.Sort;
import entity.Topic;
import entity.User;
import service.ArticleService;
import service.SortService;
import service.TopicService;
import service.UserService;
import util.MyBatisUtil;

/**
 * url映射的写法，前面的*表示进行的功能，后面的表示 功能模块名称+Action UserServlet
 */
@WebServlet("*.articleAction")
@SuppressWarnings("all")
// public class UserServlet extends HttpServlet {
public class ActicleServlet extends BaseServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 一定要调用父类的方法
		super.service(request, response);
		System.out.println("function:" + getFunction());
		// 加载更多查询文章
		if ("query".equals(getFunction())) {
			ArticleService articleService = ArticleService.getInstence();
			List<Article> listArticle = articleService.queryAll();
			ArrayList<Article> Articles = new ArrayList<>();
			for (Article article : listArticle) {
				Article article1 = new Article();
				article1.setId(article.getId());
				article1.setLike_num(articleService.queryArticleLikeNum(article.getId()));
				article1.setContent(article.getContent());
				article1.setPic_path(article.getPic_path());
				article1.setUser_id(article.getUser_id());
				article1.setComment_num(article.getComment_num());
				article1.setCreate_time(article.getCreate_time());
				article1.setTopic_id(article.getTopic_id());
				article1.setArticle_name(article.getArticle_name());
				article1.setUser(article.getUser());
				article1.setStats(article.getStats());
				Articles.add(article1);
			}
			// request.setAttribute("Articles", Articles);
			// System.out.println("list:" + Articles);
			// 是一个映射器：把对象转换成 json对象
			ObjectMapper mapper = new ObjectMapper();
			String json = mapper.writeValueAsString(Articles);
			response.getWriter().println(json);
			return;
			// request.getRequestDispatcher("/WEB-INF/jsp/main.jsp").forward(request,
			// response);
		}
		// 直接查询所有文章
		if ("queryAll".equals(getFunction())) {
			ArticleService articleService = ArticleService.getInstence();
			List<Article> listArticle = articleService.queryAll();
			ArrayList<Article> Articles = new ArrayList<>();
			for (Article article : listArticle) {
				Article article1 = new Article();
				article1.setLike_num(articleService.queryArticleLikeNum(article.getId()));
				article1.setId(article.getId());
				article1.setContent(article.getContent());
				article1.setPic_path(article.getPic_path());
				article1.setUser_id(article.getUser_id());
				article1.setComment_num(article.getComment_num());
				article1.setCreate_time(article.getCreate_time());
				article1.setTopic_id(article.getTopic_id());
				article1.setArticle_name(article.getArticle_name());
				article1.setUser(article.getUser());
				article1.setStats(article.getStats());
				Articles.add(article1);
			}
			HttpSession session = request.getSession();
			List<Article> chosenArticle = articleService.findChosenArticle();// 获取推荐的文章
			TopicService topicService = TopicService.getInstence();
			List<Topic> suggestTopics = topicService.findSuggestTopic();// 获取推荐专题
			session.setAttribute("suggestTopics", suggestTopics);
			session.setAttribute("chosenArticle", chosenArticle);
			session.setAttribute("Articles", Articles);
			// System.out.println("list:" + Articles);
			request.getRequestDispatcher("/WEB-INF/jsp/main.jsp").forward(request, response);
		}
		// 按关键字查询（查询文章,用户，专题）
		if ("search".equals(getFunction())) {
			ArticleService articleService = ArticleService.getInstence();
			UserService userService = UserService.getInstence();
			TopicService topicService = TopicService.getInstence();
			String search = request.getParameter("search");
			System.out.println("search：" + search);
			// String search="op";//做测试用
			List<Article> listArticle = articleService.queryArticle(search);
			ArrayList<Article> Articles = new ArrayList<>();
			List<User> findUsers = userService.findByName(search);//模糊查询用户
			List<Topic> findTopics = topicService.findByName(search);//模糊查询专题
			request.setAttribute("UserNum", findUsers.size());
			request.setAttribute("findUsers",findUsers);
			request.setAttribute("TopicNum", findTopics.size());
			request.setAttribute("findTopics",findTopics);
			for (Article article : listArticle) {
				Article article1 = new Article();
				article1.setLike_num(articleService.queryArticleLikeNum(article.getId()));// 文章点赞数
				article1.setId(article.getId());
				article1.setContent(article.getContent());
				article1.setPic_path(article.getPic_path());
				article1.setUser_id(article.getUser_id());
				article1.setComment_num(article.getComment_num());
				article1.setCreate_time(article.getCreate_time());
				article1.setTopic_id(article.getTopic_id());
				article1.setArticle_name(article.getArticle_name());
				article1.setUser(article.getUser());
				article1.setStats(article.getStats());
				Articles.add(article1);
			}
			request.setAttribute("search", search);
			request.setAttribute("Articles", Articles);
			Article articlele = new Article();
			articlele.setArticle_num(articleService.queryArticleNum(search));// 搜索文章数量
			request.setAttribute("articlele", articlele);
			// System.out.println(listArticle);
			request.getRequestDispatcher("/WEB-INF/jsp/search.jsp").forward(request, response);
		}
		// 文章点赞
		if ("like".equals(getFunction())) {
			ArticleService articleService = ArticleService.getInstence();
			String articleId = request.getParameter("articleId");
			System.out.println("articleId：" + articleId);
			String userId = request.getParameter("userId");
			System.out.println("userId：" + userId);
			Date date = new Date();
			Like like = new Like();
			like.setLike_id(Integer.parseInt(articleId));
			like.setLike_type("article");
			like.setUser_id(Integer.parseInt(userId));
			like.setCreate_time(date);
			Like lik = articleService.judgeLike(like);
			boolean flag = false;
			if (lik != null) {
				flag = true;
			}
			int str = -1;
			if (flag) {
				int num = articleService.delLike(like);
				// System.out.println("delNum："+num);
				str = 0;
			} else {
				int num = articleService.addLike(like);
				// System.out.println("num："+num);
				str = 1;
			}
			System.out.println("str：" + str);
			// 是一个映射器：把对象转换成 json对象
			ObjectMapper mapper = new ObjectMapper();
			String result = mapper.writeValueAsString(str);
			response.getWriter().print(result);
			return;
		}
		// 查询文章的点赞数
		// if("queryLikeNum".equals(getFunction())){
		// ArticleService articleService=ArticleService.getInstence();
		// int likeNum=articleService.queryArticleLikeNum(3);
		// request.setAttribute("likeNum", likeNum);
		// request.getRequestDispatcher("/WEB-INF/jsp/listArticle.jsp").forward(request,
		// response);
		// }
		// 根据文章id查找文章内容和查找所有评论
		if ("articleId".equals(getFunction())) {
			ArticleService articleService = ArticleService.getInstence();
			String id = request.getParameter("opr");
			System.out.println("id：" + id);
			// 根据文章id查找文章内容
			Article article = articleService.findArticleById(Integer.parseInt(id));
			article.setLike_num(articleService.queryArticleLikeNum(Integer.parseInt(id)));// 文章点赞数
			article.setComment_num(articleService.queryArticleCommentNum(Integer.parseInt(id)));// 文章评论数
			request.setAttribute("like_num", article.getLike_num());
			request.setAttribute("article", article);
			System.out.println("article.getId()：" + article.getId());
			// 根据文章id查找所有评论
			ArrayList<Comment> listComment = articleService.queryComment(Integer.parseInt(id));
			request.setAttribute("listComment", listComment);
			request.getRequestDispatcher("/WEB-INF/jsp/article.jsp").forward(request, response);
		}
		// 根据文章article_id查找所有评论
		// if("queryComment".equals(getFunction())){
		// ArticleService articleService=ArticleService.getInstence();
		// ArrayList<Comment> listComment=articleService.queryComment(3);
		// //做测试用
		// //for (Comment comment : listComment) {
		// // System.out.println(comment.getContent());
		// //}
		// request.setAttribute("listComment", listComment);
		// request.getRequestDispatcher("/WEB-INF/jsp/comment.jsp").forward(request,
		// response);
		// }
		// 评论文章
		if ("comment".equals(getFunction())) {
			ArticleService articleService = ArticleService.getInstence();
			String content = request.getParameter("comment");
			System.out.println("content:" + content);
			String article_id = request.getParameter("articleId");
			System.out.println("article_id:" + article_id);
			String user_id = request.getParameter("userId");
			System.out.println("user_id:" + user_id);
			// //DEBUG
			// article_id = "4";
			// user_id = "1";
			
			Date date = new Date();
			Comment comment = new Comment();
			comment.setUser_id(Integer.parseInt(user_id));
			comment.setCreate_time(date);
			comment.setContent(content);

			comment.setArticle_id(Integer.parseInt(article_id));
			int num = articleService.addComment(comment);
			ObjectMapper mapper = new ObjectMapper();
			String Num = mapper.writeValueAsString(num);
			response.getWriter().println(Num);
			return;
			// PrintWriter pw=response.getWriter();
			// if(num>0){
			// ArrayList<Comment>
			// listComment=articleService.queryComment(Integer.parseInt(article_id));
			// //是一个映射器：把对象转换成 json对象
			// ObjectMapper mapper1 = new ObjectMapper();
			// String json = mapper1.writeValueAsString(listComment);
			// System.out.println(json);
			// response.getWriter().println(json);
			// request.setAttribute("listComment", listComment);
			// pw.println("<script
			// type='text/javascript'>alert('发送成功');</script>");
			// request.getRequestDispatcher("/WEB-INF/jsp/comment.jsp").forward(request,
			// response);
			// }else{
			// pw.println("<script
			// type='text/javascript'>alert('发送失败');</script>");
			// }
			// pw.close();
		}
		// 根据文章id查找所有评论
		if ("queryAllComment".equals(getFunction())) {
			ArticleService articleService = ArticleService.getInstence();
			String article_id = request.getParameter("articleId");
			//article_id = "4";
			System.out.println(article_id);
			ArrayList<Comment> listComment = articleService.queryComment(Integer.parseInt(article_id));
			// //是一个映射器：把对象转换成 json对象
			ObjectMapper mapper = new ObjectMapper();
			String json = mapper.writeValueAsString(listComment);
			response.getWriter().println(json);
			return;
		}
		// 回复评论
		if ("reply".equals(getFunction())) {
			ArticleService articleService = ArticleService.getInstence();
			String content = request.getParameter("content");
			System.out.println(content);
			Date date = new Date();
			Reply reply = new Reply();
			reply.setComment_id(1);
			reply.setContent(content);
			reply.setCreate_time(date);
			int num = articleService.addReply(reply);
			PrintWriter pw = response.getWriter();
			if (num > 0) {
				pw.println("<script type='text/javascript'>alert('发送成功');</script>");
				request.getRequestDispatcher("/WEB-INF/jsp/comment.jsp").forward(request, response);
			} else {
				pw.println("<script type='text/javascript'>alert('发送失败');</script>");
			}
			pw.close();
		}
		// 收藏文章
		if ("collection".equals(getFunction())) {
			ArticleService articleService = ArticleService.getInstence();
			String article_id = request.getParameter("articleId");
			String user_id = request.getParameter("userId");
			Collection collection = new Collection();
			collection.setArticle_id(Integer.parseInt(article_id));
			collection.setUser_id(Integer.parseInt(user_id));
			Collection collect = articleService.judgeUserId(collection);
			boolean flag = false;
			if (collect != null) {
				flag = true;
			}
			int str = -1;
			if (flag) {
				int num = articleService.delCollection(collection);
				// System.out.println("delNum："+num);
				str = 0;
			} else {
				int num = articleService.addCollection(collection);
				// System.out.println("num："+num);
				str = 1;
			}
			System.out.println("str：" + str);
			// 是一个映射器：把对象转换成 json对象
			ObjectMapper mapper = new ObjectMapper();
			String result = mapper.writeValueAsString(str);
			response.getWriter().print(result);
			return;
		}
		// 设置文章状态（是否被删除,0被删除，1存在）
		if ("setArticle".equals(getFunction())) {
			ArticleService articleService = ArticleService.getInstence();
			Article article = new Article();
			article.setId(3);
			article.setStats(1);
			int num = articleService.setArticle(article);
			if (num > 0) {
				System.out.println("标记文章状态成功");
			} else {
				System.out.println("标记文章状态失败");
			}
		}
		
		if("findByTopic".equals(getFunction())){
			String topicId = request.getParameter("topicId");
			
			ArticleService articleService = ArticleService.getInstence();
			List<Article> topicArticles = articleService.findByTopic(Integer.parseInt(topicId));
			request.setAttribute("topicArticles", topicArticles);
			request.getRequestDispatcher("/WEB-INF/jsp/topicArticles.jsp").forward(request, response);
			
		}
		
		if("gowrite".equals(getFunction())){
			TopicService topicService = TopicService.getInstence();
			List<Topic> allTopics = topicService.findAllForUser();
			request.setAttribute("allTopics", allTopics);
			
			SortService sortService = SortService.getInstence();
			List<Sort> allSorts = sortService.findAllForUser();
			request.setAttribute("allSorts", allSorts);
			
			request.getRequestDispatcher("WEB-INF/jsp/write.jsp").forward(request, response);
			
		}
	}

}
