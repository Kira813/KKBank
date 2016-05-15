package com.kkbank.business.service.impl;

import java.util.List;

import com.kkbank.business.dao.IUserDao;
import com.kkbank.business.dao.impl.UserDao;
import com.kkbank.business.service.IUserService;
import com.kkbank.domain.User;

public class UserService implements IUserService{
	IUserDao userDao = new UserDao();
	@Override
	public Integer addUser(String username, String pwd, Integer power) {
		User user = new User();
		user.setUsername(username);
		user.setPwd(pwd);
		user.setPower(power);
		return userDao.save(user);
	}

	@Override
	public void delUser(Integer id) {
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
	public User getUser(Integer id) {
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
