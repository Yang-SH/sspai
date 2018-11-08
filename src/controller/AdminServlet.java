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
import java.util.ArrayList;
import java.util.List;

@WebServlet("*.adminAction")
public class AdminServlet extends BaseServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 一定要调用父类的方法
		super.service(request, response);

		ArticleService articleService = ArticleService.getInstence();// 文章
		UserService userService = UserService.getInstence();// 用户
		TopicService topicService = TopicService.getInstence();// 专题
		SortService sortService = SortService.getInstence();// 分类

		if ("login".equals(getFunction())) {// 登录
			String account = request.getParameter("account");
			String password = request.getParameter("password");
			PrintWriter out = response.getWriter();
			ObjectMapper mapper = new ObjectMapper();
			if (account == null || password == null) {
				Result result = new Result("fail", "登录失败，账号和密码不能为空！");
				out.print(mapper.writeValueAsString(result));
				return;
				// request.setAttribute("errMsg", "登录失败，账号和密码不能为空！");
				// request.getRequestDispatcher("WEB-INF/admin/login.jsp").forward(request,
				// response);
			}
			Admin admin = new Admin(account, password);
			System.out.println("admin login admin : " + admin);
			Admin login = AdminService.getInstence().login(admin);
			System.out.println("admin login login : " + login);
			if (login != null) {
				Result result = new Result("success", "登录成功!");
				out.print(mapper.writeValueAsString(result));
				request.getSession().setAttribute("loginAdmin", login);
				return;
				// request.getRequestDispatcher("WEB-INF/admin/user.html").forward(request,
				// response);
			} else {
				Result result = new Result("fail", "登录失败，账号或密码错误！");
				out.print(mapper.writeValueAsString(result));
				return;
				// request.setAttribute("errMsg", "登录失败，账号或密码错误！");
				// request.getRequestDispatcher("WEB-INF/admin/login.jsp").forward(request,
				// response);
			}

		} else if ("gologin".equals(getFunction())) {
			request.getRequestDispatcher("WEB-INF/admin/login.jsp").forward(request, response);
		} else if ("admin".equals(getFunction())) {
			HttpSession session = request.getSession();
			Admin admin = (Admin) session.getAttribute("loginAdmin");

			if (admin != null) {// 登录了

				String page = request.getParameter("page");// 获取要显示的页码
				if (page == null) {
					page = "1";
				}
				int pageNum = Integer.parseInt(page);
				pageNum = (pageNum < 0 ? 1 : pageNum);// 防止pageSize小于0

				PageBean<User> userPB = (PageBean) session.getAttribute("userPB");// 获取专题的分页
				if (userPB == null) {
					userPB = new PageBean<User>();
				}
				userPB.setPageSize(10);// 设置每页显示数
				userPB.setPageNum(pageNum);// 设置要找到那一页
				userPB = userService.findUserByPageBean(userPB);
				System.out.println("list:" + userPB.getList());
				request.setAttribute("topicPB", userPB);

				// List<User> list = userService.findAll();
				session.setAttribute("userPB", userPB);//
				request.getRequestDispatcher("WEB-INF/admin/admin.jsp").forward(request, response);
			} else {// 未登录
				request.getRequestDispatcher("WEB-INF/admin/login.jsp").forward(request, response);
			}
		} else if ("findUser".equals(getFunction())) {
			String userid = request.getParameter("userid");
			System.out.println("findUser userid: " + userid);
			User user = userService.findUserById(Integer.parseInt(userid));
			System.out.println("findUser user: " + user);
			List<User> attUsers = userService.findAttUserById(Integer.parseInt(userid));
			request.setAttribute("attUsers", attUsers);
			System.out.println("findUser attUsers: " + attUsers);
			request.setAttribute("findUser", user);
			request.getRequestDispatcher("WEB-INF/admin/user.jsp").forward(request, response);
		} else if ("deleteUser".equals(getFunction())) {// 删除用户
			String id = request.getParameter("id");
			if (id == null) {
				response.sendRedirect("admin.adminAction");
			}
			Result result = new Result();// 封装结果
			if (userService.deleteUserById(Integer.parseInt(id)) > 0) {
				System.out.println("deleteUser ：成功");
				result.setType("success");
			} else {
				System.out.println("deleteUser ：失败");
				result.setType("fail");
			}
			response.getWriter().print(new ObjectMapper().writeValueAsString(result));
			return;
		} else if ("articleList".equals(getFunction())) {// 获取文章的集合

			PageBean<Article> articlePB = (PageBean) request.getSession().getAttribute("articlePB");// 获取专题的分页
			if (articlePB == null) {
				articlePB = new PageBean<Article>();
			}
			articlePB.setPageSize(10);// 设置每页显示数
			articlePB.setPageNum(getPageNum(request));// 设置要显示按个页码
			articlePB = articleService.findArticleByPBForAdm(articlePB);// 分页

			System.out.println("list:" + articlePB.getList());
			request.getSession().setAttribute("articlePB", articlePB);

			request.getRequestDispatcher("WEB-INF/admin/articleList.jsp").forward(request, response);
		} else if ("deleteArticle".equals(getFunction())) {// 删除文章
			String id = request.getParameter("id");
			if (id == null || id.equals("")) {
				response.sendRedirect("articleList.adminAction");
				return;
			}

			System.out.println("deleteArticle id : " + id);

			Article article = new Article();
			article.setId(Integer.parseInt(id));
			article.setStats(0);// 设置为删除状态
			Result result = new Result();// 封装结果
			if (articleService.setArticle(article) > 0) {
				System.out.println("deleteArticle ：成功");
				result.setType("success");
			} else {
				System.out.println("deleteArticle ：失败");
				result.setType("fail");
			}
			System.out.println("reutl: " + result);

			response.getWriter().print(new ObjectMapper().writeValueAsString(result));
			return;
		} else if ("findArticle".equals(getFunction())) {// 查询单个文章
			CommentService commentService = CommentService.getInstence();
			String articleid = request.getParameter("articleid");
			if ("".equals(articleid) || articleid == null) {
				response.sendRedirect("articleList.adminAction");
				return;
			}
			Article article = articleService.findArticleById(Integer.parseInt(articleid));
			ArrayList<Comment> list = commentService.queryComment(article.getId());
			article.setCommList(list);
			article.setComment_num(list.size());
			request.setAttribute("article", article);
			request.getRequestDispatcher("WEB-INF/admin/article.jsp").forward(request, response);
		} else if ("updateArticle".equals(getFunction())) {// 更新文章
			String id = request.getParameter("id");
			if (id == null) {
				response.sendRedirect("articleList.adminAction");
				return;
			}
			String stats = request.getParameter("stats");// 状态
			Article article = new Article();
			article.setId(Integer.parseInt(id));
			article.setStats(Integer.parseInt(stats));
			System.out.println("updateArticle article : " + article);
			Result result = new Result();// 封装结果
			if (articleService.setArticle(article) > 0) {// 通过返回值判断更新是否成功
				// 成功
				System.out.println("updateTopic ：成功");
				result.setType("success");
			} else {
				// 失败
				System.out.println("updateTopic ：失败");
				result.setType("fail");
			}
			response.getWriter().print(new ObjectMapper().writeValueAsString(result));
			return;
		} else if ("topicList".equals(getFunction())) {// 专题列表
			String page = request.getParameter("page");// 获取页码
			if (page == null) {
				page = "1";
			}
			int pageNum = Integer.parseInt(page);
			pageNum = (pageNum < 0 ? 1 : pageNum);// 防止pageSize小于0

			PageBean topicPB = (PageBean) request.getSession().getAttribute("topicPB");// 获取专题的分页
			if (topicPB == null) {
				topicPB = new PageBean<Topic>();
			}
			topicPB.setPageSize(10);// 设置每页显示数
			topicPB.setPageNum(pageNum);// 设置要找到那一页
			topicPB = topicService.findByPageBean(topicPB);
			System.out.println("list:" + topicPB.getList());
			request.getSession().setAttribute("topicPB", topicPB);
			request.getRequestDispatcher("WEB-INF/admin/topicList.jsp").forward(request, response);
		} else if ("findTopic".equals(getFunction())) {// 根据id查找专题
			int topicid = Integer.parseInt(request.getParameter("topicid"));
			System.out.println("findTopic id : " + topicid);
			Topic topic = topicService.findTopicById(topicid);
			request.setAttribute("findTopic", topic);
			request.getRequestDispatcher("WEB-INF/admin/topic.jsp").forward(request, response);
		} else if ("updateTopic".equals(getFunction())) {// 更新专题
			String id = request.getParameter("id");
			if (id == null) {
				response.sendRedirect("topicList.adminAction");
			}
			String name = request.getParameter("name");
			String is_suggest = request.getParameter("is_suggest");
			String topic_stats = request.getParameter("stats");
			boolean suggest;
			if ("1".equals(is_suggest)) {// 上传的值为1表示推荐
				suggest = true;
			} else {// 否则不推荐
				suggest = false;
			}
			Topic topic = topicService.findTopicById(Integer.parseInt(id));
			topic.setName(name);
			topic.setIs_suggest(suggest);
			topic.setStats(Integer.parseInt(topic_stats));
			System.out.println("updateTopic topic : " + topic);
			Result result = new Result();// 封装结果
			if (topicService.updateTopic(topic)) {// 通过返回值判断更新是否成功
				// 成功
				System.out.println("updateTopic ：成功");
				result.setType("success");
			} else {
				// 失败
				System.out.println("updateTopic ：失败");
				result.setType("fail");
			}
			response.getWriter().print(new ObjectMapper().writeValueAsString(result));
			return;
		} else if ("deleteTopic".equals(getFunction())) {
			String id = request.getParameter("id");
			if (id == null) {
				response.sendRedirect("topicList.adminAction");
			}
			Result result = new Result();// 封装结果
			if (topicService.deleteTopicById(Integer.parseInt(id))) {
				System.out.println("deleteTopic ：成功");
				result.setType("success");
			} else {
				System.out.println("deleteTopic ：失败");
				result.setType("fail");
			}
			response.getWriter().print(new ObjectMapper().writeValueAsString(result));
			return;
		} else if ("sortList".equals(getFunction())) {// 分类列表

			PageBean<Sort> sortPB = (PageBean) request.getSession().getAttribute("sortPB");// 获取专题的分页
			if (sortPB == null) {
				sortPB = new PageBean<Sort>();
			}
			sortPB.setPageNum(getPageNum(request));// 设置要显示哪个页码
			sortPB.setPageSize(10);// 设置每页显示数
			sortPB = sortService.findByPB(sortPB);
			System.out.println("list:" + sortPB.getList());
			request.getSession().setAttribute("sortPB", sortPB);
			request.getRequestDispatcher("WEB-INF/admin/sortList.jsp").forward(request, response);
		} else if ("findSort".equals(getFunction())) {// 根据id查找分类
			String id = request.getParameter("sortid");
			if (id == null || "".equals(id)) {
				response.sendRedirect("sortList.adminAction");
				return;
			}
			Sort sort = sortService.findById(Integer.parseInt(id));
			request.setAttribute("sort", sort);
			request.getRequestDispatcher("WEB-INF/admin/sort.jsp").forward(request, response);
		} else if ("updateSort".equals(getFunction())) {// 更新专题
			String id = request.getParameter("id");
			if (id == null) {
				response.sendRedirect("sortList.adminAction");
			}
			String name = request.getParameter("name");
			String stats = request.getParameter("stats");
			Sort sort = sortService.findById(Integer.parseInt(id));
			sort.setName(name);
			sort.setStats(Integer.parseInt(stats));
			System.out.println("updateTopic topic : " + sort);
			Result result = new Result();// 封装结果
			if (sortService.updateSort(sort)) {// 通过返回值判断更新是否成功
				// 成功
				System.out.println("updateSort ：成功");
				result.setType("success");
			} else {
				// 失败
				System.out.println("updateSort ：失败");
				result.setType("fail");
			}
			response.getWriter().print(new ObjectMapper().writeValueAsString(result));
			return;
		} else if ("toaddSort".equals(getFunction())) {// 去添加页面
			System.out.println("addSort.adminAction");
			request.getRequestDispatcher("WEB-INF/admin/addsort.jsp").forward(request, response);
		} else if ("addSort".equals(getFunction())) {// 添加
			String name = request.getParameter("name");
			String stats = request.getParameter("stats");
			Result result = new Result();
			ObjectMapper objectMapper = new ObjectMapper();
			if (name == null || "".equals(name)) {
				result.setType("fail");
				result.setData("name is null");
				response.getWriter().print(objectMapper.writeValueAsString(result));
				return;
			}
			if (stats == null || "".equals(stats)) {
				result.setType("fail");
				result.setData("stats is null");
				response.getWriter().print(objectMapper.writeValueAsString(result));
				return;
			}

			Sort sort = new Sort(name, Integer.parseInt(stats));
			if (sortService.insertSort(sort)) {
				result.setType("success");
				response.getWriter().print(objectMapper.writeValueAsString(result));
				return;
			} else {
				result.setType("fail");
				response.getWriter().print(objectMapper.writeValueAsString(result));
				return;
			}

		} else if ("toSearch".equals(getFunction())) {// 去搜索页面
			System.out.println("toSearch.adminAction");
			request.getRequestDispatcher("WEB-INF/admin/search.jsp").forward(request, response);
		} else if ("search".equals(getFunction())) {// 进行搜索
			String name = request.getParameter("name");

			List<Article> searchArticles = articleService.queryArticle(name);
			List<User> searchUsers = userService.findByName(name);
			List<Topic> searchTopics = topicService.findByName(name);
			List<Sort> searchSorts = sortService.findByName(name);

			request.setAttribute("searchArticles", searchArticles);
			request.setAttribute("searchUsers", searchUsers);
			request.setAttribute("searchTopics", searchTopics);
			request.setAttribute("searchSorts", searchSorts);
			request.getRequestDispatcher("WEB-INF/admin/search.jsp").forward(request, response);
		} else if ("tagList".equals(getFunction())) {// 去菜单列表
			List<Sort> tags = sortService.getTags();

			request.setAttribute("tags", tags);
			request.getRequestDispatcher("WEB-INF/admin/tagList.jsp").forward(request, response);
		} else if ("deleteTag".equals(getFunction())) {// 删除一个菜单
			String id = request.getParameter("id");
			TagService tagService = TagService.getInstence();
			Result result = new Result();// 封装结果
			if (tagService.deleteTag(Integer.parseInt(id))) {
				System.out.println("deleteTopic ：成功");
				result.setType("success");
			} else {
				System.out.println("deleteTopic ：失败");
				result.setType("fail");
			}
			response.getWriter().print(new ObjectMapper().writeValueAsString(result));
			return;
		} else if ("addArticle".equals(getFunction())) {//
			String content = request.getParameter("content");
			System.out.println("addArticle content : " + content);
			System.out.println("addArticle content size: " + content.length());
			request.getSession().setAttribute("content", content);
			// Result result = new Result("success",content);
			// response.getWriter().print(new
			// ObjectMapper().writeValueAsString(result));
			request.getRequestDispatcher("show.jsp").forward(request, response);
		} else if ("chosenList".equals(getFunction())) {// 精选列表
			List<Article> chosenArticle = articleService.findChosenArticle();
			request.setAttribute("chosenArticle", chosenArticle);
			request.getRequestDispatcher("WEB-INF/admin/chosenList.jsp").forward(request, response);
		} else if ("setChosen".equals(getFunction())) {// 设置精选
			String id = request.getParameter("id");

			Article article = articleService.findArticleById(Integer.parseInt(id));
			String chosen = request.getParameter("chosen");// 0表示false，1表示true
			boolean is_chosen;
			Result result = new Result();// 封装结果
			if ("0".equals(chosen)) {
				is_chosen = false;
			} else {
				is_chosen = true;
				int chosenNum = articleService.findChosenNum();
				if (chosenNum >= 5) {
					result.setType("fail");
					result.setData("only 5 chosen");
					response.getWriter().print(new ObjectMapper().writeValueAsString(result));
					return;
				}
			}
			article.setIs_chosen(is_chosen);
			if (articleService.setIsChosen(article)) {
				System.out.println("setChosen ：成功");
				result.setType("success");
			} else {
				System.out.println("setChosen ：失败");
				result.setType("fail");
			}
			response.getWriter().print(new ObjectMapper().writeValueAsString(result));
			return;
		} 

	}

	/**
	 * 为要分页的数据获取要显示的页码
	 * 
	 * @param request
	 * @return
	 */
	public int getPageNum(HttpServletRequest request) {
		String page = request.getParameter("page");// 获取页码
		if (page == null) {
			page = "1";
		}
		int pageNum = Integer.parseInt(page);
		pageNum = (pageNum < 0 ? 1 : pageNum);// 防止pageSize小于0
		return pageNum;
	}

}
