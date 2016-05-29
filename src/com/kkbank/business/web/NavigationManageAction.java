package com.kkbank.business.web;

import com.opensymphony.xwork2.ActionSupport;

public class NavigationManageAction extends ActionSupport{
	private static final long serialVersionUID = 1L;
	
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
}
