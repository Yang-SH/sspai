package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;


import org.apache.ibatis.session.SqlSession;

import com.fasterxml.jackson.databind.ObjectMapper;

import dao.UserDAO;
import entity.Article;
import entity.Attention_user;
import entity.Comment;
import entity.Like;
import entity.Result;
import entity.Topic;
import entity.User;
import service.ArticleService;
import service.AttentionService;
import service.CollectionService;
import service.CommentService;
import service.LikeService;
import service.TopicService;
import service.UserService;
import util.MyBatisUtil;

/**
 * url映射的写法，前面的*表示进行的功能，后面的表示 功能模块名称+Action UserServlet
 */
@WebServlet("*.topicAction")
@SuppressWarnings("all")
// public class UserServlet extends HttpServlet {
public class TopicServlet extends BaseServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 一定要调用父类的方法
		super.service(request, response);
		// System.out.println("function:" + getFunction());
		PrintWriter out = response.getWriter();// 获取打印输出流
		UserService userService = UserService.getInstence();
		LikeService likeService = LikeService.getInstence();
		ArticleService articleService = ArticleService.getInstence();
		CommentService commentService = CommentService.getInstence();
		AttentionService attentionService = AttentionService.getInstence();
		TopicService topicService = TopicService.getInstence();

		if ("allTopic".equals(getFunction())) {// 展示所有的专题
			List<Topic> allTopics = topicService.findAllForUser();
			request.setAttribute("allTopics", allTopics);
		}else if("topicList".equals(getFunction())){
			List<Topic> allTopics = topicService.findAllForUser();
			List<Topic> suggestTopics = topicService.findSuggestTopic();// 获取推荐专题
			request.setAttribute("allTopics", allTopics);
			request.setAttribute("suggestTopics", suggestTopics);
			request.getRequestDispatcher("/WEB-INF/jsp/topicList.jsp").forward(request, response);
		}
		
	}

}
