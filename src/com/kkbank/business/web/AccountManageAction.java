package com.kkbank.business.web;

import java.util.HashMap;
import java.util.List;

import com.kkbank.business.service.IAccountService;
import com.kkbank.business.service.ICustomerService;
import com.kkbank.business.service.impl.AccountService;
import com.kkbank.business.service.impl.CustomerService;
import com.kkbank.domain.Account;
import com.kkbank.domain.Customer;
import com.meeting.domain.User;
import com.opensymphony.xwork2.ActionContext;

public class AccountManageAction {
	//private static final long serialVersionUID = 1L;
	/*  serialVersionUID用来作为Java对象序列化中的版本标示之用； 
	如果一个序列化类没有声明这样一个static final的产量，JVM会根据各种参数为这个类计算一个； 
	对于同样一个类，不同版本的JDK可能会得出不同的serivalVersionUID;   */
	protected IAccountService accountService = new AccountService();
	protected ICustomerService customerService = new CustomerService();
	
	private String ID;
	private String ac_No;
	private String password;
	private String password1;
	private String password2;
	private double balance;
	private int status;
	private Customer customer;
	private String name;

	private HashMap<String, Object> resultMap = new HashMap<String, Object>();
	
	public String addAccount() throws Exception{
		Customer customer = new Customer();
		Account account = new Account();
		customer.setID(ID);
		customer.setName(name);
		account.setPassword(password1);
		account.setPassword(password2);
		if(customerService.checkCustomer(customer) == true){
			if(password1==password2){
			customer = customerService.getCustomer(customer);
			ActionContext.getContext().getSession().put("customer", customer);
			ActionContext.getContext().getSession().put("ID", customer.getID());
			ActionContext.getContext().getSession().put("name", customer.getName());
			ActionContext.getContext().getSession().put("name", customer.getName());
			return "SUCCESS";}else
				{
					ActionContext.getContext().put("tip", "密码不一致，请重新输入");
					return "opencard";
				}
		}
		ActionContext.getContext().put("tip", "身份证或姓名错误");
		return "opencard";
		resultMap = new HashMap<String, Object>();
		customer = customerService.getCustomer(ID);
		 accountService.addAccount(ID,ac_No,password,balance,
				status, customer);
		return "SUCCESS";
	}
	
	public String openCard() throws Exception {
		return "SUCCESS";
	}
	public String getID() {
		return ID;
	}

	public void setID(String id) {
		ID = id;
	}

	public String getAc_No() {
		return ac_No;
	}

	public void setAc_No(String ac_No) {
		this.ac_No = ac_No;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public double getBalance() {
		return balance;
	}

	public void setBalance(double balance) {
		this.balance = balance;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}


	public Customer getCustomer() {
		return customer;
	}


	public void setCustomer(Customer customer) {
		this.customer = customer;
	}
	
	
	public HashMap<String, Object> getResultMap() {
		return resultMap;
	}

	public void setResultMap(HashMap<String, Object> resultMap) {
		this.resultMap = resultMap;
	}

	public IAccountService getAccountService() {
		return accountService;
	}

	public void setAccountService(IAccountService accountService) {
		this.accountService = accountService;
	}
	public ICustomerService getCustomerService() {
		return customerService;
	}

	public void setCustomerService(ICustomerService customerService) {
		this.customerService = customerService;
	}

}
