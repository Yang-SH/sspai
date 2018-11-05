package test;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import dao.ArticleDAO;
import entity.Article;
import service.ArticleService;
import util.MyBatisUtil;

public class TestArticle {

	public static void main(String[] args) {
//		SqlSession connection = MyBatisUtil.getSession();
//		ArticleDAO articleDAO = connection.getMapper(ArticleDAO.class);
//		List<Article> list=articleDAO.findArticleByUserId(1);
//		System.out.println("----------"+list);
//		System.out.println("-------------------------------");
		// 查询所有
		// List<Article> list = articleDAO.findAll();
		// System.out.println(list);

		// 根据id查找文章
		// Article findArticleById = articleDAO.findArticleById(3);
		// System.out.println(findArticleById);

		// 根据userid查询文章
		// List<Article> findArticleByUserId =
		// articleDAO.findArticleByUserId(1);
		// System.out.println(findArticleByUserId);

		// 根据userid查询用户喜欢的文章
		//List<Article> findLikeArticleByUserId = articleDAO.findLikeArticleByUserId(1);
		//System.out.println(findLikeArticleByUserId);
		
		//根据userid查找用户收藏的文章
		//List<Article> findCollArticleByUserId = articleDAO.findCollArticleByUserId(1);
		//System.out.println(findCollArticleByUserId);

//		connection.commit();
//		connection.close();
		
		ArticleService articleService = ArticleService.getInstence();
		Article article = new Article();
		article.setContent("我是测试内容2");
		article.setPic_path(null);
		article.setUser_id(1);
		article.setComment_num(0);
		article.setCreate_time(new Date());
		article.setTopic_id(1);
		article.setArticle_name("我是测试名称2");
		article.setStats(1);
		article.setIs_chosen(false);
		boolean insertArticle = articleService.insertArticle(article);
		
		System.out.println(insertArticle);
		
	}

}
