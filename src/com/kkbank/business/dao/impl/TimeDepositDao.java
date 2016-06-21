package com.kkbank.business.dao.impl;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.kkbank.business.dao.ITimeDepositDao;
import com.kkbank.domain.Account;
import com.kkbank.domain.TimeDeposit;

public class TimeDepositDao extends HibernateDaoSupport implements ITimeDepositDao{
	public TimeDeposit get(int id) { // 加载TimeDeposit实例
		return getHibernateTemplate().get(TimeDeposit.class, id);// 标识属性符
	}

	public int save(TimeDeposit timeDeposit) {
		return (int) getHibernateTemplate().save(timeDeposit);
	}

	public void update(TimeDeposit timeDeposit) {
		getHibernateTemplate().update(timeDeposit);
	}

	// 删除TimeDeposit实例
	public void delete(TimeDeposit timeDeposit) {
		getHibernateTemplate().delete(timeDeposit);
	}

	// 删除TimeDeposit实例 需要删除的TimeDeposit实例的标识属性符
	public void delete(int id) {
		getHibernateTemplate().delete(get(id));
	}

	@SuppressWarnings("unchecked")
	public List<TimeDeposit> findAllTimeDeposit() {
		return (List<TimeDeposit>) getHibernateTemplate().find("from TimeDeposit");
	}
	public List<TimeDeposit> get(TimeDeposit timeDeposit) {
		return this.getSession()
				.createQuery("from TimeDeposit t where t.id=?")
				.setParameter(0, timeDeposit.getId())
				.list();
	}

	public List<TimeDeposit> findAllTimeDeposit(Account account){
		return this.getSession()
				.createQuery("from TimeDeposit a where a.account=?")
				.setParameter(0, account)
				.list();
	}
}
