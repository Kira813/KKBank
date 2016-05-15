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
	
	private Integer id;
	private String username;
	private String pwd;
	private Integer power;
	private HashMap<String, Object> resultMap = new HashMap<String, Object>();
	
	public String manageUser() throws Exception{
		User user = userService.getUser(id);
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
		userService.addUser(username, pwd, power);
		return SUCCESS;
	}
	
	public String modifyUser(){
		resultMap = new HashMap<String, Object>();
		User user = userService.getUser(id);
		user.setUsername(username);
		user.setPwd(pwd);
		user.setPower(power);
		userService.updateUser(user);
		return SUCCESS;
	}
	
	public String delUser() throws Exception{
		resultMap = new HashMap<String, Object>();
		userService.delUser(id);
		return SUCCESS;
	}
	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
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

	public Integer getPower() {
		return power;
	}

	public void setPower(Integer power) {
		this.power = power;
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
