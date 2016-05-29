package com.kkbank.business.web;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;

import javax.swing.JOptionPane;

import com.kkbank.business.service.ICustomerService;
import com.kkbank.business.service.IUserService;
import com.kkbank.business.service.impl.CustomerService;
import com.kkbank.business.service.impl.UserService;
import com.kkbank.domain.Customer;
import com.kkbank.domain.User;
import com.kkbank.util.mail.EmailUtils;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class UserManageAction extends ActionSupport{
	private static final long serialVersionUID = 1L;

	protected IUserService userService = new UserService();
	protected ICustomerService customerService = new CustomerService();
	//user activation
	User user = new User();
	
	private String ID;
	private String name;
	private String pwd;
	private String pwd1;
	private String email;
	private int status;
	private String uStatus;
	//login +
	private String msg;
	//changePwd+
	private String conPwd;
	String pwd_regex = "^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])[a-zA-Z0-9]{6,}$";

	
	private HashMap<String, Object> resultMap = new HashMap<String, Object>();
	
	public String userLogin() throws Exception{	
		/*user.setname(name);
		user.setPwd(pwd);*/
		if(ID==null&&pwd==null){
			return ERROR;
		}	
		else if(ID.trim()==""||pwd.trim()==""){
			msg="Please input name or password.";
			//this.result = "false";
			return ERROR;
		}
		else if(userService.listUser(ID).size() == 0){
			msg="The user does not exist.";
			//this.result = "false";
			return ERROR;
		}
		else if(userService.login(ID, pwd)){
			//this.result="true";
			System.out.println("success");
			return SUCCESS;
		}
		else{
			msg="Please check your password right or not.";
			//this.result = "false";
			return ERROR;
		}		
	}
	
	public String userActivation() throws Exception{
		if(userService.listUser(ID).size() == 1){
			status = 1;
			//User.setID(ID);
			user = userService.getUser(ID);
			user.setStatus(status);			
			userService.updateUser(user);
			return SUCCESS;
		}
		else
		{
			msg = "The user does not exist, Please contact with our Bank";
			return ERROR;
		}
	}
	public String userChangePwd() throws Exception{	
		JOptionPane.setDefaultLocale(Locale.ENGLISH); 
		Object[] option = {"Return"};
		
		if(pwd.trim()==""||conPwd.trim()==""){
			msg = "Password can not be empty.";
			System.out.println(msg);
			return ERROR;
		}
		else if(pwd.length() >= 6){
			if(pwd.matches(pwd_regex)){
				if(pwd.equals(conPwd)){
					user = userService.getUser(ID);
					user.setPwd(pwd);

					userService.updateUser(user);
					
					JOptionPane.showOptionDialog(null, "The password has already changed.", 
							"Tips", JOptionPane.DEFAULT_OPTION, JOptionPane.INFORMATION_MESSAGE, null, option, option[0]);
					return SUCCESS;
				}
				else
				{
					JOptionPane.showMessageDialog(null, "The two password do not match.", 
							"Warning", JOptionPane.WARNING_MESSAGE);
					return ERROR;
				}			
			}
			else{
				JOptionPane.showMessageDialog(null, "Your password must contain a mixture of lower and upper case letter and digit", 
						"Warning", JOptionPane.WARNING_MESSAGE);
				return ERROR;
			}
		}
		else
		{
			JOptionPane.showMessageDialog(null, "Your password must be at least 6 characters.", 
					"Warning", JOptionPane.WARNING_MESSAGE);
			return ERROR;
		}
	}
	public String userForgetPwd() throws Exception{		
		user.setID(ID);
		user.setEmail(email);
		User user= userService.getUser(ID);
		JOptionPane.setDefaultLocale(Locale.ENGLISH); 
		Object[] option = {"Return"};
		System.out.println("name"+name + "ID" +ID);
		
		if(userService.listUser(name, ID).size() == 1){
			if(userService.isMail(user)){
				//send e-mail
				if(EmailUtils.sendResetPasswordEmail(user)){
					JOptionPane.showOptionDialog(null, "There will be an verification mail send to your security email.", 
							"Tips", JOptionPane.DEFAULT_OPTION, JOptionPane.INFORMATION_MESSAGE, null, option, option[0]);
				}
				return SUCCESS;
			}
			else
			{
				msg="The security mail is incorrect.";
				JOptionPane.showMessageDialog(null, msg, "Warning", JOptionPane.WARNING_MESSAGE);
				return ERROR;
			}
		}
		else
		{
			msg="Please check your user account or ID.";
			JOptionPane.showMessageDialog(null, msg, "Warning", JOptionPane.WARNING_MESSAGE);
			return ERROR;
		}
	}
	
	public String addUser() throws Exception{
		Object[] option = {"Return"};
		String rTips = null;
		resultMap = new HashMap<String, Object>();
		Customer customer = new Customer();
		customer.setID(ID);
		customer.setName(name);
		switch(status){
		case(1): uStatus="Normal";
				 break;
		case(2): uStatus="Locked";
				 break;
		case(3): uStatus="Not activated";
		 		 break;
		case(4): uStatus="Not Available";
 		 		 break;
		}
		if (customerService.checkCustomer(customer) == true) {
			customer = customerService.getCustomer(customer);
			userService.addUser(ID,name, pwd1, email,3);
			User user = userService.getUser(ID);
			ActionContext.getContext().getSession().put("customer", customer);
			ActionContext.getContext().getSession().put("user", user);
			rTips="Create a user successfully!"; 	//这里无效 为啥
			ActionContext.getContext().put("rTips", rTips);
				if(EmailUtils.sendAccountActivateEmail(user)){
					JOptionPane.showOptionDialog(null, "There will be an verification mail send to your security email.", 
							"Tips", JOptionPane.DEFAULT_OPTION, JOptionPane.INFORMATION_MESSAGE, null, option, option[0]);
				}
			return SUCCESS;
		} else if (ID != null || name != null){
			rTips = "Wrong ID or name.";
			ActionContext.getContext().put("rTips",rTips );
		}
		return ERROR;
	}
	
	public String manageUser() throws Exception{
		User user = userService.getUser(ID);
		ActionContext ctx = ActionContext.getContext();
		ctx.put("user", user);
		return "manageUser";
	}
	
	public String listUser() throws Exception{
		
		List<User> list = userService.listUser();
		ActionContext ctx = ActionContext.getContext();
		ctx.put("listuser", list);
	
		return "listUser";
	}

	public String modifyUser(){
		resultMap = new HashMap<String, Object>();
		User user = userService.getUser(ID);
		user.setName(name);
		user.setPwd(pwd1);
		user.setEmail(email);
		userService.updateUser(user);
		return SUCCESS;
	}
	
	public String delUser() throws Exception{
		resultMap = new HashMap<String, Object>();
		userService.delUser(ID);
		return SUCCESS;
	}
	


	public String getID() {
		return ID;
	}


	public void setID(String iD) {
		ID = iD;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPwd1() {
		return pwd1;
	}

	public void setPwd1(String pwd1) {
		this.pwd1 = pwd1;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}


	public String getuStatus() {
		return uStatus;
	}

	public void setuStatus(String uStatus) {
		this.uStatus = uStatus;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getConPwd() {
		return conPwd;
	}

	public void setConPwd(String conPwd) {
		this.conPwd = conPwd;
	}

	public String getPwd_regex() {
		return pwd_regex;
	}

	public void setPwd_regex(String pwd_regex) {
		this.pwd_regex = pwd_regex;
	}

	public HashMap<String, Object> getResultMap() {
		return resultMap;
	}

	public void setResultMap(HashMap<String, Object> resultMap) {
		this.resultMap = resultMap;
	}

	public IUserService getUserService() {
		return userService;
	}

	public void setUserService(IUserService userService) {
		this.userService = userService;
	}

	public ICustomerService getCustomerService() {
		return customerService;
	}

	public void setCustomerService(ICustomerService customerService) {
		this.customerService = customerService;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
}
