package entity;

import java.util.Date;

/**
 * 回复类
 * 
 * @author DouDou
 *
 */
public class Reply {

	private int id;// 编号
	private int comment_id;// 评论的id
	private String content;// 回复的内容
	private Date create_time;// 创建时间

	public Reply(int id, int comment_id, String content, Date create_time) {
		super();
		this.id = id;
		this.comment_id = comment_id;
		this.content = content;
		this.create_time = create_time;
	}

	public Reply(int comment_id, String content, Date create_time) {
		super();
		this.comment_id = comment_id;
		this.content = content;
		this.create_time = create_time;
	}

	public Reply() {
		super();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getComment_id() {
		return comment_id;
	}

	public void setComment_id(int comment_id) {
		this.comment_id = comment_id;
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

}
