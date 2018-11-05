package entity;

import java.util.Date;
import java.util.List;

/**
 * 文章类
 * 
 * @author DouDou
 *
 */
public class Article {

	private int id;// 文章id
	private String name;// 文章的名称
	private String pic_path;// 文章图片地址
	private int user_id;// 创建用户(作者)
	private String content;// 文章内容
	private Date create_time;// 创建时间
	private int article_num;//文章数
	private int comment_num;// 评论数
	private int like_num;// 点赞数
	private int topic_id;// 专题id
	private String article_name;// 文章
	private User user;// 用户
	private int stats;// 状态（0为被删除，1表示存在）

	private List<Comment> commList;// 这篇文章的评论
	
	private boolean is_chosen;//是否精选

	public Article(int id, String name, String pic_path, int user_id, String content, Date create_time, int comment_num,
			int topic_id) {
		super();
		this.id = id;
		this.name = name;
		this.pic_path = pic_path;
		this.user_id = user_id;
		this.content = content;
		this.create_time = create_time;
		this.comment_num = comment_num;
		this.topic_id = topic_id;
	}

	public Article() {
		super();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPic_path() {
		return pic_path;
	}

	public void setPic_path(String pic_path) {
		this.pic_path = pic_path;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getCreate_time() {
		return create_time;
	}

	public void setCreate_time(Date create_time) {
		this.create_time = create_time;
	}

	public int getArticle_num() {
		return article_num;
	}

	public void setArticle_num(int article_num) {
		this.article_num = article_num;
	}

	public int getComment_num() {
		return comment_num;
	}

	public void setComment_num(int comment_num) {
		this.comment_num = comment_num;
	}

	public int getTopic_id() {
		return topic_id;
	}

	public void setTopic_id(int topic_id) {
		this.topic_id = topic_id;
	}

	public String getArticle_name() {
		return article_name;
	}

	public void setArticle_name(String article_name) {
		this.article_name = article_name;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public int getStats() {
		return stats;
	}

	public void setStats(int stats) {
		this.stats = stats;
	}

	public int getLike_num() {
		return like_num;
	}

	public void setLike_num(int like_num) {
		this.like_num = like_num;
	}

	public List<Comment> getCommList() {
		return commList;
	}

	public void setCommList(List<Comment> commList) {
		this.commList = commList;
	}

	public boolean isIs_chosen() {
		return is_chosen;
	}

	public void setIs_chosen(boolean is_chosen) {
		this.is_chosen = is_chosen;
	}

	@Override
	public String toString() {
		return "Article [id=" + id + ", name=" + name + ", pic_path=" + pic_path + ", user_id=" + user_id + ", content="
				+ content + ", create_time=" + create_time + ", comment_num=" + comment_num + ", like_num=" + like_num
				+ ", topic_id=" + topic_id + ", article_name=" + article_name + ", user=" + user + ", stats=" + stats
				+ ", commList=" + commList + "]";
	}

}
