package com.kkbank.business.dao;

import java.util.List;

import com.kkbank.domain.User;

public interface IUserDao {
	User get(Integer id);
	
	List<User> get(User user);
	
	Integer save(User user);
	
	void update(User user);
	
	void delete(User user);
	
	void delete(Integer id);
	
	List<User> findAll();
	
}
