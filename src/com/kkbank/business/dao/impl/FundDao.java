package com.kkbank.business.dao.impl;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.kkbank.business.dao.IFundDao;
import com.kkbank.domain.Fund;

public class FundDao extends HibernateDaoSupport implements IFundDao{
	public Fund get(String fCode) { 
		return getHibernateTemplate().get(Fund.class, fCode);
	}
	
	public String save(Fund fund) {
		System.out.println("dao can access");
		System.out.println(getHibernateTemplate().save(fund));
		return (String) getHibernateTemplate().save(fund);
	}

	public void update(Fund fund) {
		getHibernateTemplate().update(fund);
	}

	public void delete(Fund fund) {
		getHibernateTemplate().delete(fund);
	}
	
	public void delete(String fCode) {
		getHibernateTemplate().delete(get(fCode));
	}

	public List<Fund> findAllFund() {
		return (List<Fund>) getHibernateTemplate().find("from Fund");
	}
	
	public List<Fund> get(Fund fund) {
		return this.getSession()
				.createQuery("from Fund f where f.fCode=?")
				.setParameter(0, fund.getfCode())
				.list();
	}
	
	public List<Fund> findFundDeatil(String fCode) {
		return this.getSession()
				.createQuery("from Fund f where f.fCode=?")
				.setParameter(0, fCode)
				.list();
	}
	
	public Fund findFundByCode(String fCode){
		List mylist = getHibernateTemplate().find("from Fund f where f.fCode = ?",fCode);
		if (mylist.size() >= 1)
		{
			Fund fund = (Fund)mylist.get(0);
			return fund;
	    }
		else
		{
			return null;
		}
	}

}
