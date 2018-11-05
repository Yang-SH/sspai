package service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import dao.TagDAO;
import util.MyBatisUtil;

public class TagService {

	private static TagService instence;

	private TagDAO tagDAO;

	private TagService() {
	};

	public static TagService getInstence() {
		if (instence == null) {
			instence = new TagService();
		}
		return instence;
	}

	/**
	 * 查询所有
	 * 
	 * @return
	 */
	public List<Integer> findAll() {
		SqlSession sqlSession = MyBatisUtil.getSession();
		tagDAO = sqlSession.getMapper(TagDAO.class);
		List<Integer> list = tagDAO.findAll();
		sqlSession.close();
		return list;
	}

	/**
	 * 插入一个菜单
	 * 
	 * @param id
	 * @return
	 */
	public boolean insertTag(int id) {
		SqlSession sqlSession = MyBatisUtil.getSession();
		tagDAO = sqlSession.getMapper(TagDAO.class);
		int insertTag = tagDAO.insertTag(id);
		sqlSession.close();
		if (insertTag > 0) {
			return true;
		} else {
			return false;
		}
	}

	/**
	 * 删除一个菜单
	 * 
	 * @param id
	 * @return
	 */
	public boolean deleteTag(int id) {
		SqlSession sqlSession = MyBatisUtil.getSession();
		tagDAO = sqlSession.getMapper(TagDAO.class);
		int delete = tagDAO.deleteTag(id);
		sqlSession.commit();
		sqlSession.close();
		if (delete > 0) {
			return true;
		} else {
			return false;
		}
	}

}
