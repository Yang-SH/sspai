package entity;

/**
 * 收藏文章表
 * 
 * @author DouDou
 *
 */
public class Collection {

	private int user_id;// 用户的id
	private int article_id;// 收藏文章的id

	public Collection(int user_id, int article_id) {
		super();
		this.user_id = user_id;
		this.article_id = article_id;
	}

	public Collection() {
		super();
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public int getArticle_id() {
		return article_id;
	}

	public void setArticle_id(int article_id) {
		this.article_id = article_id;
	}

}
