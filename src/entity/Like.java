package entity;

import java.util.Date;

public class Like {
	private int id;// 点赞id
	private int like_id;// 被点赞id
	private String like_type;// 点赞类型
	private int like_num;// 点赞数
	private int user_id;// 点赞者id
	private Date create_time;// 创建时间

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getLike_id() {
		return like_id;
	}

	public void setLike_id(int like_id) {
		this.like_id = like_id;
	}

	public String getLike_type() {
		return like_type;
	}

	public void setLike_type(String like_type) {
		this.like_type = like_type;
	}

	public int getLike_num() {
		return like_num;
	}

	public void setLike_num(int like_num) {
		this.like_num = like_num;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public Date getCreate_time() {
		return create_time;
	}

	public void setCreate_time(Date create_time) {
		this.create_time = create_time;
	}
}
