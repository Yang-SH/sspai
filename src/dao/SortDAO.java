package dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import entity.PageBean;
import entity.Sort;

public interface SortDAO {
	/**
	 * 分页查询分类
	 * 
	 * @return
	 */
	@Select("select * from sort limit #{start},#{pageSize}")
	List<Sort> findByPB(PageBean<Sort> page);

	/**
	 * 找到所有分类，展示给用户
	 * 
	 * @return
	 */
	@Select("select * from sort where stats != 0")
	List<Sort> findAllForUser();

	/**
	 * 根据id找到一个分类
	 * 
	 * @param id
	 * @return
	 */
	@Select("select * from sort where id = #{id}")
	Sort findById(int id);

	/**
	 * 查询分类数据长度
	 * 
	 * @return
	 */
	@Select("select count(*) from sort")
	int getSortCount();

	/**
	 * 更新分类
	 * 
	 * @return
	 */
	@Update("update sort set name=#{name},stats=#{stats} where id=#{id}")
	int updateSort(Sort sort);

	/**
	 * 添加一条分类
	 * 
	 * @param sort
	 * @return
	 */
	@Insert("insert into sort (name,stats) values(#{name},#{stats})")
	int insertSort(Sort sort);

	/**
	 * 对分类进行模糊查询
	 * 
	 * @return
	 */
	@Select("select * from sort where name like concat(concat('%',#{name}),'%')")
	List<Sort> findByName(String name);

	/**
	 * 根据菜单表中的id查出用作菜单的分类
	 * 
	 * @param ids
	 * @return
	 */
	List<Sort> getTags(List<Integer> ids);
}
