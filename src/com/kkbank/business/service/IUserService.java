package com.kkbank.business.service;

import java.util.List;

import com.kkbank.domain.User;


public interface IUserService {

	String addUser(String ID,String username, String pwd, String email,int status);

	void delUser(String id);

	void delUser(User user);

	void updateUser(User user);

	List<User> listUser();

	User getUser(String id);

	User getUser(User user);

	boolean checkUser(User user);
}
