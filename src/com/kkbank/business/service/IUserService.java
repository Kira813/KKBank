package com.kkbank.business.service;

import java.util.List;

import com.kkbank.domain.User;


public interface IUserService {

	String addUser(String ID,String name, String pwd, String email,int status);

	void delUser(String id);

	void delUser(User user);

	void updateUser(User user);

	List<User> listUser();

	User getUser(String id);

	User getUser(User user);

	boolean checkUser(User user);
	//new
	List<User> listUser(String ID);
	
	List<User> listUser(String name, String ID);
	
	boolean login(String ID, String pwd);
	
	boolean isMail(String ID, String email);
}
