package service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import dao.TopicDAO;
import entity.PageBean;
import entity.Topic;
import util.MyBatisUtil;

public class TopicService {

	private static TopicService instence;

	private TopicDAO topicDAO;

	private TopicService() {
	};

	public static TopicService getInstence() {
		if (instence == null) {
			instence = new TopicService();
		}
		return instence;
	}

	/**
	 * 查询所有为管理员
	 * 
	 * @return
	 */
	public List<Topic> findAllForUser() {
		SqlSession sqlSession = MyBatisUtil.getSession();
		topicDAO = sqlSession.getMapper(TopicDAO.class);
		List<Topic> list = topicDAO.findAllForUser();
		sqlSession.close();
		return list;
	}

	/**
	 * 查询所有为管理员
	 * 
	 * @return
	 */
	public List<Topic> findAllForAdmin() {
		SqlSession sqlSession = MyBatisUtil.getSession();
		topicDAO = sqlSession.getMapper(TopicDAO.class);
		List<Topic> list = topicDAO.findAllForAdmin();
		sqlSession.close();
		return list;
	}

	public Topic findTopicById(int id) {
		SqlSession sqlSession = MyBatisUtil.getSession();
		topicDAO = sqlSession.getMapper(TopicDAO.class);
		Topic topic = topicDAO.findTopicById(id);
		sqlSession.close();
		return topic;
	}

	/**
	 * 将专题设置位推荐
	 * 
	 * @param id
	 * @return
	 */
	public boolean setSuggest(int id) {
		SqlSession sqlSession = MyBatisUtil.getSession();
		topicDAO = sqlSession.getMapper(TopicDAO.class);
		// 根据id查询出要更新的专题
		Topic findTopicById = topicDAO.findTopicById(id);
		// 设置推荐
		findTopicById.setIs_suggest(true);
		int updateTopic = topicDAO.updateTopic(findTopicById);
		sqlSession.commit();
		sqlSession.close();
		if (updateTopic > 0) {
			return true;
		} else {
			return false;
		}
	}

	/**
	 * 根据id删除专题
	 * 
	 * @param id
	 * @return
	 */
	public boolean deleteTopicById(int id) {
		SqlSession sqlSession = MyBatisUtil.getSession();
		topicDAO = sqlSession.getMapper(TopicDAO.class);
		int deleteTopicById = topicDAO.deleteTopicById(id);
		sqlSession.commit();
		sqlSession.close();
		if (deleteTopicById > 0) {
			return true;
		} else {
			return false;
		}
	}

	/**
	 * 添加一条专题
	 * 
	 * @param topic
	 * @return
	 */
	public boolean insertTopic(Topic topic) {
		SqlSession sqlSession = MyBatisUtil.getSession();
		topicDAO = sqlSession.getMapper(TopicDAO.class);
		int insertTopic = topicDAO.insertTopic(topic);
		sqlSession.commit();
		sqlSession.close();
		if (insertTopic > 0) {
			return true;
		} else {
			return false;
		}
	}

	/**
	 * 更新专题
	 * 
	 * @param topic
	 * @return
	 */
	public boolean updateTopic(Topic topic) {
		SqlSession sqlSession = MyBatisUtil.getSession();
		topicDAO = sqlSession.getMapper(TopicDAO.class);
		int update = topicDAO.updateTopic(topic);
		sqlSession.commit();
		sqlSession.close();
		if (update > 0) {
			return true;
		} else {
			return false;
		}
	}

	/**
	 * 查询出数据的总数
	 * 
	 * @return
	 */
	public long findTotalCount() {
		SqlSession sqlSession = MyBatisUtil.getSession();
		System.out.println(sqlSession);
		topicDAO = sqlSession.getMapper(TopicDAO.class);
		long findTotalCount = topicDAO.findTotalCount();
		sqlSession.close();
		return findTotalCount;
	}

	/**
	 * 分页查询
	 * 
	 * @param pageBean
	 * @return
	 */
	public PageBean<Topic> findByPageBean(PageBean<Topic> pageBean) {

		SqlSession sqlSession = MyBatisUtil.getSession();
		topicDAO = sqlSession.getMapper(TopicDAO.class);

		pageBean.setTotalCount(topicDAO.findTotalCount());// 设置总数据数
		// 总页数
		int totalPage = (int) ((pageBean.getTotalCount() + pageBean.getPageSize() - 1) / pageBean.getPageSize());
		pageBean.setTotalPage(totalPage);

		int start = (pageBean.getPageNum() - 1) * pageBean.getPageSize();// 从哪开始
		pageBean.setStart(start);// 从哪开始拿数据
		// int size = pageBean.getPageSize();//获取几条数据
		List<Topic> list = topicDAO.findByPageBean(pageBean);
		System.out.println(list);
		pageBean.setList(list);

		sqlSession.close();
		return pageBean;
	}

	/**
	 * 对专题进行模糊查询
	 * 
	 * @param name
	 * @return
	 */
	public List<Topic> findByName(String name) {
		SqlSession sqlSession = MyBatisUtil.getSession();
		topicDAO = sqlSession.getMapper(TopicDAO.class);
		List<Topic> list = topicDAO.findByName(name);
		sqlSession.close();
		return list;
	}

	/**
	 * 根据用户的id查询收藏的专题
	 * 
	 * @param id
	 * @return
	 */
	public List<Topic> findByUserId(int id) {
		SqlSession sqlSession = MyBatisUtil.getSession();
		topicDAO = sqlSession.getMapper(TopicDAO.class);
		List<Topic> list = topicDAO.findByUserId(id);
		sqlSession.close();
		return list;
	}
	
	public List<Topic> findSuggestTopic(){
		SqlSession sqlSession = MyBatisUtil.getSession();
		topicDAO = sqlSession.getMapper(TopicDAO.class);
		List<Topic> list = topicDAO.findSuggestTopic();
		sqlSession.close();
		return list;
	}
	
}
