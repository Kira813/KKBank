package com.kkbank.business.service.impl;

import java.util.Date;
import java.util.List;

import com.kkbank.business.dao.ITransactionDao;
import com.kkbank.business.dao.impl.TransactionDao;
import com.kkbank.business.service.ITransactionService;
import com.kkbank.domain.Account;
import com.kkbank.domain.Transaction;

public class TransactionService implements ITransactionService{
	ITransactionDao transactionDao = new TransactionDao();
	
	public int addTransaction(int t_id,Date date,String type,double amount,double tBalance,Account account) {
		Transaction transaction = new Transaction();
		transaction.setT_id(t_id);
		transaction.setDate(date);
		transaction.setType(type);
		transaction.setAmount(amount);
		transaction.settBalance(tBalance);
		transaction.setAccount(account);
	
		return transactionDao.save(transaction);
	}

	public void delTransaction(int t_id) {
		transactionDao.delete(t_id);

	}

	public void delTransaction(Transaction transaction) {
		transactionDao.delete(transaction);

	}

	public void updateTransaction(Transaction transaction) {
		transactionDao.update(transaction);

	}

	public List<Transaction> listTransaction() {
		return transactionDao.findAllTransaction();
	}

	public Transaction getTransaction(int t_id) {
		return transactionDao.get(t_id);
	}

	public ITransactionDao getTransactionDao() {
		return transactionDao;
	}

	public void setTransactionDao(ITransactionDao transactionDao) {
		this.transactionDao = transactionDao;
	}
	
	public boolean checkTransaction(Transaction transaction) {
		if(transactionDao.get(transaction).size()>0){
			return true;
		}
		return false;
	}
	public List<Transaction> listTransaction(Account account) {
		return transactionDao.findAllTransaction(account);
	}



}
