package com.kkbank.business.dao;

import com.kkbank.domain.Admin;
import java.util.List;

public interface IAdminLoginDao {
    Admin get(Integer adm_id);
	
	List<Admin> login(Admin admin);
	

}
