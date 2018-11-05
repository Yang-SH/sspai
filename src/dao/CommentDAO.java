package dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Select;

import entity.Comment;
import entity.Reply;

public interface CommentDAO {

	/**
	 * 根据user_id查找评论
	 * 
	 * @param id
	 * @return
	 */
	@Select("SELECT * FROM `comment` WHERE `comment`.`user_id` = #{userid} ")
	List<Comment> findCommentByUserId(int userid);
	//根据文章article_id查找所有评论
	public ArrayList<Comment> queryComment(int article_id);
	//根据文章id评论
	public int addComment(Comment comment);
	//根据评论的用户id回复
	public int addReply(Reply reply);
	//根据id查询被评论的文章(包括文章作者名和文章标题)
	List<Comment> findCommentArticleByUserId(int userid);
}
