package dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import entity.Article;
import entity.Collection;
import entity.Like;
import entity.PageBean;
import entity.User;

public interface ArticleDAO {
	// 查询所有文章
	public ArrayList<Article> queryAll();

	// 搜索查询文章
	public ArrayList<Article> queryArticle(String str);
	
	//搜索查询文章数量
	@Select("select count(*) from article where article_name like concat(concat('%',#{article_name}),'%')")
	public int queryArticleNum(String str);

	// 查询文章点赞数
	public int queryArticleLikeNum(int articleId);
	
	//判断用户是否点赞过
	public Like judgeLike(Like like);
	
	//用户点赞文章
	@Insert("insert into `like`(like_id,user_id,like_type,create_time) values(#{like_id},#{user_id},#{like_type},#{create_time})")
	public int addLike(Like like);
	
	//用户取消文章点赞
	@Delete("delete from `like` where like_id=#{like_id} and user_id=#{user_id}")
	public int delLike(Like like);
	
	// 查询文章评论数
	public int queryArticleCommentNum(int articleId);

	// 收藏文章
	public int addCollection(Collection collection);
	
	//取消收藏文章
	@Delete("delete from collection where user_id=#{user_id} and article_id=#{article_id}")
	public int delCollection(Collection collection);
	
	//判断收藏文章的用户是否已存在
	@Select("select * from collection where user_id=#{user_id} and article_id=#{article_id}")
	public Collection judgeUserId(Collection collection);

	// 设置文章状态（是否被删除,0被删除，1存在）
	public int setArticle(Article article);

	/**
	 * 根据id查找文章
	 * 
	 * @param id
	 * @return
	 */
	// @Select("SELECT * FROM article WHERE id = #{id}")
	// Article findArticleById(int id);

	/**
	 * 根据userid查询文章
	 * 
	 * @param usreid
	 * @return
	 */
	public List<Article> findArticleByUserId(int userid);

	/**
	 * 根据userid查询用户喜欢的文章
	 * 
	 * @param usreid
	 * @return
	 */
	List<Article> findLikeArticleByUserId(int userid);

	/**
	 * 根据userid查找用户收藏的文章
	 * 
	 * @param usreid
	 * @return
	 */
	// List<Article> findCollArticleByUserId(int userid);

	/**
	 * 对文章进行分页查询，展示给用户
	 * 
	 * @param page
	 * @return
	 */
	public List<Article> findArticleByPBForUser(PageBean<Article> page);

	/**
	 * 对文章进行分页查询，展示给管理员
	 * 
	 * @param page
	 * @return
	 */
	public List<Article> findArticleByPBForAdm(PageBean<Article> page);

	/**
	 * 获取文章数量，为管理员
	 * 
	 * @return
	 */
	@Select("select count(*) from article")
	public long getArticleCountForAdm();

	/**
	 * 为用户获取文章数
	 * 
	 * @return
	 */
	@Select("select count(*) from article where stats != 0")
	public long getArticleCountForUser();

	/**
	 * 通过id查询文章
	 * 
	 * @param id
	 * @return
	 */
	public Article findArticleById(int id);

	/**
	 * 找到精选的文章
	 * 
	 * @return
	 */
	public List<Article> findChosenArticle();

	/**
	 * 查询精选文章的数量
	 * 
	 * @return
	 */
	public int findChosenNum();

	@Update("update article set is_chosen = #{is_chosen} where id = #{id}")
	public int setIsChosen(Article article);

	/**
	 * 插入文章
	 * 
	 * @param article
	 * @return
	 */
	public int insertArticle(Article article);

	/**
	 * 通过用户id查询用户收藏的文章
	 * 
	 * @param id
	 * @return
	 */
	public List<Article> findCollArticles(int id);

	public List<Article> findByTopic(int topic_id);
}
