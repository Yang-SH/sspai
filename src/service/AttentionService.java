package service;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.session.SqlSession;

import dao.AttentionDAO;

import entity.Attention_user;
import entity.User;
import util.MyBatisUtil;

public class AttentionService {
	// 功能操作的实例也就是UserService的实例
	private static AttentionService instence;

	// USRE的数据库的操作类
	private AttentionDAO attentionDAO;

	// 私有化构造，不让调用
	private AttentionService() {
	};

	/**
	 * 通过这个方法获取UserService的实例，就是单例模式
	 * 
	 * @return
	 */
	public static AttentionService getInstence() {
		if (instence == null) {
			instence = new AttentionService();
		}
		return instence;
	}

	public Attention_user findOtherByuserid(int user_id, int other_user_id) {
		SqlSession sqlSession = MyBatisUtil.getSession();
		attentionDAO = sqlSession.getMapper(AttentionDAO.class);
		Attention_user findOtherByuserid = attentionDAO.findOtherByuserid(user_id, other_user_id);

		sqlSession.close();
		return findOtherByuserid;

	}

	/**
	 * 添加一个关注
	 * 
	 * @param attention_user
	 * @return
	 */
	public boolean insertAtt_User(Attention_user attention_user) {
		SqlSession sqlSession = MyBatisUtil.getSession();
		attentionDAO = sqlSession.getMapper(AttentionDAO.class);

		int insert = attentionDAO.insertAtt_User(attention_user);

		sqlSession.commit();
		sqlSession.close();

		if (insert > 0) {
			return true;
		} else {
			return false;
		}

	}

	/**
	 * 删除一个关注
	 * 
	 * @param attention_user
	 * @return
	 */
	public boolean delAtt_User(Attention_user attention_user) {
		SqlSession sqlSession = MyBatisUtil.getSession();
		attentionDAO = sqlSession.getMapper(AttentionDAO.class);

		int del = attentionDAO.delAtt_User(attention_user);

		sqlSession.commit();
		sqlSession.close();

		if (del > 0) {
			return true;
		} else {
			return false;
		}
	}
}
