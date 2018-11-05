package service;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import dao.CommentDAO;
import entity.Comment;
import entity.User;
import util.MyBatisUtil;

public class CommentService {

	private static CommentService instence;

	private CommentDAO commentDAO;

	private CommentService() {
	};

	public static CommentService getInstence() {
		if (instence == null) {
			instence = new CommentService();
		}
		return instence;
	}

	/**
	 * 根据文章article_id查找所有评论
	 * 
	 * @param article_id
	 * @return
	 */
	public ArrayList<Comment> queryComment(int article_id) {
		SqlSession sqlSession = MyBatisUtil.getSession();
		commentDAO = sqlSession.getMapper(CommentDAO.class);
		ArrayList<Comment> list = commentDAO.queryComment(article_id);
		// System.out.println("queryComment list :"+list);
		sqlSession.close();
		return list;
	}

	/*
	 * 获取用户评论文章的内容(评论,作者和标题)
	 */
	public List<Comment> findCommentArticleByUserId(User u){
		SqlSession sqlSession = MyBatisUtil.getSession();
		CommentDAO commentDAO = sqlSession.getMapper(CommentDAO.class);
		List<Comment> list=commentDAO.findCommentArticleByUserId(u.getId());
		sqlSession.close();
		return list;
		
	}
}
