package com.kkbank.business.service.impl;

import java.util.List;

import com.kkbank.business.dao.ISupervisorDao;
import com.kkbank.business.dao.impl.SupervisorDao;
import com.kkbank.business.service.ISupervisorService;
import com.kkbank.domain.Supervisor;

public class SupervisorService implements ISupervisorService{
	ISupervisorDao supervisorDao = new SupervisorDao();

	//ac_No是主键
	public String addAuthCode(String auth_code, String sp_id) {
		Supervisor supervisor = new Supervisor();
		supervisor.setAuth_code(auth_code);
		supervisor.setSp_id(sp_id);
		return supervisorDao.save(supervisor);
	}
	
	public void delAuthCode(String auth_code) {
		supervisorDao.delete(auth_code);
		
	}
	
	public void delSupervisor(Supervisor supervisor) {
		supervisorDao.delete(supervisor);
		
	}

	public void updateSupervisor(Supervisor supervisor) {
		supervisorDao.update(supervisor);	
	}

	public List<Supervisor> listSupervisor() {
		return supervisorDao.findAllAuthCode();
	}

	public Supervisor getAuthCode(String auth_code) {
		return supervisorDao.get(auth_code);
	}
	
	public boolean isValid(String auth_code) {
		return supervisorDao.isValid(auth_code);
	}

	//setter & getter
	public ISupervisorDao getSupervisorDao() {
		return supervisorDao;
	}

	public void setSupervisorDao(ISupervisorDao supervisorDao) {
		this.supervisorDao = supervisorDao;
	}
}
