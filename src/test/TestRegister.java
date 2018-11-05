package test;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import dao.UserDAO;
import entity.User;
import util.MyBatisUtil;

public class TestRegister {

	public static void main(String[] args) {
		SqlSession connection = MyBatisUtil.getSession();
		UserDAO userDao = connection.getMapper(UserDAO.class);
		User a=new User();
		a.setNickname("WO");
		a.setEmail("Hujunhui");
		a.setPassword("123456");
		 
		//int x=userDao.insertUser(a);
		System.out.println(a);

		connection.commit();
		connection.close();

	}

}
