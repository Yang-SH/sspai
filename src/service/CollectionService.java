package service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import dao.CollectionDAO;
import dao.UserDAO;
import entity.Collection;
import util.MyBatisUtil;

public class CollectionService {

	// 功能操作的实例也就是CollectionService的实例
	private static CollectionService instence;

	// USRE的数据库的操作类
	private CollectionDAO collectionDAO;

	// 私有化构造，不让调用
	private CollectionService() {
	};

	/**
	 * 通过这个方法获取UserService的实例，就是单例模式
	 * 
	 * @return
	 */
	public static CollectionService getInstence() {
		if (instence == null) {
			instence = new CollectionService();
		}
		return instence;
	}

	// 插入收藏文章的id
	public int insertCollection(int user_id, int articleid) {
		SqlSession connection = MyBatisUtil.getSession();
		int result = 0;
		collectionDAO = connection.getMapper(CollectionDAO.class);
		result = collectionDAO.insertCollection(user_id, articleid);
		connection.commit();
		connection.close();
		return result;
	}

	/**
	 * 根据用户id查询收藏的文章
	 * 
	 * @param id
	 * @return
	 */
	public List<Collection> findByUserId(int id) {
		SqlSession connection = MyBatisUtil.getSession();
		collectionDAO = connection.getMapper(CollectionDAO.class);
		List<Collection> list = collectionDAO.findByUserId(id);
		System.out.println("CollectionService findByUserId list:" + list);
		connection.close();
		return list;
	}

}
