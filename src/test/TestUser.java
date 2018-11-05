package test;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import dao.UserDAO;
import entity.Topic;
import entity.User;
import util.MyBatisUtil;

public class TestUser {

	public static void main(String[] args) {
		SqlSession connection = MyBatisUtil.getSession();
		UserDAO userDao = connection.getMapper(UserDAO.class);
		 List<User> list=userDao.findUserBeAttentionById(1);
		 System.out.println(list);//打印出关注的用户
		 System.out.println(list.size());//打印出关注的用户的数量
//		System.out.println(userDao.findUserById(1));
//		 List<User> list = userDao.findAll();
//		 System.out.println(list);

		// User user = userDao.findUserById(1);
		// System.out.println(user);
		// int x=userDao.deleteUserById(21);

		// User user = new User();
		// user.setId(1);
		// user.setPassword("1234");
		// int updateUserPassword = userDao.updateUserPassword(user);
		// System.out.println(updateUserPassword);
		
//		for (int i = 0; i < 20; i++) {
//			User user = new User(i+"1234@qq", "测试用户"+i, "password"+i);
//			userDao.insertUser(user);
//		}

		connection.commit();
		connection.close();
	}

}
