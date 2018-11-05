package entity;

/**
 * 专题类
 * 
 * @author DouDou
 *
 */
public class Topic {

	private int id;// 主题编号
	private String name;// 主题名称
	private int article_num;// 主题文章数
	private String pic_path;// 专题图片路径
	private boolean is_suggest;// 是否推荐
	private int stats;//状态（0为被删除，1表示存在）
	
	public Topic(String name, int article_num, String pic_path, boolean is_suggest) {
		super();
		this.name = name;
		this.article_num = article_num;
		this.pic_path = pic_path;
		this.is_suggest = is_suggest;
	}

	public Topic(int id, String name, int article_num, String pic_path, boolean is_suggest) {
		super();
		this.id = id;
		this.name = name;
		this.article_num = article_num;
		this.pic_path = pic_path;
		this.is_suggest = is_suggest;
	}

	public Topic() {
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

	public int getArticle_num() {
		return article_num;
	}

	public void setArticle_num(int article_num) {
		this.article_num = article_num;
	}

	public String getPic_path() {
		return pic_path;
	}

	public void setPic_path(String pic_path) {
		this.pic_path = pic_path;
	}

	public boolean isIs_suggest() {
		return is_suggest;
	}

	public void setIs_suggest(boolean is_suggest) {
		this.is_suggest = is_suggest;
	}

	public int getStats() {
		return stats;
	}

	public void setStats(int stats) {
		this.stats = stats;
	}

	@Override
	public String toString() {
		return "Topic [id=" + id + ", name=" + name + ", article_num=" + article_num + ", pic_path=" + pic_path
				+ ", is_suggest=" + is_suggest + "]";
	}

}
