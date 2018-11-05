package dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

/**
 * 菜单的dao
 * 
 * @author DouDou
 *
 */
public interface TagDAO {
	/**
	 * 查询所有
	 * 
	 * @return
	 */
	@Select("select * from tag ")
	public List<Integer> findAll();

	/**
	 * 插入一个菜单
	 * 
	 * @param id
	 * @return
	 */
	@Insert("insert into tag (sort_id) values(#{id})")
	public int insertTag(int id);

	/**
	 * 删除一个菜单
	 * 
	 * @param id
	 * @return
	 */
	@Delete("delete from tag where sort_id = #{id}")
	public int deleteTag(int id);

}
