package entity;

public class Sort {
	private int id;// 分类
	private String name;// 分类名称
	private int stats;// 状态（0为被删除，1表示存在）

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

	public int getStats() {
		return stats;
	}

	public void setStats(int stats) {
		this.stats = stats;
	}

	public Sort() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Sort(String name, int stats) {
		super();
		this.name = name;
		this.stats = stats;
	}

	@Override
	public String toString() {
		return "Sort [id=" + id + ", name=" + name + ", stats=" + stats + "]";
	}

}
