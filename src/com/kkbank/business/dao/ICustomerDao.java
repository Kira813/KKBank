package com.kkbank.business.dao;

import java.util.List;

import com.kkbank.domain.Customer;

public interface ICustomerDao {
	Customer get(String ID);
	
	List<Customer> get(Customer customer);
	
	String save(Customer customer);
	
	void update(Customer customer);
	
	void delete(Customer customer);
	
	void delete(String ID);
	
	List<Customer> findAllCustomer();
	
	List<Customer> find(String ID);
	
	boolean isValidAccount(String ID, String name);
}
