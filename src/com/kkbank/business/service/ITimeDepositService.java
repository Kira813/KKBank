package com.kkbank.business.service;

import java.util.Date;
import java.util.List;

import com.kkbank.business.dao.ITimeDepositDao;
import com.kkbank.domain.Account;
import com.kkbank.domain.TimeDeposit;

public interface ITimeDepositService {
	public int addTimeDeposit(int id,String type, int term, double amount,String interestRate, Date depositDate, Account account);

	public void delTimeDeposit(int id);

	public void delTimeDeposit(TimeDeposit timeDeposit);

	public void updateTimeDeposit(TimeDeposit timeDeposit);

	public List<TimeDeposit> listTimeDeposit() ;
	
	public TimeDeposit getTimeDeposit(int id);
	
	public ITimeDepositDao getTimeDepositDao();

	public void setTimeDepositDao(ITimeDepositDao timeDepositDao);
	
	public boolean checkTimeDeposit(TimeDeposit timeDeposit);
	
	public List<TimeDeposit> listTimeDeposit(Account account);

}
