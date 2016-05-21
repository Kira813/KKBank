package com.kkbank.business.dao;

import java.util.List;

import com.kkbank.domain.User;

public interface IUserDao {
	User get(String id);
	
	List<User> get(User user);
	
	String save(User user);
	
	void update(User user);
	
	void delete(User user);
	
	void delete(String id);
	
	List<User> findAll();
	
}
