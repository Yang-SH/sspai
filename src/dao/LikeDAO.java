package dao;

import java.util.List;

import entity.Article;
import entity.Like;

public interface LikeDAO {
	/*
	 * 根据id用户查询文章点赞数量
	 */
	public int findUserLikeArticleById(int id);
	/*
	 * 根据id用户查询评论点赞数量
	 */
	public int findUserLikeCommentById(int id);
	/*
	 * 根据id用户查询点赞的文章
	 */
	public List<Article> findUserLikeArticleContentById(int id);
	
}
