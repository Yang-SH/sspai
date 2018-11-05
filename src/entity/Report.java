package entity;

import java.util.Date;

/**
 * 举报类
 * 
 * @author DouDou
 *
 */
public class Report {

	private int id;// 1. 编号
	private String content;// 2. 内容
	private Date create_time;// 3. 时间
	private int user_id;// 4. 举报用户
	private String report_type;// 5. 举报类型

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
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

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public String getReport_type() {
		return report_type;
	}

	public void setReport_type(String report_type) {
		this.report_type = report_type;
	}

	public Report(int id, String content, Date create_time, int user_id, String report_type) {
		super();
		this.id = id;
		this.content = content;
		this.create_time = create_time;
		this.user_id = user_id;
		this.report_type = report_type;
	}

	public Report(String content, Date create_time, int user_id, String report_type) {
		super();
		this.content = content;
		this.create_time = create_time;
		this.user_id = user_id;
		this.report_type = report_type;
	}

	public Report() {
		super();
	}

	@Override
	public String toString() {
		return "Report [id=" + id + ", content=" + content + ", create_time=" + create_time + ", user_id=" + user_id
				+ ", report_type=" + report_type + "]";
	}

}
