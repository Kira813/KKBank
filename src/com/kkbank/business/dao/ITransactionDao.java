package com.kkbank.business.dao;

import java.util.List;

import com.kkbank.domain.Account;
import com.kkbank.domain.Transaction;

public interface ITransactionDao {
	Transaction get(int t_id);
	
	List<Transaction> get(Transaction transaction);
	
	int save(Transaction transaction);
	
	void update(Transaction transaction);
	
	void delete(Transaction transaction);
	
	void delete(int t_id);
	
	List<Transaction> findAllTransaction();
	
	List<Transaction> findAllTransaction(Account account);
}
