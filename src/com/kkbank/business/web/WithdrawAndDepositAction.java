package com.kkbank.business.web;

import java.util.HashMap;



import com.kkbank.business.service.IAccountService;

import com.kkbank.business.service.ISupervisorService;
import com.kkbank.business.service.impl.AccountService;
import com.kkbank.business.service.impl.SupervisorService;
import com.kkbank.domain.Account;
import com.kkbank.domain.Supervisor;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class WithdrawAndDepositAction extends ActionSupport {
	private static final long serialVersionUID = 1L;
	protected IAccountService accountService = new AccountService();
	protected ISupervisorService supervisorService = new SupervisorService();
	private String auth_code;
	private String sp_id;
	private String ac_No;
	private double balance;
	private double amount;

	// 用于返回 JSON
	private HashMap<String, Object> resultMap = new HashMap<String, Object>();

	public String withdraw() throws Exception {
		String tips = null;
		Account account = new Account();
		account.setAc_No(ac_No);

//		if(ac_No == null && amount == 0.0 ){
//			return SUCCESS;
//		}
		// 判断 Account
		 if(accountService.checkAccount(account) == true){
			account = accountService.getAccount(ac_No);
			balance = account.getBalance();
			
			if(amount <= 50000) {
				tips = reduceBalance();
			} else if (amount > 50000 && validAuthCode(auth_code)) {
				System.out.println("log:---------------->> 50000");
				tips = reduceBalance();
			} else {
				tips = "Auth code incorrect.";
			} 	
		} else if(ac_No != null) {
			tips = "Wrong account.";
		} 
		ActionContext.getContext().put("tips", tips);
		return SUCCESS;
	}
	
	public String deposit() throws Exception {
		Account account = new Account();
		Supervisor supervisor = new Supervisor();
		String tips = null;
		
		supervisor.setAuth_code(auth_code);
		account.setAc_No(ac_No);
		
		// 判断 Account
		if(accountService.checkAccount(account) == true){
			// 再次判断 auth_code, 其中 ac_No 用来判断是否为用户提交表单的动作，不是提交表单的话不显示 tips
			if(amount <= 50000) {
				tips = addBalance();
			} else if (amount > 50000 && validAuthCode(auth_code)) {
				System.out.println("log:---------------->> 50000");
				tips = addBalance();
			} else {
				tips = "Auth code incorrect.";
			}	
		} else if(ac_No != null) {
			tips = "Wrong account.";
		}
		
		ActionContext.getContext().put("tips", tips);
		
		return SUCCESS;
	}
	
	private String reduceBalance() {
		Account account;
		String tips;
		// 减少余额
		account = accountService.getAccount(ac_No);//get数据库实例 
		balance = account.getBalance();
		
		//这个判断也要写在这里，不然只靠前端拦截很不安全，需要后台二次判断
		if(balance >=  amount){	
			balance = balance - amount;
			account.setBalance(balance);
			accountService.updateAccount(account);
			System.out.println();
			tips = "Reduce balance success";
			
		} else {
			tips = "Balance is not enough.";
		}
		return tips;
	}
	
	private String addBalance() {
		Account account;
		String tips;
		// add余额
		account = accountService.getAccount(ac_No);//get数据库实例 
		balance = account.getBalance();
		balance = balance + amount;
		account.setBalance(balance);
		accountService.updateAccount(account);
		System.out.println();
		tips = "Add balance success";
		return tips;
	}
	
	/**
	 * ajax 接口，判断 auth ccode
	 **/
	public String validAuthCodeAjax() throws Exception {
		resultMap = new HashMap<String, Object>();
		Boolean status = validAuthCode(auth_code);
		// 把状态放进 HashMap 里面，再通过 struts 配置将 HashMap 以 JSON 格式响应给 JavaScript
		resultMap.put("status", status);
		return SUCCESS;
	}
	
	/**
	 * 判断 auth code 基本方法，供其他 action 调用 
	 **/
	public boolean validAuthCode(String auth_code) {
		return supervisorService.isValid(auth_code);
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

	public ISupervisorService getSupervisorService() {
		return supervisorService;
	}

	public void setSupervisorService(ISupervisorService supervisorService) {
		this.supervisorService = supervisorService;
	}

}
