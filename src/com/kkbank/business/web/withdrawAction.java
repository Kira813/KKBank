package com.kkbank.business.web;

import java.util.HashMap;

import com.kkbank.business.service.IAccountService;
import com.kkbank.business.service.ICustomerService;
import com.kkbank.business.service.ISupervisorService;
import com.kkbank.business.service.impl.AccountService;
import com.kkbank.business.service.impl.CustomerService;
import com.kkbank.business.service.impl.SupervisorService;
import com.kkbank.domain.Account;
import com.kkbank.domain.Supervisor;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class withdrawAction extends ActionSupport {

	protected IAccountService accountService = new AccountService();
	protected ISupervisorService supervisorService = new SupervisorService();
	private String auth_code;
	private String sp_id;
	private String ac_No;
	private double balance;
	private double amount;
	private String tips3;

	
	private HashMap<String, Object> resultMap = new HashMap<String, Object>();

	public String withdraw() throws Exception {
		Account account = new Account();
		Supervisor supervisor = new Supervisor();
		supervisor.setAuth_code(auth_code);
		account.setAc_No(ac_No);
		if(accountService.checkAccount(account) == true){
			account = accountService.getAccount(ac_No);//get数据库实例 
			balance = account.getBalance();
			balance = balance - amount;
			account.setBalance(balance);
			accountService.updateAccount(account);
			return SUCCESS;
		}
//		else if(supervisorService.getAuthCode(auth_code)==null){
//			tips3 = "Auth code incorrect!";
//			return SUCCESS;
//		}
		
		ActionContext.getContext().put("tips2", "wrong account!");
		return SUCCESS;
	}
	public double getBalance() {
		return balance;
	}

	public void setBalance(double balance) {
		this.balance = balance;
	}
	public IAccountService getAccountService() {
		return accountService;
	}
	public void setAccountService(IAccountService accountService) {
		this.accountService = accountService;
	}
	public String getAuth_code() {
		return auth_code;
	}
	public void setAuth_code(String auth_code) {
		this.auth_code = auth_code;
	}
	public String getSp_id() {
		return sp_id;
	}
	public void setSp_id(String sp_id) {
		this.sp_id = sp_id;
	}
	public String getAc_No() {
		return ac_No;
	}
	public void setAc_No(String ac_No) {
		this.ac_No = ac_No;
	}
	public double getAmount() {
		return amount;
	}
	public void setAmount(double amount) {
		this.amount = amount;
	}
	public HashMap<String, Object> getResultMap() {
		return resultMap;
	}
	public void setResultMap(HashMap<String, Object> resultMap) {
		this.resultMap = resultMap;
	}

	
}
