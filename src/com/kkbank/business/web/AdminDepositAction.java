package com.kkbank.business.web;

import java.util.Locale;

import javax.swing.JOptionPane;

import com.kkbank.business.service.IAccountService;
import com.kkbank.business.service.ISupervisorService;
import com.kkbank.business.service.impl.AccountService;
import com.kkbank.business.service.impl.SupervisorService;
import com.kkbank.domain.Account;
import com.opensymphony.xwork2.ActionSupport;

public class AdminDepositAction extends ActionSupport{
	protected IAccountService accountService = new AccountService();
	protected ISupervisorService supervisorService = new SupervisorService();
	
	Account account = new Account();
	private String ac_No;
	private double balance;
	private double amount;
	private String auth_code;
	private String msg;
	
	//默认处理的 execute方法
	public String execute(){
		if(ac_No == null||amount == 0)
		{
			msg = "Please input account number or valid amount";
			return ERROR;
		}
		else if(accountService.getAccount(ac_No) == null)
		{
			msg = "The account is not existing!";
			return ERROR;
		}
		else 
		{
			if(accountService.getAccount(ac_No).getStatus() == 1)
			{
				JOptionPane.setDefaultLocale(Locale.ENGLISH); 
				Object[] option = {"Return"};
				if(amount < 50000)
				{
					account = accountService.getAccount(ac_No);
					balance = account.getBalance() + amount;					
					account.setBalance(balance);
					accountService.updateAccount(account);
					
					JOptionPane.showOptionDialog(null, "The deposit action is successful and the amount has already added to the balance!", 
							"Tips", JOptionPane.DEFAULT_OPTION, JOptionPane.INFORMATION_MESSAGE, null, option, option[0]);
				}
				if(amount >= 50000)
				{		
					auth_code = JOptionPane.showInputDialog(null, "The amount is >= 50000, please input the authentication code:",
							"Warning", JOptionPane.OK_CANCEL_OPTION);
					if(supervisorService.isValid(auth_code))
					{
						account = accountService.getAccount(ac_No);
						balance = account.getBalance() + amount;					
						account.setBalance(balance);
						accountService.updateAccount(account);
						msg = "Successfully deposit!";
						JOptionPane.showOptionDialog(null, "The deposit action is successful and the amount has already added to the balance!", 
								"Tips", JOptionPane.DEFAULT_OPTION, JOptionPane.INFORMATION_MESSAGE, null, option, option[0]);

					}
					else
					{
						msg = "The authentication code is invalid!";
					}
				}
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
	
	public ISupervisorService getSupervisorService() {
		return supervisorService;
	}

	public void setSupervisorService(ISupervisorService supervisorService) {
		this.supervisorService = supervisorService;
	}
	
	public Account getAccount() {
		return account;
	}

	public void setAccount(Account account) {
		this.account = account;
	}
	
	public String getAc_No() {
		return ac_No;
	}
	public void setAc_No(String ac_No) {
		this.ac_No = ac_No;
	}
	
	public double getBalance() {
		return balance;
	}

	public void setBalance(double balance) {
		this.balance = balance;
	}
	
	public double getAmount() {
		return amount;
	}

	public void setAmount(double amount) {
		this.amount = amount;
	}
	
	public String getAuth_code() {
		return auth_code;
	}

	public void setAuth_code(String auth_code) {
		this.auth_code = auth_code;
	}

	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}

}
