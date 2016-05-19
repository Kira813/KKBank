package com.kkbank.business.dao;

import java.util.List;

import com.kkbank.domain.Account;
import com.kkbank.domain.Customer;

public interface IAccountDao {
	Account get(String ac_No);
	
	List<Account> get(Account account);
	
	String save(Account account);
	
	void update(Account account);
	
	void delete(Account account);
	
	void delete(String ac_No);
	
	List<Account> findAllAccount();
}
