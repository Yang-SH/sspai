package controller;

import entity.Topic;
import service.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

/**
 * url映射的写法，前面的*表示进行的功能，后面的表示 功能模块名称+Action UserServlet
 */
@WebServlet("*.topicAction")
@SuppressWarnings("all")
// public class UserServlet extends HttpServlet {
public class TopicServlet extends BaseServlet {
	@Override
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
