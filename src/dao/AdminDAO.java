package dao;

import org.apache.ibatis.annotations.Select;

import entity.Admin;
import entity.User;

public interface AdminDAO {

	/**
	 * 通过账号和密码查找用户
	 * 
	 * @param user
	 * @return
	 */
	@Select("select * from admin where account=#{account} and password=#{password}")
	public Admin findAdmin(Admin admin);

}
