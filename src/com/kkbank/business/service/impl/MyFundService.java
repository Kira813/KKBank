package com.kkbank.business.service.impl;

import java.util.Date;
import java.util.List;

import com.kkbank.business.dao.IMyFundDao;
import com.kkbank.business.dao.impl.MyFundDao;
import com.kkbank.business.service.IMyFundService;
import com.kkbank.domain.MyFund;

public class MyFundService implements IMyFundService{
	IMyFundDao myFundDao = new MyFundDao();
	
	public MyFund get(int fund_id) { 
		return myFundDao.get(fund_id);
	}

	public int save(MyFund myFund) {
		return myFundDao.save(myFund);
	}

	public void update(MyFund myFund) {
		myFundDao.update(myFund);
	}

	public void delete(MyFund myFund) {
		myFundDao.delete(myFund);
	}

	public void delete(int fund_id) {
		myFundDao.delete(get(fund_id));
	}
	
	public List<MyFund> findAllMyFund() {
		return  myFundDao.findAllMyFund();
	}
	
	public List<MyFund> get(MyFund myFund) {
		return myFundDao.get(myFund);
	}
	
	public List<MyFund> findMyFund(String ID){
		return myFundDao.findMyFund(ID);
	}
	
	public boolean checkFundandAccount(String fCode, String ac_No){
		return myFundDao.checkFundandAccount(fCode, ac_No);
	}
	
	public MyFund findMyFund(String fCode, String ac_No){
		return myFundDao.findMyFund(fCode, ac_No);
	}
	
	/*public MyFund findNotConfirm(int status){
		return myFundDao.findNotConfirm(status);
	}*/
	
	public List<MyFund> findNotConfirm(int status){
		return myFundDao.findNotConfirm(status);
	}
	
	//getter & setter
	public IMyFundDao getMyFundDao() {
		return myFundDao;
	}

	public void setMyFundDao(IMyFundDao myFundDao) {
		this.myFundDao = myFundDao;
	}

	
}
