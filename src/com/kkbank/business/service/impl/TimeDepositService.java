package com.kkbank.business.service.impl;

import java.util.Date;
import java.util.List;

import com.kkbank.business.dao.ITimeDepositDao;
import com.kkbank.business.dao.impl.TimeDepositDao;
import com.kkbank.business.service.ITimeDepositService;
import com.kkbank.domain.Account;
import com.kkbank.domain.TimeDeposit;

public class TimeDepositService implements ITimeDepositService{
	ITimeDepositDao timeDepositDao = new TimeDepositDao();
	public int addTimeDeposit(String type, int term, double amount,
			double interestRate, Date depositDate,Date mDate, Account account){
		TimeDeposit timeDeposit = new TimeDeposit();
		timeDeposit.setType(type);
		timeDeposit.setTerm(term);
		timeDeposit.setAmount(amount);
		timeDeposit.setInterestRate(interestRate);
		timeDeposit.setDepositDate(depositDate);
		timeDeposit.setmDate(mDate);
		timeDeposit.setAccount(account);
		return timeDepositDao.save(timeDeposit);
	}
	public void delTimeDeposit(int id) {
		timeDepositDao.delete(id);

	}

	public void delTimeDeposit(TimeDeposit timeDeposit) {
		timeDepositDao.delete(timeDeposit);

	}

	public void updateTimeDeposit(TimeDeposit timeDeposit) {
		timeDepositDao.update(timeDeposit);

	}

	public List<TimeDeposit> listTimeDeposit() {
		return timeDepositDao.findAllTimeDeposit();
	}

	public TimeDeposit getTimeDeposit(int id) {
		return timeDepositDao.get(id);
	}

	public ITimeDepositDao getTimeDepositDao() {
		return timeDepositDao;
	}

	public void setTimeDepositDao(ITimeDepositDao timeDepositDao) {
		this.timeDepositDao = timeDepositDao;
	}
	
	public boolean checkTimeDeposit(TimeDeposit timeDeposit) {
		if(timeDepositDao.get(timeDeposit).size()>0){
			return true;
		}
		return false;
	}
	public List<TimeDeposit> listTimeDeposit(Account account) {
		return timeDepositDao.findAllTimeDeposit(account);
	}


}
