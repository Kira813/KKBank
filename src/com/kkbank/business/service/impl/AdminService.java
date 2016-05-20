package com.kkbank.business.service.impl;

import com.kkbank.business.dao.IAccountDao;
import com.kkbank.business.dao.IAdminDao;
import com.kkbank.business.dao.impl.AdminDao;
import com.kkbank.business.service.IAdminService;
import com.kkbank.domain.Admin;
import com.kkbank.domain.User;

public class AdminService implements IAdminService{
	IAdminDao adminDao = new AdminDao();
	
	/*public Admin login(String ad_id, String psd) {
		Admin admin = new Admin();
		admin.setAdm_id(ad_id);
		admin.setPsd(psd);
		
		return (Admin) adminLoginDao.login(admin);
	}*/
	
	public boolean login(String ad_id, String psd) {
		return adminDao.login(ad_id, psd);
	}
	
	public IAdminDao getAdminDao() {
		return adminDao;
	}

	public void setAdminDao(IAdminDao adminDao) {
		this.adminDao = adminDao;
	}

}
