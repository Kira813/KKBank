package com.kkbank.business.dao.impl;

import java.util.List;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import com.kkbank.business.dao.IAdminLoginDao;
import com.kkbank.domain.Admin;
import com.kkbank.domain.User;;

public class AdminLoginDao extends HibernateDaoSupport implements IAdminLoginDao{
	
	public Admin get(Integer adm_id){
		return getHibernateTemplate().get(Admin.class, adm_id);
	}
	
	public List<Admin> login(Admin admin) {
		return this.getSession()
				.createQuery("from Admin a where a.adm_id=? and a.psd=?")
				.setParameter(0, admin.getAdm_id())
				.setParameter(1, admin.getPsd())
				.list();
	}

}
