package dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import entity.PageBean;
import entity.User;

public interface UserDAO {
	/**
	 * 查找所有的用户
	 * 
	 * @return
	 */
	// @Select("select * from user")
	List<User> findAll();

	/**
	 * 根据id查找用户
	 * 
	 * @param id
	 * @return
	 */
	public User findUserById(int id);
	
	/*
	 * 登录功能需求数据
	 */
	@Select("select * from user Where email=#{email} and password=#{password} and stats !=0")
	public User findUser(User user);

	/*
	 * 注册功能插入数据
	 */
	@Insert("insert into user(email,nickname,password,stats,head_path) values (#{email},#{nickname},#{password},1,'/upload/face-2.jpg')")
	public int insertUser(User user);

	/*
	 * 修改资料的基本信息
	 */
	@Update("update user set head_path=#{head_path},nickname=#{nickname},good_at=#{good_at},introduce=#{introduce} where id=#{id}")
	public int updateInformationById(User user);

	/**
	 * 更新用户的密码
	 * 
	 * @param user
	 * @return
	 */
	@Update("update user set password = #{password} where id=#{id}")
	public int updateUserPassword(User user);

	/**
	 * 根据用户id查询用户关注的用户
	 * 
	 * @return
	 */
	public List<User> findAttUserById(int id);

	/*
	 * 根据id删除数据
	 */
	@Update("update user set stats=0 where id=#{id}")
	public int deleteUserById(int id);

	/*
	 * 根据id用户查询关注别人
	 */
	public List<User> findUserAttentionById(int id);

	/*
	 * 根据id用户查询被关注数据
	 */
	public List<User> findUserBeAttentionById(int id);

	/**
	 * 分页查询用户
	 * 
	 * @param pageBean
	 * @return
	 */
	public List<User> findUserByPageBean(PageBean<User> pageBean);

	/**
	 * 获取用户数量
	 * 
	 * @return
	 */
	@Select("select count(*) from user")
	public long getUserCount();

	/**
	 * 通过名称模糊查询用户
	 * 
	 * @return
	 */
	public List<User> findByName(String name);
	
		
	

}
