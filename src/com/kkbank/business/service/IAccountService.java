package com.kkbank.business.service;

import java.util.List;

import com.kkbank.domain.Account;
import com.kkbank.domain.Customer;


public interface IAccountService {
	String addAccount(String ID, String ac_No, String password, double balance,
			int status, Customer customer);

	void delAccount(String ac_No);

	void delAccount(Account account);

	void updateAccount(Account account);

	List<Account> listAccount();

	Account getAccount(String ac_No);


}
