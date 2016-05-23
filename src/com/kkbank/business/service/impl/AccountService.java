package com.kkbank.business.service.impl;

import java.util.Date;
import java.util.List;

import com.kkbank.business.dao.IAccountDao;
import com.kkbank.business.dao.impl.AccountDao;
import com.kkbank.business.service.IAccountService;
import com.kkbank.domain.Account;
import com.kkbank.domain.Customer;

public class AccountService implements IAccountService {

	IAccountDao accountDao = new AccountDao();

	// ac_No是主键，在这里通过时间戳和随机数生成
	public String addAccount(String ID, String password,
			double balance, int status, Customer customer) {
		Account account = new Account();
		account.setID(ID);
		account.setPassword(password);
		account.setBalance(balance);
		account.setStatus(status);
		account.setCustomer(customer);
		
		String timestamp = new Date().getTime() + "";
		String random = (int)Math.floor(Math.random() * 10000) + ""; //对一个数进行下取整
		String ac_No = "621785700000"+timestamp.substring(7,10)+random;
		account.setAc_No(ac_No);
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
	
	public boolean checkAccount(Account account) {
		if(accountDao.get(account).size()>0){
			return true;
		}
		return false;
	}
	public List<Account> listAccount(String ID) {
		return accountDao.findAllAccount(ID);
	}

}
