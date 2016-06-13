package com.kkbank.business.dao;

import java.util.List;

import com.kkbank.domain.Account;
import com.kkbank.domain.TimeDeposit;

public interface ITimeDepositDao  {
	TimeDeposit get(int id);
	
	List<TimeDeposit> get(TimeDeposit timeDeposit);
	
	int save(TimeDeposit timeDeposit);
	
	void update(TimeDeposit timeDeposit);
	
	void delete(TimeDeposit timeDeposit);
	
	void delete(int id);
	
	List<TimeDeposit> findAllTimeDeposit();
	
	List<TimeDeposit> findAllTimeDeposit(Account account);
}
