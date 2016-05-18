package com.kkbank.business.dao.impl;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.kkbank.business.dao.ICustomerDao;
import com.kkbank.domain.Customer;

public class CustomerDao extends HibernateDaoSupport implements ICustomerDao{
	public Customer get(String ID){ //加载Customer实例
		return getHibernateTemplate()
			.get(Customer.class, ID);//标识属性符
	}
	//return刚刚保存的实例的标识属性值  ID是String类型
	public String save(Customer customer){
		return (String)getHibernateTemplate()
			.save(customer);
	}
		
	public void update(Customer customer){
		getHibernateTemplate().update(customer);
	}
	//删除Customer实例
	public void delete(Customer customer){
		getHibernateTemplate().delete(customer);
	}
	//删除Customer实例     需要删除的Customer实例的标识属性符
	public void delete(String ID){
		getHibernateTemplate().delete(get(ID));
	}
	
	public List<Customer> findAllCustomer(){
		return (List<Customer>)getHibernateTemplate()
				.find("from Customer");
	}

	public List<Customer> get(Customer Customer) {
		System.out.println(Customer.getName());
		return this.getSession()
				.createQuery("from Customer c where c.ID=? and c.name=?")
				.setParameter(0, Customer.getID())
				.setParameter(1, Customer.getName())
				.list();
	}

}
