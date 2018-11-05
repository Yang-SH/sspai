package test;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import dao.TopicDAO;
import entity.Topic;
import util.MyBatisUtil;

public class TestTopic {

	public static void main(String[] args) {

		SqlSession session = MyBatisUtil.getSession();
		TopicDAO topicDAO = session.getMapper(TopicDAO.class);
		// List<Topic> findAll = topicDAO.findAll();
		// System.out.println(findAll);

		// Topic topic = new Topic();
		// topic.setId(1);
		// topic.setName("apple");
		// topic.setArticle_num(2);
		// topic.setPic_path("/upload/face-1.jpg");
		// topic.setIs_suggest(true);
		// int updateTopic = topicDAO.updateTopic(topic);
		// System.out.println(updateTopic);

		// for (int i = 0; i < 20; i++) {
		// Topic topic = new Topic("测试数据"+i, i, null, false);
		// topicDAO.insertTopic(topic);
		// }

		// PageBean pageBean = new PageBean();
		// pageBean.setPageSize(10);
		// pageBean.setPageNum(1);
		// TopicService topicService = TopicService.getInstence();
		// PageBean<Topic> findByPageBean =
		// topicService.findByPageBean(pageBean);
		// for (Object t : findByPageBean.getList()) {
		// System.out.println(t);
		// }

		// List<Topic> list = topicDAO.findByName("a");
		// System.out.println(list);

		session.commit();
		session.close();
	}

}
