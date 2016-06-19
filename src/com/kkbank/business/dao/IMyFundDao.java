package com.kkbank.business.dao;

import java.util.List;

import com.kkbank.domain.MyFund;

public interface IMyFundDao {
	
	MyFund get(int fund_id);

	int save(MyFund myFund);

	void update(MyFund myFund);

	void delete(MyFund myFund);
	
	void delete(int fund_id);
	
	List<MyFund> findAllMyFund();
	
	List<MyFund> get(MyFund myFund);
	
	boolean checkFundandAccount(String fCode, String ac_No);

	MyFund findMyFund(String fCode, String ac_No);
	
	List<MyFund> findMyFund(String ID);
	
	//MyFund findNotConfirm(int status);
	
	List<MyFund> findNotConfirm(int status);
}
