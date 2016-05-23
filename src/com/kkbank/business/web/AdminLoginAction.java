package com.kkbank.business.web;

import com.kkbank.business.service.IAdminService;
import com.kkbank.business.service.impl.AdminService;
import com.kkbank.domain.Admin;
import com.opensymphony.xwork2.ActionSupport;

public class AdminLoginAction extends ActionSupport{
	
	protected IAdminService adminService = new AdminService();
	//Admin admin = new Admin();
	
	private String ad_id;  
    private String psd;
    private String msg;
 
    public String login()  
    {  
    	if(ad_id == null||psd == null)
    	{
            msg= "Please input your admin ID or password!";
    		return ERROR;
    	}
    	else if (adminService.login(ad_id, psd))  
        {  
    		System.out.println("Successfully login!");  
            return SUCCESS;  
        }  
    	else
        {  
    		msg = "Please check your admin ID or password right or not!";
            return ERROR;  
        }  
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
    
    public IAdminService getAdminService() {
		return adminService;
	}

	public void setAdminService(IAdminService adminService) {
		this.adminService = adminService;
	}

}
