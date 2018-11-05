package entity;

import java.util.Date;

public class Letter {
	private int id;//编号
	private int recevice;//接收者id
	private int send_id;//发送者id 
	private String content;//私信内容
	private Date create_time;//时间
	private int stats;//状态（0为被删除，1表示存在）
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getRecevice() {
		return recevice;
	}
	public void setRecevice(int recevice) {
		this.recevice = recevice;
	}
	public int getSend_id() {
		return send_id;
	}
	public void setSend_id(int send_id) {
		this.send_id = send_id;
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
	public int getStats() {
		return stats;
	}
	public void setStats(int stats) {
		this.stats = stats;
	}
}
