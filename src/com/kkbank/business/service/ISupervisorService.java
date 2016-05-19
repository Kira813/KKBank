package com.kkbank.business.service;

import java.util.List;

import com.kkbank.domain.Supervisor;

public interface ISupervisorService {
	String addAuthCode(String auth_code, String sp_id);
	
	void delAuthCode(String auth_code);
	
	void delSupervisor(Supervisor supervisor);

	void updateSupervisor(Supervisor supervisor);

	List<Supervisor> listSupervisor();

	Supervisor getAuthCode(String auth_code);
	
	boolean isValid(String auth_code);

}
