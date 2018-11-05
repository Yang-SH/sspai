package entity;

import java.util.Date;

public class Comment {
//	@Override
//	public String toString() {
//		return "Comment [id=" + id + ", user_id=" + user_id + ", content=" + content + ", create_time=" + create_time
//				+ ", article_id=" + article_id + ", user=" + user + ", article=" + article + ", like_num=" + like_num
//				+ "]";
//	}

	private int id;// 评论id
	private int user_id;// 评论用户的id
	private String content;// 评论内容
	private Date create_time;// 创建时间
	private int article_id;// 文章id
	private User user;//用户作者
	private Article article;
	public Article getArticle() {
		return article;
	}

	public void setArticle(Article article) {
		this.article = article;
	}

	public int getLike_num() {
		return like_num;
	}

	public void setLike_num(int like_num) {
		this.like_num = like_num;
	}

	private int like_num;// 评论点赞数
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
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

	public int getArticle_id() {
		return article_id;
	}

	public void setArticle_id(int article_id) {
		this.article_id = article_id;
	}

	public Date getCreate_time() {
		return create_time;
	}

	public void setCreate_time(Date create_time) {
		this.create_time = create_time;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
}
