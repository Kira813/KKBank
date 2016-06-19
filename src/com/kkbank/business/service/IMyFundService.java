package com.kkbank.business.service;

import java.util.Date;
import java.util.List;

import com.kkbank.domain.MyFund;

public interface IMyFundService {
	
	MyFund get(int fund_id);

	int save(MyFund myFund);

	void update(MyFund myFund);

	void delete(MyFund myFund);
	
	void delete(int fund_id);
	
	List<MyFund> findAllMyFund();
	
	List<MyFund> get(MyFund myFund);
	
	List<MyFund> findMyFund(String ID);
	
	boolean checkFundandAccount(String fCode, String ac_No);
	
	MyFund findMyFund(String fCode, String ac_No);
	
	//MyFund findNotConfirm(int status);
	
	List<MyFund> findNotConfirm(int status);
}
