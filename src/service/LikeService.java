package service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import dao.LikeDAO;
import entity.Article;
import entity.Like;
import entity.User;
import util.MyBatisUtil;

public class LikeService {
	// 功能操作的实例也就是UserService的实例
	private static LikeService instence;

	// USRE的数据库的操作类
	private LikeDAO likeDAO;

	// 私有化构造，不让调用
	private LikeService() {
	};

	/**
	 * 通过这个方法获取UserService的实例，就是单例模式
	 * 
	 * @return
	 */
	public static LikeService getInstence() {
		if (instence == null) {
			instence = new LikeService();
		}
		return instence;
	}
	/*
	 * 根据id用户查询文章点赞数量
	 */
	public int findUserLikeArticleById(User u){
		SqlSession connection = MyBatisUtil.getSession();
		LikeDAO likeDAO=connection.getMapper(LikeDAO.class);
		int likeArticleNum=likeDAO.findUserLikeArticleById(u.getId());
		connection.close();
		return likeArticleNum;
	}
	/*
	 * 根据id用户查询评论点赞数量
	 */
	public int findUserLikeCommentById(User u){
		SqlSession connection = MyBatisUtil.getSession();
		LikeDAO likeDAO=connection.getMapper(LikeDAO.class);
		int likeCommentNum=likeDAO.findUserLikeCommentById(u.getId());
		connection.close();
		return likeCommentNum;
		
	}
	/*
	 * 根据id用户查询点赞的文章
	 */
	public List<Article> findUserLikeArticleContentById(User u){
		SqlSession connection = MyBatisUtil.getSession();
		LikeDAO likeDAO=connection.getMapper(LikeDAO.class);
		List<Article> list=likeDAO.findUserLikeArticleContentById(u.getId());
		connection.close();
		return list;
		
	}
	
}
