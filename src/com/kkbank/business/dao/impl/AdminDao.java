package com.kkbank.business.dao.impl;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.kkbank.business.dao.IAdminDao;
import com.kkbank.domain.Admin;
import com.kkbank.domain.User;

public class AdminDao extends HibernateDaoSupport implements IAdminDao {

	public Admin get(String adm_id){ //加载admin实例
		return getHibernateTemplate()
				.get(Admin.class, adm_id);//标识属性符
	}
	public Integer save(Admin admin){
		return (Integer)getHibernateTemplate()
			.save(admin);
	}
		
	public void update(Admin admin){
		getHibernateTemplate().update(admin);
	}
	//删除admin实例
	public void delete(Admin admin){
		getHibernateTemplate().delete(admin);
	}
	//删除admin实例     需要删除的admin实例的标识属性符
	public void delete(String adm_id){
		getHibernateTemplate().delete(get(adm_id));
	}
	
	public List<Admin> findAllAdmin(){
		return (List<Admin>)getHibernateTemplate()
				.find("from Admin");
	}

	public List<Admin> get(Admin admin) {
		return this.getSession()
				.createQuery("from Admin a where a.adm_id=? and a.psd=?")
				.setParameter(0, admin.getAdm_id())
				.setParameter(1, admin.getPsd())
				.list();
	}
	
	public boolean login(String adm_id, String psd){
		String[] adminlist = new String[2];
		adminlist[0] = adm_id;
		adminlist[1] = psd;
		
		List adminList = this.getHibernateTemplate().find("from Admin a where a.adm_id=? and a.psd=?", adminlist);
		if(adminList.size() == 1){
			return true;
		}
		return false;
	}

}
