package dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import entity.Collection;

public interface CollectionDAO {
	//根据用户id插入收藏文章id
	@Insert("insert into collection (user_id,article_id) values (#{user_id},#{article_id})")
	public int insertCollection(int user_id,int articleid);
	
	@Select("select * from collection where user_id = #{id}")
	public List<Collection> findByUserId(int id);
	
}
