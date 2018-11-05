package test;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import dao.LikeDAO;
import entity.Article;
import entity.Like;
import util.MyBatisUtil;

public class TestLike {

	public static void main(String[] args) {
		SqlSession connection = MyBatisUtil.getSession();
		LikeDAO likeDAO = connection.getMapper(LikeDAO.class);
		// int likeArticleNum=likeDAO.findUserLikeArticleById(1);
//		int likeCommentNum = likeDAO.findUserLikeCommentById(1);
//		System.out.println(likeDAO.findUserLikeCommentById(1));
		// System.out.println(likeArticleNum);
//		System.out.println(likeCommentNum);
		List<Article> likeArticles=likeDAO.findUserLikeArticleContentById(1);
		
		System.out.println(likeArticles);
		connection.close();

	}

}
