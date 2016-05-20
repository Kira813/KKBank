package com.kkbank.business.dao;

import java.util.List;

import com.kkbank.domain.Admin;

public interface IAdminDao {
	Admin get(String adm_id);
	
	List<Admin> get(Admin admin);
	
	Integer save(Admin admin);
	
	void update(Admin admin);
	
	void delete(Admin admin);
	
	void delete(String adm_id);
	
	List<Admin> findAllAdmin();
	
	boolean login(String adm_id, String psd);
}
