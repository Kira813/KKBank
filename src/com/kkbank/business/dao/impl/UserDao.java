package com.kkbank.business.dao.impl;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.kkbank.business.dao.IUserDao;
import com.kkbank.domain.User;


public class UserDao extends HibernateDaoSupport implements IUserDao{

	public User get(String id){
		return getHibernateTemplate().get(User.class, id);
	}
	
	public List<User> get(User user) {
		return this.getSession()
				.createQuery("from User u where u.name=? and u.pwd=?")
				.setParameter(0, user.getName())
				.setParameter(1, user.getPwd())
				.list();
	}

	public String save(User user){
		return (String)getHibernateTemplate()
			.save(user);
	}
	
	public void update(User user){
		getHibernateTemplate().update(user);
	}
	
	public void delete(User user){
		getHibernateTemplate().delete(user);
	}
	
	public void delete(String id){
		getHibernateTemplate().delete(get(id));
	}
	
	public List<User> findAll(){
		return (List<User>)getHibernateTemplate()
				.find("from User");
	}

}
