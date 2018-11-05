package service;

import java.util.Iterator;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import dao.ArticleDAO;
import dao.UserDAO;
import entity.Article;
import entity.PageBean;
import entity.User;
import util.MyBatisUtil;

public class UserService {
	// 功能操作的实例也就是UserService的实例
	private static UserService instence;

	// USRE的数据库的操作类
	private UserDAO userDAO;

	// 私有化构造，不让调用
	private UserService() {
	};

	/**
	 * 通过这个方法获取UserService的实例，就是单例模式
	 * 
	 * @return
	 */
	public static UserService getInstence() {
		if (instence == null) {
			instence = new UserService();
		}
		return instence;
	}

	/**
	 * 查找所有
	 * 
	 * @return
	 */

	public List<User> findAll() {
		SqlSession connection = MyBatisUtil.getSession();
		userDAO = connection.getMapper(UserDAO.class);
		List<User> list = userDAO.findAll();
		connection.close();
		return list;
	}

	/*
	 * 登录功能
	 */
	public User findUser(User user) {
		SqlSession connection = MyBatisUtil.getSession();
		userDAO = connection.getMapper(UserDAO.class);
		User user2 = userDAO.findUser(user);
		connection.close();
		return user2;
	}

	/*
	 * 注册功能
	 */
	public int insertUser(User user) {
		SqlSession connection = MyBatisUtil.getSession();
		int result = 0;
		userDAO = connection.getMapper(UserDAO.class);
		result = userDAO.insertUser(user);
		connection.commit();
		connection.close();
		return result;
	}

	/**
	 * 根据用户id查询用户
	 * 
	 * @param userid
	 * @return
	 */
	public User findUserById(int userid) {
		SqlSession connection = MyBatisUtil.getSession();
		userDAO = connection.getMapper(UserDAO.class);
		User user = userDAO.findUserById(userid);
		connection.close();
		return user;
	}

	/**
	 * 根据用户id查询用户关注的用户
	 * 
	 * @param id
	 * @return
	 */
	public List<User> findAttUserById(int id) {
		SqlSession connection = MyBatisUtil.getSession();
		userDAO = connection.getMapper(UserDAO.class);
		List<User> list = userDAO.findAttUserById(id);
		connection.close();
		return list;
	}

	/*
	 * 修改资料的个人信息提交功能
	 */
	public int updateInformationById(User user) {
		SqlSession connection = MyBatisUtil.getSession();
		int result = 0;
		userDAO = connection.getMapper(UserDAO.class);
		result = userDAO.updateInformationById(user);
		connection.commit();
		connection.close();
		return result;
	}

	/*
	 * 根据id删除数据
	 */
	public int deleteUserById(int id) {
		SqlSession connection = MyBatisUtil.getSession();
		int result = 0;
		userDAO = connection.getMapper(UserDAO.class);
		result = userDAO.deleteUserById(id);
		connection.commit();
		connection.close();
		return result;
	}

	/*
	 * 修改密码功能
	 */
	public int updateUserPassword(User user) {
		SqlSession connection = MyBatisUtil.getSession();
		int result = 0;
		userDAO = connection.getMapper(UserDAO.class);
		result = userDAO.updateUserPassword(user);
		connection.commit();
		connection.close();
		return result;
	}


	/*
	 * 根据id用户查询关注的别的用户
	 */
	public List<User> findUserAttentionById(User u) {
		SqlSession connection = MyBatisUtil.getSession();
		UserDAO userDAO = connection.getMapper(UserDAO.class);
		List<User> list = userDAO.findUserAttentionById(u.getId());// 获取动态id(登陆者的id)
		ArticleDAO articleDAO = connection.getMapper(ArticleDAO.class);
		for (Iterator iterator = list.iterator(); iterator.hasNext();) {
			User user = (User) iterator.next();
			List<Article> findArticleByUserId = articleDAO.findArticleByUserId(user.getId());
			user.setMyArticles(findArticleByUserId);
			user.setMyArticleNum(findArticleByUserId.size());
		}
		
		//System.out.println(" --------------------------------- findUserAttentionById list:"+list+" ------------------------------");
		
		connection.close();
		return list;
	}

	/*
	 * 根据id用户查询被关注数
	 */
	public List<User> findUserBeAttentionById(User u) {
		SqlSession connection = MyBatisUtil.getSession();
		UserDAO userDAO = connection.getMapper(UserDAO.class);
		List<User> list = userDAO.findUserBeAttentionById(u.getId());// 获取动态id(登陆者的id)
		ArticleDAO articleDAO = connection.getMapper(ArticleDAO.class);
		for (Iterator iterator = list.iterator(); iterator.hasNext();) {
			User user = (User) iterator.next();
			List<Article> findArticleByUserId = articleDAO.findArticleByUserId(user.getId());
			user.setMyArticles(findArticleByUserId);
			user.setMyArticleNum(findArticleByUserId.size());
		}
		connection.close();
		return list;
	}

	/*
	 * 根据
	 */
	/**
	 * 获取用户数量
	 * 
	 * @return
	 */
	public long getUserCount() {
		SqlSession connection = MyBatisUtil.getSession();
		userDAO = connection.getMapper(UserDAO.class);
		long userCount = userDAO.getUserCount();
		connection.close();
		return userCount;
	}

	/**
	 * 分页查询
	 * 
	 * @param page
	 * @return
	 */
	public PageBean<User> findUserByPageBean(PageBean<User> page) {
		page.setTotalCount(getUserCount());// 设置数据总量
		SqlSession sqlSession = MyBatisUtil.getSession();
		userDAO = sqlSession.getMapper(UserDAO.class);
		// 总页数
		int totalPage = (int) ((page.getTotalCount() + page.getPageSize() - 1) / page.getPageSize());
		page.setTotalPage(totalPage);
		int start = (page.getPageNum() - 1) * page.getPageSize();// 从哪开始
		page.setStart(start);// 从哪开始拿数据
		// int size = page.getPageSize();// 获取几条数据
		List<User> list = userDAO.findUserByPageBean(page);
		//System.out.println("findUserByPageBean list: " + list);
		page.setList(list);
		sqlSession.close();// 关闭
		return page;
	}

	/**
	 * 对用户进行模糊查询
	 * 
	 * @param name
	 * @return
	 */
	public List<User> findByName(String name) {
		SqlSession sqlSession = MyBatisUtil.getSession();
		userDAO = sqlSession.getMapper(UserDAO.class);
		List<User> list = userDAO.findByName(name);
		sqlSession.close();// 关闭
		return list;
	}

}
