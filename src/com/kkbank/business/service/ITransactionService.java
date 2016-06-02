package com.kkbank.business.service;

import java.util.Date;
import java.util.List;

import com.kkbank.business.dao.ITransactionDao;
import com.kkbank.domain.Account;
import com.kkbank.domain.Transaction;

public interface ITransactionService {
	
	public int addTransaction(int t_id,Date date,String type,double amount,double tBalance,Account account);


	public void delTransaction(int t_id);

	public void delTransaction(Transaction transaction);

	public void updateTransaction(Transaction transaction);

	public List<Transaction> listTransaction() ;
	
	public Transaction getTransaction(int t_id);
	
	public ITransactionDao getTransactionDao();

	public void setTransactionDao(ITransactionDao transactionDao);
	
	public boolean checkTransaction(Transaction transaction);
	
	public List<Transaction> listTransaction(Account account);

}
