package com.kkbank.business.dao.impl;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.kkbank.business.dao.IAccountDao;
import com.kkbank.domain.Account;

public class AccountDao extends HibernateDaoSupport implements IAccountDao {
	public Account get(String ac_No) { // 加载Account实例
		return getHibernateTemplate().get(Account.class, ac_No);// 标识属性符
	}

	public String save(Account account) {
		return (String) getHibernateTemplate().save(account);
	}

	public void update(Account account) {
		getHibernateTemplate().update(account);
	}

	// 删除Account实例
	public void delete(Account account) {
		getHibernateTemplate().delete(account);
	}

	// 删除Account实例 需要删除的Account实例的标识属性符
	public void delete(String ac_No) {
		getHibernateTemplate().delete(get(ac_No));
	}

	public List<Account> findAllAccount() {
		return (List<Account>) getHibernateTemplate().find("from Account");
	}

}
