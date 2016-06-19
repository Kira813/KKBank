package com.kkbank.business.service.impl;

import java.util.List;

import com.kkbank.business.dao.IFundDao;
import com.kkbank.business.dao.impl.FundDao;
import com.kkbank.business.service.IFundService;
import com.kkbank.domain.Fund;

public class FundService implements IFundService{
	IFundDao fundDao = new FundDao();
	
	public Fund get(String fCode) { 
		return fundDao.get(fCode);
	}
	
	public String save(Fund fund) {
		System.out.println("service can access");
		return fundDao.save(fund);
	}

	public void update(Fund fund) {
		fundDao.update(fund);
	}

	public void delete(Fund fund) {
		fundDao.delete(fund);
	}
	
	public void delete(String fCode) {
		fundDao.delete(fCode);
	}

	public List<Fund> findAllFund() {
		return fundDao.findAllFund();
	}
	
	public List<Fund> get(Fund fund) {
		return fundDao.get(fund);
	}
	
	public List<Fund> findFundDetail(String fCode){
		return fundDao.findFundDeatil(fCode);
	}

	public Fund findFundByCode(String fCode){
		return fundDao.findFundByCode(fCode);
	}
	
	
	
	//getter & setter
	public IFundDao getFundDao() {
		return fundDao;
	}

	public void setFundDao(IFundDao fundDao) {
		this.fundDao = fundDao;
	}
	
}
