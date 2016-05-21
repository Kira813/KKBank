package com.kkbank.business.web;

import java.util.HashMap;
import java.util.List;

import com.kkbank.business.service.IUserService;
import com.kkbank.business.service.impl.UserService;
import com.kkbank.domain.User;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class UserManageAction extends ActionSupport{
	private static final long serialVersionUID = 1L;

	protected IUserService userService = new UserService();
	
	private String ID;
	private String username;
	private String pwd;
	private String email;
	private HashMap<String, Object> resultMap = new HashMap<String, Object>();
	
	public String manageUser() throws Exception{
		User user = userService.getUser(ID);
		ActionContext ctx = ActionContext.getContext();
		ctx.put("user", user);
		return "manageUser";
	}
	
	public String listUser() throws Exception{
		List<User> list = userService.listUser();
		ActionContext ctx = ActionContext.getContext();
		ctx.put("listuser", list);
	
		return "listUser";
	}
	
	public String addUser() throws Exception{
		resultMap = new HashMap<String, Object>();
		userService.addUser(ID,username, pwd, email);
		return "SUCCESS";
	}
	
	public String modifyUser(){
		resultMap = new HashMap<String, Object>();
		User user = userService.getUser(ID);
		user.setUsername(username);
		user.setPwd(pwd);
		user.setEmail(email);
		userService.updateUser(user);
		return SUCCESS;
	}
	
	public String delUser() throws Exception{
		resultMap = new HashMap<String, Object>();
		userService.delUser(ID);
		return SUCCESS;
	}
	


	public String getID() {
		return ID;
	}


	public void setID(String iD) {
		ID = iD;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}



	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}


	public HashMap<String, Object> getResultMap() {
		return resultMap;
	}

	public void setResultMap(HashMap<String, Object> resultMap) {
		this.resultMap = resultMap;
	}

	public IUserService getUserService() {
		return userService;
	}

	public void setUserService(IUserService userService) {
		this.userService = userService;
	}

}
