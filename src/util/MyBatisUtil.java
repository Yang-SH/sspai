package util;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.IOException;

public class MyBatisUtil {

	private static SqlSessionFactory factory;

	static {
		try {
			factory = new SqlSessionFactoryBuilder().build(Resources
					.getResourceAsReader("config/configuration.xml"));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public static SqlSession getSession() {
		return factory.openSession();
	}

}
