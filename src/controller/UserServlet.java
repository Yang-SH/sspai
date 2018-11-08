package controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import entity.*;
import service.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

/**
 * url映射的写法，前面的*表示进行的功能，后面的表示 功能模块名称+Action UserServlet
 */
@WebServlet("*.userAction")
@SuppressWarnings("all")
// public class UserServlet extends HttpServlet {
public class UserServlet extends BaseServlet {
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

		if ("gologin".equals(getFunction())) {// 去登录页面
			// 请求去登录页面
			response.sendRedirect("queryAll.articleAction");
			//request.getRequestDispatcher("/WEB-INF/jsp/main.jsp").forward(request, response);
		} else if ("login".equals(getFunction())) {// 登录页面
			// 1. 业务处理
			String user_email = request.getParameter("user_email");
			String user_password = request.getParameter("user_password");
			// 2. 绑定数据
			request.setAttribute("user_email", user_email);
			request.setAttribute("user_password", user_password);
			User user = new User(user_email, user_password);
			// 获取数据
			User loginUser = userService.findUser(user);
			/*
			 * 判断是否登录成功
			 */
			if (loginUser != null) {// 登录成功
				// 获取到用户写的文章
				List<Article> myArticles = articleService.findArticleByUserId(loginUser);
				loginUser.setMyArticles(myArticles);
				loginUser.setArticle_num(myArticles.size());
				//System.out.println("****************////////***************" + myArticles);

				// 保存用户信息到session
				request.getSession().setAttribute("loginUser", loginUser);
				// 回到首页
				response.sendRedirect("queryAll.articleAction");
				//request.getRequestDispatcher("/WEB-INF/jsp/main.jsp").forward(request, response);
			} else {// 登录失败时,继续返回登录请求
					// 请求去登录页面
				response.sendRedirect("gologin.userAction");
			}
		} else if ("goregister".equals(getFunction())) {// 去注册页面
			// 请求去注册页面
			request.getRequestDispatcher("/WEB-INF/jsp/register.jsp").forward(request, response);
		} else if ("register".equals(getFunction())) {// 注册页面
			// 1. 业务处理
			String user_email = request.getParameter("user_email");
			String user_nickname = request.getParameter("user_nickname");
			String user_password = request.getParameter("user_password");
			// 2. 绑定数据
			request.setAttribute("user_email", user_email);
			request.setAttribute("user_nickname", user_nickname);
			request.setAttribute("user_password", user_password);
			User user = new User(user_email, user_nickname, user_password);
			user.setHead_path("/upload/face-2.jpg");
			user.setStats(1);
			// System.out.println("register user:"+user);
			// 获取数据
			int registerUser = userService.insertUser(user);
			if (registerUser > 0) {// 注册成功
				// 请求去主页面
				request.getRequestDispatcher("/WEB-INF/jsp/main.jsp").forward(request, response);
			} else {// 注册失败
					// 请求去注册页面
				response.sendRedirect("goregister.userAction");
			}
		} else if ("logout".equals(getFunction())) {// 注销
			// 请求去登录页面
			request.getSession().removeAttribute("loginUser");
			//request.getRequestDispatcher("/WEB-INF/jsp/main.jsp").forward(request, response);
			response.sendRedirect("queryAll.articleAction");
		} else if ("gomodification".equals(getFunction())) {// 修改信息
			request.getRequestDispatcher("/WEB-INF/jsp/informationUser.jsp").forward(request, response);
		} else if ("modification".equals(getFunction())) {// 修改信息
			// 1. 业务处理
			//String user_head_path = request.getParameter("user_head_path");
			String user_nickname = request.getParameter("user_nickname");
			String user_good_at = request.getParameter("user_good_at");
			String user_introduce = request.getParameter("user_introduce");
			// 设置新的数据
			User loginUser = (User) request.getSession().getAttribute("loginUser");
			//loginUser.setHead_path(user_head_path);
			loginUser.setNickname(user_nickname);
			loginUser.setGood_at(user_good_at);
			loginUser.setIntroduce(user_introduce);
			// 获取数据
			int informationUser = userService.updateInformationById(loginUser);
			if (informationUser > 0) {// 修改(提交)成功
				// 刷新页面,弹出修改成功提示语
				request.getRequestDispatcher("/WEB-INF/jsp/informationUser.jsp").forward(request, response);
			} else {// 修改失败
					// 请求去修改个人信息页面
				response.sendRedirect("gomodification.userAction");
			}
		} else if ("passwd".equals(getFunction())) {// 修改密码
			User loginUser = (User) request.getSession().getAttribute("loginUser");
			String user_password = request.getParameter("user_password");// 获取到修改密码框的值
			if (user_password.equals(loginUser.getPassword())) {// 如果和数据库的密码一样,验证成功
				// 获取到新密码,替换原来的旧密码
				String user_newpassword = request.getParameter("user_newpassword");
				loginUser.setPassword(user_newpassword);
				int x = userService.updateUserPassword(loginUser);// 更新密码
				System.out.println(x);
				// 请求去登录页面,重新用新密码登陆
				request.getSession().removeAttribute("loginUser");
				request.getRequestDispatcher("/WEB-INF/jsp/main.jsp").forward(request, response);
			}
		} else if ("gohomepage".equals(getFunction())) {// 个人主页
			HttpSession session = request.getSession();
			User loginUser = (User) session.getAttribute("loginUser");// 获取当前登录的用户
			if (loginUser == null) {
				request.getRequestDispatcher("/WEB-INF/jsp/main.jsp").forward(request, response);
			}
			/* 下面获取主页要展示的信息 */

			// 获取到用户写的文章的字数
			loginUser.setTotal_num(articleService.getContentCount(loginUser));
			// 获取到用户关注别人的信息集合 (用来获取关注者的用户信息)
			List<User> attentionUser = userService.findUserAttentionById(loginUser);
			loginUser.setAttentionUser(attentionUser);
			// 获取到用户关注别人的数量(关注数)
			loginUser.setAttention_num(userService.findUserAttentionById(loginUser).size());
			// 获取到用户被关注的用户信息集合(用来获取被关注的用户信息)
			List<User> beAttentionUser = userService.findUserBeAttentionById(loginUser);
			loginUser.setBeAttentionUser(beAttentionUser);
			// System.out.println(beAttentionUser);
			// 获取到用户的被关注的数量(被关注数)
			loginUser.setAttention_num(userService.findUserBeAttentionById(loginUser).size());
			// 获取到用户的获赞数
			int like_num = likeService.findUserLikeArticleById(loginUser)
					+ likeService.findUserLikeCommentById(loginUser);
			loginUser.setLike_num(like_num);
			// 获取到用户点赞的文章
			List<Article> likeArticles = likeService.findUserLikeArticleContentById(loginUser);
			loginUser.setLikeArticles(likeArticles);

			// 获取用户评论文章的内容(评论,作者和标题)
			List<Comment> myComments = commentService.findCommentArticleByUserId(loginUser);
			// System.out.println(myComments);
			loginUser.setMyComments(myComments);

			// 获取用户收藏的文章
			List<Article> collArticles = articleService.findCollArticles(loginUser.getId());
			loginUser.setCollArticles(collArticles);

			// 用户收藏的专题
			TopicService topicService = TopicService.getInstence();
			List<Topic> collTopic = topicService.findByUserId(loginUser.getId());
			loginUser.setCollTopic(collTopic);

			session.setAttribute("loginUser", loginUser);

			request.getRequestDispatcher("/WEB-INF/jsp/homepage.jsp").forward(request, response);
		} else if ("findUser".equals(getFunction())) {

			String userid = request.getParameter("userid");
			if ("".equals(userid) || userid == null) {// 如果查询的用户id为空返回首页
				response.sendRedirect("gologin.userAction");
				return;
			} else {// 有id,则进行查询
				User findUser = userService.findUserById(Integer.parseInt(userid));
				if (findUser == null) {
					response.sendRedirect("gologin.userAction");
					return;
				} else {

					// 获取到用户写的文章的字数
					findUser.setTotal_num(articleService.getContentCount(findUser));
					// 获取到用户关注别人的信息集合 (用来获取关注者的用户信息)
					List<User> attentionUser = userService.findUserAttentionById(findUser);
					findUser.setAttentionUser(attentionUser);
					// 获取到用户关注别人的数量(关注数)
					findUser.setAttention_num(userService.findUserAttentionById(findUser).size());
					// 获取到用户被关注的用户信息集合(用来获取被关注的用户信息)
					List<User> beAttentionUser = userService.findUserBeAttentionById(findUser);
					findUser.setBeAttentionUser(beAttentionUser);
					// System.out.println(beAttentionUser);
					// 获取到用户的被关注的数量(被关注数)
					findUser.setAttention_num(userService.findUserBeAttentionById(findUser).size());
					// 获取到用户的获赞数
					int like_num = likeService.findUserLikeArticleById(findUser)
							+ likeService.findUserLikeCommentById(findUser);
					findUser.setLike_num(like_num);
					// 获取到用户点赞的文章
					List<Article> likeArticles = likeService.findUserLikeArticleContentById(findUser);
					findUser.setLikeArticles(likeArticles);

					// 获取用户评论文章的内容(评论,作者和标题)
					List<Comment> myComments = commentService.findCommentArticleByUserId(findUser);
					// System.out.println(myComments);
					findUser.setMyComments(myComments);

					// 获取用户收藏的文章
					List<Article> collArticles = articleService.findCollArticles(findUser.getId());
					findUser.setCollArticles(collArticles);

					// 用户收藏的专题
					TopicService topicService = TopicService.getInstence();
					List<Topic> collTopic = topicService.findByUserId(findUser.getId());
					findUser.setCollTopic(collTopic);
					// 用户关注(取消/添加)

					User loginUser = (User) request.getSession().getAttribute("loginUser");

					//System.out.println("-------------------loginUser " + loginUser + "------------- attentionService "
							//+ attentionService + " -----------------------------");
					Attention_user att = null;
					if(loginUser != null){
						
						att = attentionService.findOtherByuserid(loginUser.getId(),
								Integer.parseInt(userid));
					}

					boolean is_att;
					if (att == null) {
						//
						is_att = false;
					} else {
						is_att = true;
					}
					request.setAttribute("is_att", is_att);//

					request.setAttribute("findUser", findUser);
					request.getRequestDispatcher("/WEB-INF/jsp/otherhome.jsp").forward(request, response);
				}
			}
		}else if ("delAtt".equals(getFunction())) {
			//System.out.println("--------------------- delAtt ---------------------");
			String other_id = (String) request.getParameter("other_id");
			//System.out.println("--------------------- other_id :"+other_id+" ---------------------");
			User loginUser = (User) request.getSession().getAttribute("loginUser");
			Result result = new Result(); 
			if(other_id == null){
				result.setType("fail");
				result.setData("other_id is null");
				response.getWriter().print(new ObjectMapper().writeValueAsString(result));return;
			}else if(loginUser == null){
				result.setType("fail");
				result.setData("not login");
				response.getWriter().print(new ObjectMapper().writeValueAsString(result));return;
			}
			Attention_user attention_user = new Attention_user(loginUser.getId(), Integer.parseInt(other_id));
			if(attentionService.delAtt_User(attention_user)){//success
				//System.out.println("delAtt success");
				result.setType("delsuccess");
				response.getWriter().print(new ObjectMapper().writeValueAsString(result));return;
			}else{//fail
				//System.out.println("delAtt fail");
				result.setType("delfail");
				response.getWriter().print(new ObjectMapper().writeValueAsString(result));return;
			}
		}else if ("addAtt".equals(getFunction())) {
			//System.out.println("--------------------- addAtt ---------------------");
			String other_id = (String) request.getParameter("other_id");
			User loginUser = (User) request.getSession().getAttribute("loginUser");
			Result result = new Result(); 
			if(other_id == null){
				result.setType("fail");
				result.setData("other_id is null");
				response.getWriter().print(new ObjectMapper().writeValueAsString(result));return;
			}else if(loginUser == null){
				result.setType("fail");
				result.setData("not login");
				response.getWriter().print(new ObjectMapper().writeValueAsString(result));return;
			}
			Attention_user attention_user = new Attention_user(loginUser.getId(), Integer.parseInt(other_id));
			if(attentionService.insertAtt_User(attention_user)){//success
				//System.out.println("addAtt success");
				result.setType("addsuccess");
				response.getWriter().print(new ObjectMapper().writeValueAsString(result));return;
			}else{//fail
				//System.out.println("addAtt fail");
				result.setType("addfail");
				response.getWriter().print(new ObjectMapper().writeValueAsString(result));return;
			}
		}
		
	}

}
