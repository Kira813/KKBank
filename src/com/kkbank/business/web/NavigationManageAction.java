package com.kkbank.business.web;

import java.util.List;

import com.kkbank.business.service.IAccountService;
import com.kkbank.business.service.impl.AccountService;
import com.kkbank.domain.Account;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class NavigationManageAction extends ActionSupport{
	private static final long serialVersionUID = 1L;
	
	private List<Account> acList;
	private String ID;
	IAccountService accountService = new AccountService();
	
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
		return SUCCESS;
	}
	public String toBalanceStatus() throws Exception{
		return SUCCESS;
	}
	public String toTransctionDetail() throws Exception{
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
	
}
