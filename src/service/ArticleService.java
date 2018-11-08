package service;

import dao.ArticleDAO;
import dao.CommentDAO;
import dao.UserDAO;
import entity.*;
import org.apache.ibatis.session.SqlSession;
import util.MyBatisUtil;

import java.util.ArrayList;
import java.util.List;

public class ArticleService {
	// 功能操作的实例也就是UserService的实例
	private static ArticleService instence;

	// USRE的数据库的操作类
	private UserDAO userDAO;

	// 私有化构造，不让调用
	private ArticleService() {
	};

	/**
	 * 通过这个方法获取UserService的实例，就是单例模式
	 * 
	 * @return
	 */
	public static ArticleService getInstence() {
		if (instence == null) {
			instence = new ArticleService();
		}
		return instence;
	}

	// 查询所有文章
	public List<Article> queryAll() {
		SqlSession connection = MyBatisUtil.getSession();
		ArticleDAO articleDAO = connection.getMapper(ArticleDAO.class);
		List<Article> listArticle = articleDAO.queryAll();
		connection.close();
		return listArticle;
	}

	// 搜索查询文章
	public List<Article> queryArticle(String s) {
		SqlSession connection = MyBatisUtil.getSession();
		ArticleDAO articleDAO = connection.getMapper(ArticleDAO.class);
		List<Article> listArticle = articleDAO.queryArticle(s);
		connection.close();
		return listArticle;
	}

	// 搜索查询文章数量
	public int queryArticleNum(String str) {
		SqlSession connection = MyBatisUtil.getSession();
		ArticleDAO articleDAO = connection.getMapper(ArticleDAO.class);
		int num = articleDAO.queryArticleNum(str);
		connection.close();
		return num;
	}

	// 查询文章点赞数
	public int queryArticleLikeNum(int articleId) {
		SqlSession connection = MyBatisUtil.getSession();
		ArticleDAO articleDAO = connection.getMapper(ArticleDAO.class);
		int num = articleDAO.queryArticleLikeNum(articleId);
		connection.close();
		return num;
	}

	// 判断用户是否点赞过
	public Like judgeLike(Like like) {
		SqlSession connection = MyBatisUtil.getSession();
		ArticleDAO articleDAO = connection.getMapper(ArticleDAO.class);
		Like lik = articleDAO.judgeLike(like);
		connection.close();
		return lik;
	}

	// 用户点赞文章
	public int addLike(Like like) {
		SqlSession connection = MyBatisUtil.getSession();
		ArticleDAO articleDAO = connection.getMapper(ArticleDAO.class);
		int num = articleDAO.addLike(like);
		connection.commit();
		connection.close();
		return num;
	}

	// 用户取消文章点赞
	public int delLike(Like like) {
		SqlSession connection = MyBatisUtil.getSession();
		ArticleDAO articleDAO = connection.getMapper(ArticleDAO.class);
		int num = articleDAO.delLike(like);
		connection.commit();
		connection.close();
		return num;
	}

	// 查询文章评论数
	public int queryArticleCommentNum(int articleId) {
		SqlSession connection = MyBatisUtil.getSession();
		ArticleDAO articleDAO = connection.getMapper(ArticleDAO.class);
		int num = articleDAO.queryArticleCommentNum(articleId);
		connection.close();
		return num;
	}

	// 根据文章article_id查找所有评论
	public ArrayList<Comment> queryComment(int article_id) {
		SqlSession connection = MyBatisUtil.getSession();
		CommentDAO commentDAO = connection.getMapper(CommentDAO.class);
		ArrayList<Comment> listComment = commentDAO.queryComment(article_id);
		connection.close();
		return listComment;
	}

	// 评论文章
	public int addComment(Comment comment) {
		SqlSession connection = MyBatisUtil.getSession();
		CommentDAO commentDAO = connection.getMapper(CommentDAO.class);
		int num = commentDAO.addComment(comment);
		connection.commit();
		connection.close();
		return num;
	}

	// 回复评论
	public int addReply(Reply reply) {
		SqlSession connection = MyBatisUtil.getSession();
		CommentDAO commentDAO = connection.getMapper(CommentDAO.class);
		int num = commentDAO.addReply(reply);
		connection.commit();
		connection.close();
		return num;
	}

	// 收藏文章
	public int addCollection(Collection collection) {
		SqlSession connection = MyBatisUtil.getSession();
		ArticleDAO articleDAO = connection.getMapper(ArticleDAO.class);
		int num = articleDAO.addCollection(collection);
		connection.commit();
		connection.close();
		return num;
	}

	// 取消收藏文章
	public int delCollection(Collection collection) {
		SqlSession connection = MyBatisUtil.getSession();
		ArticleDAO articleDAO = connection.getMapper(ArticleDAO.class);
		int num = articleDAO.delCollection(collection);
		connection.commit();
		connection.close();
		return num;
	}

	// 判断收藏文章的用户是否已存在
	public Collection judgeUserId(Collection collection) {
		SqlSession connection = MyBatisUtil.getSession();
		ArticleDAO articleDAO = connection.getMapper(ArticleDAO.class);
		Collection collect = articleDAO.judgeUserId(collection);
		connection.close();
		return collect;
	}

	// 设置文章状态（是否被删除,0被删除，1存在）
	public int setArticle(Article article) {
		SqlSession connection = MyBatisUtil.getSession();
		ArticleDAO articleDAO = connection.getMapper(ArticleDAO.class);
		int num = articleDAO.setArticle(article);
		connection.commit();
		connection.close();
		return num;
	}

	/**
	 * 对文章进行分页查询，展示给用户
	 * 
	 * @param page
	 * @return
	 */
	public PageBean<Article> findArticleByPBForUser(PageBean<Article> page) {

		SqlSession sqlSession = MyBatisUtil.getSession();
		ArticleDAO articleDAO = sqlSession.getMapper(ArticleDAO.class);

		page.setTotalCount(articleDAO.getArticleCountForUser());// 设置数据总量

		// 总页数
		int totalPage = (int) ((page.getTotalCount() + page.getPageSize() - 1) / page.getPageSize());
		page.setTotalPage(totalPage);

		int start = (page.getPageNum() - 1) * page.getPageSize();// 从哪开始
		page.setStart(start);// 从哪开始拿数据
		// int size = page.getPageSize();// 获取几条数据

		List<Article> list = articleDAO.findArticleByPBForUser(page);
		System.out.println("findArticleByPBForUser list: " + list);
		page.setList(list);

		sqlSession.close();// 关闭
		return page;
	}

	public PageBean<Article> findArticleByPBForAdm(PageBean<Article> page) {

		SqlSession sqlSession = MyBatisUtil.getSession();
		ArticleDAO articleDAO = sqlSession.getMapper(ArticleDAO.class);

		page.setTotalCount(articleDAO.getArticleCountForAdm());// 设置数据总量

		// 总页数
		int totalPage = (int) ((page.getTotalCount() + page.getPageSize() - 1) / page.getPageSize());
		page.setTotalPage(totalPage);

		int start = (page.getPageNum() - 1) * page.getPageSize();// 从哪开始
		page.setStart(start);// 从哪开始拿数据
		// int size = page.getPageSize();// 获取几条数据

		List<Article> list = articleDAO.findArticleByPBForAdm(page);
		System.out.println("findArticleByPBForAdm list: " + list);
		page.setList(list);

		sqlSession.close();// 关闭
		return page;
	}

	/**
	 * 根据id查询文章
	 * 
	 * @param id
	 * @return
	 */
	public Article findArticleById(int id) {
		SqlSession sqlSession = MyBatisUtil.getSession();
		ArticleDAO articleDAO = sqlSession.getMapper(ArticleDAO.class);

		Article article = articleDAO.findArticleById(id);
		int likeNum = articleDAO.queryArticleLikeNum(id);// 设置点赞数
		article.setLike_num(likeNum);
		sqlSession.close();
		return article;
	}

	/*
	 * 查询用户写的文章
	 */
	public List<Article> findArticleByUserId(User u) {
		SqlSession sqlSession = MyBatisUtil.getSession();
		ArticleDAO articleDAO = sqlSession.getMapper(ArticleDAO.class);
		List<Article> list = articleDAO.findArticleByUserId(u.getId());
		sqlSession.close();
		return list;

	}

	/*
	 * 获取用户写的文章字数
	 */
	public int getContentCount(User u) {
		SqlSession sqlSession = MyBatisUtil.getSession();
		ArticleDAO articleDAO = sqlSession.getMapper(ArticleDAO.class);
		List<Article> list = articleDAO.findArticleByUserId(u.getId());
		int count = 0;
		for (Article article : list) {
			count += article.getContent().length();
		}
		sqlSession.close();
		return count;

	}

	/**
	 * 找到精选的文章
	 * 
	 * @return
	 */
	public List<Article> findChosenArticle() {
		SqlSession sqlSession = MyBatisUtil.getSession();
		ArticleDAO articleDAO = sqlSession.getMapper(ArticleDAO.class);

		List<Article> list = articleDAO.findChosenArticle();

		sqlSession.close();

		return list;
	}

	/**
	 * 查询精选文章的数量
	 * 
	 * @return
	 */
	public int findChosenNum() {
		SqlSession sqlSession = MyBatisUtil.getSession();
		ArticleDAO articleDAO = sqlSession.getMapper(ArticleDAO.class);

		int num = articleDAO.findChosenNum();

		sqlSession.close();

		return num;
	}

	/**
	 * 更新精选状态
	 * 
	 * @param article
	 * @return
	 */
	public boolean setIsChosen(Article article) {
		SqlSession sqlSession = MyBatisUtil.getSession();
		ArticleDAO articleDAO = sqlSession.getMapper(ArticleDAO.class);

		int chosen = articleDAO.setIsChosen(article);

		sqlSession.commit();
		sqlSession.close();

		if (chosen > 0) {
			return true;
		} else {
			return false;
		}

	}

	/**
	 * 插入文章
	 * 
	 * @param article
	 * @return
	 */
	public boolean insertArticle(Article article) {
		SqlSession sqlSession = MyBatisUtil.getSession();
		ArticleDAO articleDAO = sqlSession.getMapper(ArticleDAO.class);

		int insert = articleDAO.insertArticle(article);

		sqlSession.commit();
		sqlSession.close();

		if (insert > 0) {
			return true;
		} else {
			return false;
		}
	}

	/**
	 * 通过用户id查询用户收藏的文章
	 * 
	 * @param id
	 * @return
	 */
	public List<Article> findCollArticles(int id) {
		SqlSession sqlSession = MyBatisUtil.getSession();
		ArticleDAO articleDAO = sqlSession.getMapper(ArticleDAO.class);
		List<Article> articles = articleDAO.findCollArticles(id);

		sqlSession.close();
		return articles;
	}

	public List<Article> findByTopic(int parseInt) {

		SqlSession sqlSession = MyBatisUtil.getSession();
		ArticleDAO articleDAO = sqlSession.getMapper(ArticleDAO.class);
		List<Article> list = articleDAO.findByTopic(parseInt);

		sqlSession.close();

		return list;
	}

}
