package com.kkbank.business.service.impl;

import java.util.List;

import com.kkbank.business.dao.IAccountDao;
import com.kkbank.business.dao.impl.AccountDao;
import com.kkbank.business.service.IAccountService;
import com.kkbank.domain.Account;
import com.kkbank.domain.Customer;



public class AccountService implements IAccountService{
	
	IAccountDao accountDao = new AccountDao();
	//ac_No是主键
	public String addAccount(String ID, String ac_No, String password, double balance,
			int status, Customer customer) {
		Account account = new Account();
		account.setID(ID);
		account.setAc_No(ac_No);
		account.setPassword(password);
		account.setBalance(balance);
		account.setStatus(status);
		account.setCustomer(customer);
		return accountDao.save(account);
	}

	
	public void delAccount(String ac_No) {
		accountDao.delete(ac_No);
		
	}

	
	public void delAccount(Account account) {
		accountDao.delete(account);
		
	}


	public void updateAccount(Account account) {
		accountDao.update(account);
		
	}


	public List<Account> listAccount() {
		return accountDao.findAllAccount();
	}


	public Account getAccount(String ac_No) {
		return accountDao.get(ac_No);
	}


	public IAccountDao getAccountDao() {
		return accountDao;
	}

	public void setAccountDao(IAccountDao accountDao) {
		this.accountDao = accountDao;
	}


}
