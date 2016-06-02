package com.kkbank.business.web;

import java.util.ArrayList;
import java.util.List;


import java.util.Set;

import org.apache.struts2.ServletActionContext;

import com.kkbank.business.service.IAccountService;
import com.kkbank.business.service.ITransactionService;
import com.kkbank.business.service.impl.AccountService;
import com.kkbank.business.service.impl.TransactionService;
import com.kkbank.domain.Account;
import com.kkbank.domain.Transaction;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class NavigationManageAction extends ActionSupport{
	private static final long serialVersionUID = 1L;
	
	private List<Account> acList;
	private String ID;
	IAccountService accountService = new AccountService();
	ITransactionService transactionService = new TransactionService();
	
	public String toIndex() throws Exception {
		return "SUCCESS";
	}
	
	public String toAdLogin() throws Exception {
		return "SUCCESS";
	}

	public String toUserIndex() throws Exception{
		return SUCCESS;
	}
	
	public String toRegister() throws Exception{
		return SUCCESS;
	}
	
	public String toStatus() throws Exception{
		return SUCCESS;
	}
	public String toAccountEnquiry() throws Exception{
		return SUCCESS;
	}
	public String toAccountSelection() throws Exception{
		ID = (String) ActionContext.getContext().getSession().get("loginID");
		acList = accountService.listAccount(ID);
		ActionContext.getContext().put("acList", acList);
		return SUCCESS;
	}
	public String toBalanceStatus() throws Exception{
		String ac_No = ServletActionContext.getRequest().getParameter("ac_No");
		Account account = accountService.getAccount(ac_No);
		double balance = account.getBalance();
		ActionContext.getContext().put("ac_No", ac_No);
		ActionContext.getContext().put("balance", balance);
		return SUCCESS;
	}
	public String toTransctionDetail() throws Exception{
		String ac_No = ServletActionContext.getRequest().getParameter("ac_No");
		Account account = accountService.getAccount(ac_No);
		//Set<Transaction> transactions = account.getTransactions();
		//ActionContext.getContext().put("list", transactions);
		List<Transaction> list = transactionService.listTransaction(account);
		ActionContext.getContext().put("list", list);
		return SUCCESS;
	}
	public String toTransfer() throws Exception{
		ID = (String) ActionContext.getContext().getSession().get("loginID");
		acList = accountService.listAccount(ID);	
		return SUCCESS;
}

	public List<Account> getAcList() {
		return acList;
	}

	public void setAcList(List<Account> acList) {
		this.acList = acList;
	}

	public String getID() {
		return ID;
	}

	public void setID(String ID) {
		this.ID = ID;
	}

	public IAccountService getAccountService() {
		return accountService;
	}

	public void setAccountService(IAccountService accountService) {
		this.accountService = accountService;
	}

	public ITransactionService getTransactionService() {
		return transactionService;
	}

	public void setTransactionService(ITransactionService transactionService) {
		this.transactionService = transactionService;
	}
	
	
}
