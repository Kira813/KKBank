package com.kkbank.business.dao;

import java.util.List;

import com.kkbank.domain.Supervisor;

public interface ISupervisorDao {
	Supervisor get(String auth_code);
	
	String save(Supervisor supervisor);
		
	void update(Supervisor supervisor);
	
	void delete(Supervisor supervisor);
	
	void delete(String auth_code);
	
	List<Supervisor> findAllAuthCode();
	
	boolean isValid(String auth_code);

}
