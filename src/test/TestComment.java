package test;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import dao.CommentDAO;
import entity.Comment;
import util.MyBatisUtil;

public class TestComment {

	
	public static void main(String[] args) {
		SqlSession sqlSession = MyBatisUtil.getSession();
		CommentDAO commentDAO = sqlSession.getMapper(CommentDAO.class);
		//List<Comment> list =commentDAO.findCommentByUserId(1);
		List<Comment> list=commentDAO.findCommentArticleByUserId(1);
		System.out.println("+++++++++++++++++++++++++++++"+list);
		sqlSession.close();

	}

}
