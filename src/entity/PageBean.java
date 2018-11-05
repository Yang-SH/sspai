package entity;

import java.util.List;

/**
 * 用于封装页面信息的类
 * 
 * @author DouDou
 *
 */
public class PageBean<T> {

	// 每页条数
	private int pageSize;

	// 目标要看的是那一页
	private int pageNum;

	// 总的记录数
	private long totalCount;

	// 总页数
	private int totalPage;

	// 从哪开始拿数据
	private int start;

	// 对象记录结果集
	private List<T> list;

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	public long getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(long totalCount) {
		this.totalCount = totalCount;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public List<T> getList() {
		return list;
	}

	public void setList(List<T> list) {
		this.list = list;
	}

	public PageBean(int pageSize, int pageNum, long totalCount, int totalPage, int start, List<T> list) {
		super();
		this.pageSize = pageSize;
		this.pageNum = pageNum;
		this.totalCount = totalCount;
		this.totalPage = totalPage;
		this.start = start;
		this.list = list;
	}

	public PageBean() {
		super();
	}

	@Override
	public String toString() {
		return "PageBean [pageSize=" + pageSize + ", pageNum=" + pageNum + ", totalCount=" + totalCount + ", totalPage="
				+ totalPage + ", start=" + start + ", list=" + list + "]";
	}

}
