package com.kkbank.business.service;

import java.util.List;

import com.kkbank.domain.Customer;

public interface ICustomerService {
	String addCustomer(String ID, String name);

	void delCustomer(String ID);

	void delCustomer(Customer customer);

	void updateCustomer(Customer customer);

	List<Customer> listCustomer();

	Customer getCustomer(String ID);

	Customer getCustomer(Customer customer);

	boolean checkCustomer(Customer customer);
	
	List<Customer> find(String ID);
}
