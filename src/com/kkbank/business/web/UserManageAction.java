package com.kkbank.business.web;

import java.util.HashMap;
import java.util.List;

import com.kkbank.business.service.ICustomerService;
import com.kkbank.business.service.IUserService;
import com.kkbank.business.service.impl.CustomerService;
import com.kkbank.business.service.impl.UserService;
import com.kkbank.domain.Customer;
import com.kkbank.domain.User;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class UserManageAction extends ActionSupport{
	private static final long serialVersionUID = 1L;

	protected IUserService userService = new UserService();
	protected ICustomerService customerService = new CustomerService();
	
	private String ID;
	private String name;
	private String pwd;
	private String pwd1;
	private String email;
	private int status;
	private String uStatus;
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
		String rTips = null;
		resultMap = new HashMap<String, Object>();
		Customer customer = new Customer();
		customer.setID(ID);
		customer.setName(name);
		switch(status){
		case(1): uStatus="Normal";
				 break;
		case(2): uStatus="Locked";
				 break;
		case(3): uStatus="Not activated";
		 		 break;
		case(4): uStatus="Not Available";
 		 		 break;
		}
		if (customerService.checkCustomer(customer) == true) {
			customer = customerService.getCustomer(customer);
			userService.addUser(ID,name, pwd1, email,3);
			User user = userService.getUser(ID);
			ActionContext.getContext().getSession().put("customer", customer);
			ActionContext.getContext().getSession().put("user", user);
			rTips="Create a user successfully!"; 	//这里无效 为啥
			ActionContext.getContext().put("rTips", rTips);
			return SUCCESS;
		} else if (ID != null || name != null){
			rTips = "Wrong ID or name！";
			ActionContext.getContext().put("rTips",rTips );
		}
		return ERROR;
	}

	public String modifyUser(){
		resultMap = new HashMap<String, Object>();
		User user = userService.getUser(ID);
		user.setName(name);
		user.setPwd(pwd1);
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

	public String getPwd1() {
		return pwd1;
	}

	public void setPwd1(String pwd1) {
		this.pwd1 = pwd1;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}


	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
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

	public ICustomerService getCustomerService() {
		return customerService;
	}

	public void setCustomerService(ICustomerService customerService) {
		this.customerService = customerService;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	

}
