package com.kkbank.business.service;

import java.util.List;

import com.kkbank.domain.Account;
import com.kkbank.domain.Customer;


public interface IAccountService {
	//ac_No是自动生成的
	String addAccount(String ID, String password, double balance,
			int status, Customer customer);

	void delAccount(String ac_No);

	void delAccount(Account account);

	void updateAccount(Account account);

	List<Account> listAccount();

	Account getAccount(String ac_No);
	
	boolean checkAccount(Account account);
	
	List<Account> listAccount(String ID);


}
