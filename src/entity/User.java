package entity;

import java.util.List;

public class User {
	private int id;// 用户id
	private String nickname;// 用户登录名
	private String email;// 用户邮箱
	private String password;// 用户登录密码
	private String introduce;// 用户个人简介
	private String good_at;// 用户擅长领域
	private int total_num;// 用户文章总字数
	private String head_path;// 用户头像路径
	private int attention_num;// 用户关注数
	private int followed_num;// 用户被关注数
	private int like_num;// 用户获赞数
	private int article_num;// 用户自己写的文章数
	
	public int getArticle_num() {
		return article_num;
	}

	public void setArticle_num(int article_num) {
		this.article_num = article_num;
	}

	public int getLike_num() {
		return like_num;
	}

	public void setLike_num(int like_num) {
		this.like_num = like_num;
	}

	private int stats;// 状态（0为被删除，1表示存在）

	private Article article;

	public Article getArticle() {
		return article;
	}

	public void setArticle(Article article) {
		this.article = article;
	}

	private Like like;// 用户对应的点赞
	private List<Article> likeArticles;// 用户喜欢的文章
	private List<Article> myArticles;// 用户自己编写的文章
	private List<Article> collArticles;// 用户收藏的文章
	private List<Comment> myComments;// 用户所有的评论
	private List<Attention_user> myAttention_users;// 用户关注别的用户的数量
	private List<User> attentionUser;// 用户关注别人的用户信息
	private List<User> beAttentionUser;// 用户被关注的别人的用户信息
	private List<Topic> collTopic;// 用户收藏的文章
	private int myArticleNum;// 用户自己写的文章数

	public int getMyArticleNum() {
		return myArticleNum;
	}

	public void setMyArticleNum(int myArticleNum) {
		this.myArticleNum = myArticleNum;
	}

	public List<Topic> getCollTopic() {
		return collTopic;
	}

	public void setCollTopic(List<Topic> collTopic) {
		this.collTopic = collTopic;
	}

	public List<Article> getCollArticles() {
		return collArticles;
	}

	public void setCollArticles(List<Article> collArticles) {
		this.collArticles = collArticles;
	}

	public List<User> getBeAttentionUser() {
		return beAttentionUser;
	}

	public void setBeAttentionUser(List<User> beAttentionUser) {
		this.beAttentionUser = beAttentionUser;
	}

	public List<User> getAttentionUser() {
		return attentionUser;
	}

	public void setAttentionUser(List<User> attentionUser) {
		this.attentionUser = attentionUser;
	}

	public List<Attention_user> getMyAttention_users() {
		return myAttention_users;
	}

	public void setMyAttention_users(List<Attention_user> myAttention_users) {
		this.myAttention_users = myAttention_users;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getIntroduce() {
		return introduce;
	}

	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}

	public String getGood_at() {
		return good_at;
	}

	public void setGood_at(String good_at) {
		this.good_at = good_at;
	}

	public int getTotal_num() {
		return total_num;
	}

	public void setTotal_num(int total_num) {
		this.total_num = total_num;
	}

	public String getHead_path() {
		return head_path;
	}

	public void setHead_path(String head_path) {
		this.head_path = head_path;
	}

	public int getFollowed_num() {
		return followed_num;
	}

	public void setFollowed_num(int followed_num) {
		this.followed_num = followed_num;
	}

	public List<Article> getLikeArticles() {
		return likeArticles;
	}

	public void setLikeArticles(List<Article> likeArticles) {
		this.likeArticles = likeArticles;
	}

	public List<Article> getMyArticles() {
		return myArticles;
	}

	public void setMyArticles(List<Article> myArticles) {
		this.myArticles = myArticles;
	}

	public int getAttention_num() {
		return attention_num;
	}

	public void setAttention_num(int attention_num) {
		this.attention_num = attention_num;
	}

	public List<Comment> getMyComments() {
		return myComments;
	}

	public void setMyComments(List<Comment> myComments) {
		this.myComments = myComments;
	}

	public Like getLike() {
		return like;
	}

	public void setLike(Like like) {
		this.like = like;
	}

	public int getStats() {
		return stats;
	}

	public void setStats(int stats) {
		this.stats = stats;
	}

	public User(int id, String nickname, String email, String password, String introduce, String good_at, int total_num,
			String head_path, int attention_num, int followed_num, List<Article> likeArticles, List<Article> myArticles,
			List<Comment> myComments) {
		super();
		this.id = id;
		this.nickname = nickname;
		this.email = email;
		this.password = password;
		this.introduce = introduce;
		this.good_at = good_at;
		this.total_num = total_num;
		this.head_path = head_path;
		this.attention_num = attention_num;
		this.followed_num = followed_num;
		this.likeArticles = likeArticles;
		this.myArticles = myArticles;
		this.myComments = myComments;
	}

	/*
	 * 登录功能的构造方法
	 */
	public User(String email, String password) {
		super();
		this.email = email;
		this.password = password;
	}

	/*
	 * 注册功能的构造方法
	 */
	public User(String email, String nickname, String password) {
		super();
		this.email = email;
		this.nickname = nickname;
		this.password = password;
	}

	public User() {
		super();
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", nickname=" + nickname + ", email=" + email + ", password=" + password
				+ ", introduce=" + introduce + ", good_at=" + good_at + ", total_num=" + total_num + ", head_path="
				+ head_path + ", attention_num=" + attention_num + ", followed_num=" + followed_num + ", like_num="
				+ like_num + ", article_num=" + article_num + ", stats=" + stats + ", article=" + article + ", like="
				+ like + ", likeArticles=" + likeArticles + ", myArticles=" + myArticles + ", myComments=" + myComments
				+ ", myAttention_users=" + myAttention_users + ", attentionUser=" + attentionUser + ", beAttentionUser="
				+ beAttentionUser + "]";
	}

}
