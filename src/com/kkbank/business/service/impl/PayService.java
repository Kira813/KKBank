package com.kkbank.business.service.impl;

import java.util.Date;
import java.util.List;

import com.kkbank.business.dao.IPayDao;
import com.kkbank.business.dao.impl.PayDao;
import com.kkbank.business.service.IPayService;
import com.kkbank.domain.Payment;

public class PayService implements IPayService{
	IPayDao payDao = new PayDao();

	public Payment get(String bNo) { 
		return payDao.get(bNo);
	}

	public int save(Payment pp) {
		return payDao.save(pp);
	}

	public void update(Payment pp) {
		payDao.update(pp);
	}

	public void delete(Payment pp) {
		payDao.delete(pp);
	}
	
	public List<Payment> findMyBill() {
		return  payDao.findMyBill();
	}
	
	public List<Payment> findMyBill(Payment pp) {
		return payDao.findMyBill(pp);
	}
	
	public List<Payment> findMyBill(String ID, int status){
		return payDao.findMyBill(ID, status);
	}
	
	
	public IPayDao getPayDao() {
		return payDao;
	}

	public void setPayDao(IPayDao payDao) {
		this.payDao = payDao;
	}
}
