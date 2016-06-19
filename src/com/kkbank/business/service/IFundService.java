package com.kkbank.business.service;

import java.util.List;

import com.kkbank.domain.Fund;

public interface IFundService {	
	Fund get(String fCode);
	
	String save(Fund fund);

	void update(Fund fund);

	void delete(Fund fund);
	
	void delete(String fCode);

	List<Fund> findAllFund();
	
	List<Fund> get(Fund fund);

	List<Fund> findFundDetail(String fCode);
	
	Fund findFundByCode(String fCode);
}
