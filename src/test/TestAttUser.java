package test;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import dao.AttentionDAO;
import entity.Attention_user;
import util.MyBatisUtil;

public class TestAttUser {
	
	public static void main(String[] args) {
		
		SqlSession sqlSession = MyBatisUtil.getSession();
		AttentionDAO attentionDAO = sqlSession.getMapper(AttentionDAO.class);
		Attention_user findOtherByuserid  = attentionDAO.findOtherByuserid(1, 1);
		System.out.println(findOtherByuserid);
		
		
		sqlSession.close();
	}
	
}
