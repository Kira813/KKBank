package com.kkbank.business.service;

import java.util.List;

import com.kkbank.domain.Admin;
import com.kkbank.domain.User;

public interface IAdminService {
	//Admin getAdmin(Admin admin);
	
	boolean login(String ad_id, String psd);

}
