package com.kkbank.business.service;

import java.util.List;

import com.kkbank.domain.User;


public interface IUserService {

	Integer addUser(String username, String pwd, Integer power);

	void delUser(Integer id);

	void delUser(User user);

	void updateUser(User user);

	List<User> listUser();

	User getUser(Integer id);

	User getUser(User user);

	boolean checkUser(User user);
}
