package com.kkbank.business.service.impl;

import java.util.List;

import com.kkbank.business.dao.IUserDao;
import com.kkbank.business.dao.impl.UserDao;
import com.kkbank.business.service.IUserService;
import com.kkbank.domain.User;

public class UserService implements IUserService{
	IUserDao userDao = new UserDao();
	@Override
	public String addUser(String ID,String username, String pwd, String email,int status) {
		User user = new User();
		user.setID(ID);
		user.setUsername(username);
		user.setPwd(pwd);
		user.setEmail(email);
		user.setStatus(status);
		return userDao.save(user);
	}

	@Override
	public void delUser(String id) {
		userDao.delete(id);
		
	}

	@Override
	public void delUser(User user) {
		userDao.delete(user);
		
	}

	@Override
	public void updateUser(User user) {
		userDao.update(user);
		
	}

	@Override
	public List<User> listUser() {
		return userDao.findAll();
	}

	@Override
	public User getUser(String id) {
		return userDao.get(id);
	}

	@Override
	public User getUser(User user) {
		return userDao.get(user).get(0);
	}

	@Override
	public boolean checkUser(User user) {
		if(userDao.get(user).size()>0){
			return true;
		}
		return false;
	}

	public IUserDao getUserDao() {
		return userDao;
	}

	public void setUserDao(IUserDao userDao) {
		this.userDao = userDao;
	}

}
