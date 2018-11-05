package service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import dao.SortDAO;
import entity.PageBean;
import entity.Sort;
import util.MyBatisUtil;

public class SortService {

	private static SortService instence;

	private SortDAO sortDAO;

	private SortService() {
	};

	public static SortService getInstence() {
		if (instence == null) {
			instence = new SortService();
		}
		return instence;
	}

	/**
	 * 分页查询分类
	 * 
	 * @param page
	 * @return
	 */
	public PageBean<Sort> findByPB(PageBean<Sort> page) {
		SqlSession sqlSession = MyBatisUtil.getSession();
		sortDAO = sqlSession.getMapper(SortDAO.class);

		page.setTotalCount(sortDAO.getSortCount());// 设置总数据数
		// 总页数
		int totalPage = (int) ((page.getTotalCount() + page.getPageSize() - 1) / page.getPageSize());
		page.setTotalPage(totalPage);

		int start = (page.getPageNum() - 1) * page.getPageSize();// 从哪开始
		page.setStart(start);// 从哪开始拿数据
		List<Sort> list = sortDAO.findByPB(page);
		System.out.println(list);
		page.setList(list);

		sqlSession.close();
		return page;
	}

	/**
	 * 找到所有分类，展示给用户
	 * 
	 * @return
	 */
	public List<Sort> findAllForUser() {

		SqlSession sqlSession = MyBatisUtil.getSession();
		sortDAO = sqlSession.getMapper(SortDAO.class);

		List<Sort> list = sortDAO.findAllForUser();

		sqlSession.close();
		return list;
	}

	/**
	 * 根据id找到一个分类
	 * 
	 * @param id
	 * @return
	 */
	public Sort findById(int id) {
		SqlSession sqlSession = MyBatisUtil.getSession();
		sortDAO = sqlSession.getMapper(SortDAO.class);

		Sort sort = sortDAO.findById(id);

		sqlSession.close();
		return sort;
	}

	/**
	 * 更新分类
	 * 
	 * @param sort
	 * @return
	 */
	public boolean updateSort(Sort sort) {
		SqlSession sqlSession = MyBatisUtil.getSession();
		sortDAO = sqlSession.getMapper(SortDAO.class);

		int updateSort = sortDAO.updateSort(sort);

		sqlSession.commit();
		sqlSession.close();

		if (updateSort > 0) {
			return true;
		} else {
			return false;
		}

	}

	/**
	 * 添加一条分类
	 * 
	 * @param sort
	 * @return
	 */
	public boolean insertSort(Sort sort) {
		SqlSession sqlSession = MyBatisUtil.getSession();
		sortDAO = sqlSession.getMapper(SortDAO.class);

		int insert = sortDAO.insertSort(sort);

		sqlSession.commit();
		sqlSession.close();

		if (insert > 0) {
			return true;
		} else {
			return false;
		}

	}

	/**
	 * 对分类进行模糊查询
	 * 
	 * @param name
	 * @return
	 */
	public List<Sort> findByName(String name) {
		SqlSession sqlSession = MyBatisUtil.getSession();
		sortDAO = sqlSession.getMapper(SortDAO.class);
		List<Sort> list = sortDAO.findByName(name);
		sqlSession.close();
		return list;
	}

	/**
	 * 根据菜单表中的id查出用作菜单的分类
	 * 
	 * @return
	 */
	public List<Sort> getTags() {
		TagService tagService = TagService.getInstence();
		List<Integer> findAll = tagService.findAll();
		SqlSession sqlSession = MyBatisUtil.getSession();
		sortDAO = sqlSession.getMapper(SortDAO.class);
		List<Sort> tags = sortDAO.getTags(findAll);
		sqlSession.close();
		return tags;
	}

}
