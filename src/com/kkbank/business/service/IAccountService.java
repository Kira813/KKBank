package com.kkbank.business.service;

import java.util.List;
import java.util.Set;

import com.kkbank.domain.Account;
import com.kkbank.domain.Customer;
import com.kkbank.domain.Transaction;


public interface IAccountService {
	//ac_No是自动生成的
	String addAccount(String ID, String password, double balance,
			int status, Customer customer,Set<Transaction> transactions);

	void delAccount(String ac_No);

	void delAccount(Account account);

	void updateAccount(Account account);

	List<Account> listAccount();

	Account getAccount(String ac_No);
	
	boolean checkAccount(Account account);
	
	List<Account> listAccount(String ID);
	//new
	Account findAccount(String ID);

}
