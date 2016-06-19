package com.kkbank.business.service;

import java.util.List;

import com.kkbank.domain.Payment;

public interface IPayService {
	Payment get(String bNo);

	int save(Payment pp);

	void update(Payment pp);

	void delete(Payment pp);
	
	List<Payment> findMyBill();
	
	List<Payment> findMyBill(Payment pp);

	List<Payment> findMyBill(String ID, int status);
}
