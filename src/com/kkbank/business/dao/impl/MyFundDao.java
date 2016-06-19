package com.kkbank.business.dao.impl;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.kkbank.business.dao.IMyFundDao;
import com.kkbank.domain.MyFund;

public class MyFundDao extends HibernateDaoSupport implements IMyFundDao{
	public MyFund get(int fund_id) { 
		return getHibernateTemplate().get(MyFund.class, fund_id);
	}

	public int save(MyFund myFund) {
		return (int) getHibernateTemplate().save(myFund);
	}

	public void update(MyFund myFund) {
		getHibernateTemplate().update(myFund);
	}

	public void delete(MyFund myFund) {
		getHibernateTemplate().delete(myFund);
	}

	public void delete(int fund_id) {
		getHibernateTemplate().delete(get(fund_id));
	}
	
	public List<MyFund> findAllMyFund() {
		return (List<MyFund>) getHibernateTemplate().find("from myFund");
	}
	
	public List<MyFund> get(MyFund myFund) {
		return this.getSession()
				.createQuery("from myFund mf where mf=?")
				.setParameter(0, myFund.getFund_id())
				.list();
	}

	public boolean checkFundandAccount(String fCode, String ac_No){
		List mylist = getHibernateTemplate().find("from MyFund mf where mf.fCode=? and mf.ac_No=?", fCode, ac_No);
		if(mylist.size()>=1){
			return true;
		}
		else{
			return false;
		}
	}
	
	public MyFund findMyFund(String fCode, String ac_No){
		List mylist = getHibernateTemplate().find("from MyFund mf where mf.fCode=? and mf.ac_No=?", fCode, ac_No);
		if(mylist.size()>=1){
			MyFund myFund = (MyFund)mylist.get(0);
			return myFund;
		}
		else{
			return null;
		}
	}
	
	public List<MyFund> findMyFund(String ID){
		return this.getSession()
				.createQuery("from MyFund mf where mf.ID=?")
				.setParameter(0, ID)
				.list();
	}
	
	/*public MyFund findNotConfirm(int status){
		List<MyFund> mylist = getHibernateTemplate().find("from MyFund mf where mf.status=?", status);
		System.out.println(mylist);
		if(mylist.size() >= 1){
			MyFund myFund = (MyFund)mylist.get(0);
			return myFund;
		}
		else{
			return null;
		}
	}*/
	
	public List<MyFund> findNotConfirm(int status){
		return this.getSession()
				.createQuery("from MyFund mf where mf.status=?")
				.setParameter(0, status)
				.list();
	}
	
}