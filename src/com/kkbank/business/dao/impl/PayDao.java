package com.kkbank.business.dao.impl;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.kkbank.business.dao.IPayDao;
import com.kkbank.domain.Payment;

public class PayDao extends HibernateDaoSupport implements IPayDao{
	public Payment get(String bNo){ //加载paymentPersonal实例
		return getHibernateTemplate()
				.get(Payment.class, bNo);//标识属性符
	}
	
	public int save(Payment pp){
		return (int)getHibernateTemplate()
			.save(pp);
	}
		
	public void update(Payment pp){
		getHibernateTemplate().update(pp);
	}
	
	//删除paymentPersonal实例
	public void delete(Payment pp){
		getHibernateTemplate().delete(pp);
	}

	public List<Payment> findMyBill(){
		return (List<Payment>)getHibernateTemplate()
				.find("from Payment");
	}

	public List<Payment> findMyBill(Payment pp) {
		return this.getSession()
				.createQuery("from Payment p where p.bNo=? and p.status=?")
				.setParameter(0, pp.getbNo())
				.setParameter(1, pp.getStatus())
				.list();
	}
	
	public List<Payment> findMyBill(String ID, int status) {
		return this.getSession()
				.createQuery("from Payment p where p.ID=? and p.status=?")
				.setParameter(0, ID)
				.setParameter(1, status)
				.list();
	}
	
}
