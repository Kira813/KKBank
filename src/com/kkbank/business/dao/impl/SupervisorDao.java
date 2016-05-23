package com.kkbank.business.dao.impl;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.kkbank.business.dao.ISupervisorDao;
import com.kkbank.domain.Supervisor;

public class SupervisorDao extends HibernateDaoSupport implements ISupervisorDao{
	public Supervisor get(String auth_code){ //鍔犺浇Account瀹炰緥
		return getHibernateTemplate()
				.get(Supervisor.class, auth_code);//鏍囪瘑灞炴�绗�
	}
	public String save(Supervisor supervisor){
		return (String)getHibernateTemplate()
			.save(supervisor);
	}
		
	public void update(Supervisor supervisor){
		getHibernateTemplate().update(supervisor);
	}
	
	public void delete(Supervisor supervisor){
		getHibernateTemplate().delete(supervisor);
	}

	public void delete(String auth_code){
		getHibernateTemplate().delete(get(auth_code));
	}
	
	public List<Supervisor> findAllAuthCode(){
		return (List<Supervisor>)getHibernateTemplate()
				.find("from Supervisor");
	}
	
	public boolean isValid(String auth_code){
		
		List<String> au_list = this.getHibernateTemplate().find("from Supervisor s where s.auth_code = ?", auth_code);
		if(au_list.size() == 1) {
			return true;
		}
		return false;
	}
}
