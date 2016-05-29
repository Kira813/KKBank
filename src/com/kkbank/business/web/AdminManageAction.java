package com.kkbank.business.web;

import java.util.List;
import java.util.Locale;

import javax.swing.JOptionPane;

import com.kkbank.business.service.IAccountService;
import com.kkbank.business.service.IAdminService;
import com.kkbank.business.service.ICustomerService;
import com.kkbank.business.service.ISupervisorService;
import com.kkbank.business.service.impl.AccountService;
import com.kkbank.business.service.impl.AdminService;
import com.kkbank.business.service.impl.CustomerService;
import com.kkbank.business.service.impl.SupervisorService;
import com.kkbank.domain.Account;
import com.kkbank.domain.Customer;
import com.opensymphony.xwork2.ActionSupport;

public class AdminManageAction extends ActionSupport{
	 private static final long serialVersionUID = 1L;
	//login
	protected IAdminService adminService = new AdminService();
	//changePIN
	protected IAccountService accountService = new AccountService();
	protected ISupervisorService supervisorService = new SupervisorService();
	Account account = new Account();
	//inquiry +acountService
	protected ICustomerService customerService = new CustomerService();

	private String ad_id;  
    private String psd;
    private String msg;
	private String ac_No;
	private String ID;
	private String PIN;
	private String PIN2;
	//String ID;
	private String name;
	private double balance;
	private int status;
	private String sta_msg;
 
    public String login () throws Exception{  
    	if(ad_id == null||psd == null)
    	{
            msg= "Please input your admin ID or password.";
    		return ERROR;
    	}
    	else if (adminService.login(ad_id, psd))  
        {  
    		System.out.println("Successfully login.");  
            return SUCCESS;  
        }  
    	else
        {  
    		msg = "Please check your admin ID or password right or not.";
            return ERROR;  
        }  
    }  
    
    public String changePIN() throws Exception{
		if(ac_No == null && PIN == null && PIN2 == null){
			return ERROR;
		}	
		else if(accountService.getAccount(ac_No)!= null){
			if(accountService.getAccount(ac_No).getID().equals(ID)){
				if(PIN.equals("") || PIN2.equals("")){
					msg = "please input your new PIN twice!";
					return ERROR;
				}
				else if(PIN.equals(PIN2)){
					JOptionPane.setDefaultLocale(Locale.ENGLISH); 
					Object[] option = {"Return"};
					
					String auth_code = JOptionPane.showInputDialog(null, "Please input the authentication code:",
							"Warning", JOptionPane.OK_CANCEL_OPTION);
					
					if(supervisorService.isValid(auth_code))
					{
						account = accountService.getAccount(ac_No);					
						account.setPassword(PIN);
						accountService.updateAccount(account);
						
						msg = "Successfully change!";
						JOptionPane.showOptionDialog(null, "The PIN has already changed!", 
								"Tips", JOptionPane.DEFAULT_OPTION, JOptionPane.INFORMATION_MESSAGE, null, option, option[0]);
						
					    return SUCCESS;
					}
					else
					{
						msg = "Invalid authentication code.";
						return ERROR;
					}
				}
				else
				{
					msg = "The two PIN are not the same, Please input again.";
					return ERROR;
				}
			}
			else if(ID.equals("")){
				msg = "Please input ID.";
				return ERROR;
			}
			else {
				msg = "Invalid ID.";
				return ERROR;
			}
		}
		else if(ac_No.equals("")){
			msg = "Please input card number.";
			return ERROR;
		}
		else
		{			
			msg = "Invalid card number.";
			return ERROR;
		}
	}
	public String inquiry() throws Exception{
		if(ID != null && accountService.listAccount(ID).size() == 0) {
			msg = "Not Exisiting.";
			return ERROR;
		} else {
			List<Account> acList = accountService.listAccount(ID);
			
			if(acList.size() > 0) {
				Account account = acList.get(0);
				ac_No = account.getAc_No();
				balance = account.getBalance();
				status = account.getStatus();
				
				List<Customer> cList = customerService.find(ID);
				if(cList.size() > 0) {
					Customer customer = cList.get(0);
					name = customer.getName();
				}
				
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
			} else {
				return ERROR;
			}
			
		}
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
	
    
    public void setAd_id(String ad_id)
    {
    	this.ad_id = ad_id;
    }
    
    public String getAd_id()
    {
    	return this.ad_id;
    }
    
    public void setPsd(String psd)
    {
    	this.psd = psd;
    }
    
    public String getPsd()
    {
    	return this.psd;
    }
        
    public String getMsg() {
  		return msg;
  	}

  	public void setMsg(String msg) {
  		this.msg = msg;
  	}

	public String getAc_No() {
		return ac_No;
	}

	public void setAc_No(String ac_No) {
		this.ac_No = ac_No;
	}

	public String getID() {
		return ID;
	}

	public void setID(String iD) {
		ID = iD;
	}

	public String getPIN() {
		return PIN;
	}

	public void setPIN(String pIN) {
		PIN = pIN;
	}

	public String getPIN2() {
		return PIN2;
	}

	public void setPIN2(String pIN2) {
		PIN2 = pIN2;
	}
	

    public IAdminService getAdminService() {
		return adminService;
	}

	public void setAdminService(IAdminService adminService) {
		this.adminService = adminService;
	}
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
	
	public ICustomerService getCustomerService() {
		return customerService;
	}

	public void setCustomerService(ICustomerService customerService) {
		this.customerService = customerService;
	}
}
