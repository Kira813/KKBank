package com.kkbank.business.service.impl;

import java.util.List;

import com.kkbank.business.dao.ICustomerDao;
import com.kkbank.business.dao.impl.CustomerDao;
import com.kkbank.business.service.ICustomerService;
import com.kkbank.domain.Customer;

public class CustomerService implements ICustomerService{

	ICustomerDao customerDao = new CustomerDao();


	public String addCustomer(String ID, String name) {
		Customer customer = new Customer();
		customer.setID(ID);
		customer.setName(name);
		return customerDao.save(customer);
	}

	
	public void delCustomer(String ID) {
		customerDao.delete(ID);
		
	}

	
	public void delCustomer(Customer customer) {
		customerDao.delete(customer);
		
	}


	public void updateCustomer(Customer customer) {
		customerDao.update(customer);
		
	}


	public List<Customer> listCustomer() {
		return customerDao.findAllCustomer();
	}


	public Customer getCustomer(String ID) {
		return customerDao.get(ID);
	}


	public Customer getCustomer(Customer customer) {
		return customerDao.get(customer).get(0);
	}

	
	public boolean checkCustomer(Customer customer) {
		if(customerDao.get(customer).size()>0){
			return true;
		}
		return false;
	}

	public ICustomerDao getCustomerDao() {
		return customerDao;
	}

	public void setCustomerDao(ICustomerDao customerDao) {
		this.customerDao = customerDao;
	}

	public List<Customer> find(String ID){
		return customerDao.find(ID);
	}


	
}
