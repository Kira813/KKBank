package com.kkbank.business.web;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import com.kkbank.business.service.IAccountService;
import com.kkbank.business.service.ICustomerService;
import com.kkbank.business.service.impl.AccountService;
import com.kkbank.business.service.impl.CustomerService;
import com.kkbank.domain.Account;
import com.kkbank.domain.Customer;
import com.opensymphony.xwork2.ActionSupport;

public class AdminInquiryAction extends ActionSupport{
	protected IAccountService accountService = new AccountService();
	protected ICustomerService customerService = new CustomerService();

	String ID;
	private String ac_No;
	private String name;
	private double balance;
	private int status;
	private String sta_msg;
	private String msg;

	//默认处理的 execute方法
	public String execute()
	{
		if(ID == null)
		{
			msg = "Please input ID!";
			return ERROR;
		}
		else if(accountService.listAccount(ID).size() == 0)
		{
			msg = "Not Exisiting!";
			return ERROR;
		}
		else
		{
			List<Account> acList = accountService.listAccount(ID);
			ac_No = acList.get(0).getAc_No();
			balance = acList.get(0).getBalance();
			status = acList.get(0).getStatus();
			
			List<Customer> cList = customerService.find(ID);
			name = cList.get(0).getName();
			
			switch(status){
			case(1): sta_msg="Normal";
					 break;
			case(2): sta_msg="Locked";
					 break;
			case(3): sta_msg="Not activated";
			 		 break;
			case(4): sta_msg="Not Available";
	 		 		 break;
			}
			return SUCCESS;
		}
	}
	
	//各属性的getter & setter
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

	public String getID() {
		return ID;
	}
	public void setID(String iD) {
		ID = iD;
	}
	public String getAc_No() {
		return ac_No;
	}
	public void setAc_No(String ac_No) {
		this.ac_No = ac_No;
	}
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
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
	
	public String getSta_msg() {
		return sta_msg;
	}

	public void setSta_msg(String sta_msg) {
		this.sta_msg = sta_msg;
	}
	
	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}
}
