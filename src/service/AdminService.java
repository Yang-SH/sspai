package service;

import dao.AdminDAO;
import entity.Admin;
import util.MyBatisUtil;

public class AdminService {

	private static AdminService instence;

	private AdminDAO adminDAO;

	private AdminService() {
	};

	public static AdminService getInstence() {
		if (instence == null) {
			instence = new AdminService();
		}
		return instence;
	}

	/**
	 * 进行登录的方法
	 * 
	 * @param admin
	 * @return
	 */
	public Admin login(Admin admin) {
		adminDAO = MyBatisUtil.getSession().getMapper(AdminDAO.class);
		return adminDAO.findAdmin(admin);
	}

}
