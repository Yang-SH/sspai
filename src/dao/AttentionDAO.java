package dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import entity.Attention_user;

public interface AttentionDAO {
	/**
	 * 根据userid查询关注的人
	 * 
	 * @param usreid
	 * @return
	 */
	@Select("select * from attention_user where user_id=#{user_id} and other_user_id=#{other_user_id}")
	public Attention_user findOtherByuserid(@Param("user_id")int user_id ,@Param("other_user_id")int other_user_id);
	
	@Insert("insert into attention_user (user_id,other_user_id) values(#{user_id},#{other_user_id})")
	public int insertAtt_User(Attention_user attention_user);
	
	@Delete("delete from attention_user where user_id=#{user_id} and other_user_id = #{other_user_id}")
	public int delAtt_User(Attention_user attention_user);
	
}
