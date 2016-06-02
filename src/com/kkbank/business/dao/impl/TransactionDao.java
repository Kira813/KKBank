package com.kkbank.business.dao.impl;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.kkbank.business.dao.ITransactionDao;
import com.kkbank.domain.Account;
import com.kkbank.domain.Transaction;


public class TransactionDao extends HibernateDaoSupport implements ITransactionDao {
	public Transaction get(int t_id) { // 加载Transaction实例
		return getHibernateTemplate().get(Transaction.class, t_id);// 标识属性符
	}

	public int save(Transaction transaction) {
		return (int) getHibernateTemplate().save(transaction);
	}

	public void update(Transaction transaction) {
		getHibernateTemplate().update(transaction);
	}

	// 删除Transaction实例
	public void delete(Transaction transaction) {
		getHibernateTemplate().delete(transaction);
	}

	// 删除Transaction实例 需要删除的Transaction实例的标识属性符
	public void delete(int t_id) {
		getHibernateTemplate().delete(get(t_id));
	}

	public List<Transaction> findAllTransaction() {
		return (List<Transaction>) getHibernateTemplate().find("from transaction");
	}
	public List<Transaction> get(Transaction transaction) {
		return this.getSession()
				.createQuery("from transaction a where a.t_id=?")
				.setParameter(0, transaction.getT_id())
				.list();
	}
	public List<Transaction> findAllTransaction(Account account){
		return (List<Transaction>)getHibernateTemplate()
				.find("from transaction t where t.account = ?", account);
	}
}
