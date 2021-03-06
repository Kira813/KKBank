package com.kkbank.business.dao.impl;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.kkbank.business.dao.IAccountDao;
import com.kkbank.domain.Account;
import com.kkbank.domain.Customer;

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
	public List<Account> get(Account account) {
		return this.getSession()
				.createQuery("from Account a where a.ac_No=?")
				.setParameter(0, account.getAc_No()) //A/a
				.list();
	}
	public List<Account> findAllAccount(String ID){
		return (List<Account>)getHibernateTemplate()
				.find("from Account ac where ac.ID = ?", ID);
	}
	//new
	public Account findAccountByID(String ID){
		List ac = getHibernateTemplate().find("from Account ac where ac.ID = ?",ID);
		if (ac.size() >= 1)
		{
			Account account = (Account)ac.get(0);
			return account;
	    }
		else
		{
			return null;
		}
	}

}
