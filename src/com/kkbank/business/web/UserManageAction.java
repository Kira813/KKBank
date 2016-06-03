package com.kkbank.business.web;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;

import javax.swing.JOptionPane;

import com.kkbank.business.service.IAccountService;
import com.kkbank.business.service.ICustomerService;
import com.kkbank.business.service.ITransactionService;
import com.kkbank.business.service.IUserService;
import com.kkbank.business.service.impl.AccountService;
import com.kkbank.business.service.impl.CustomerService;
import com.kkbank.business.service.impl.TransactionService;
import com.kkbank.business.service.impl.UserService;
import com.kkbank.domain.Account;
import com.kkbank.domain.Customer;
import com.kkbank.domain.User;
import com.kkbank.util.mail.EmailUtils;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.kkbank.util.encryption.DES;

public class UserManageAction extends ActionSupport{
	private static final long serialVersionUID = 1L;

	protected IUserService userService = new UserService();
	protected ICustomerService customerService = new CustomerService();
	protected ITransactionService transactionService = new TransactionService();
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
	//activation+
	IAccountService accountService = new AccountService();
	Account account = new Account();

	//transfer+
	private List<Account> acList;
	private Account toAccount;
	private double amount;
	private String toAc_No;
	private String toName;
	private String PIN;
	private String ac_No;
	
	private int t_id;
	private Date date;
	private String type;
	private String type2;
	private double tBalance;
	
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
			ActionContext ctx = ActionContext.getContext();
			ctx.getSession().put("loginID", ID);
			ctx.getSession().put("name", userService.getUser(ID).getName());
			System.out.println("success");
			return SUCCESS;
		}
		else{
			msg="Please check your password.";
			//this.result = "false";
			return ERROR;
		}		
	}
	public String logout() throws Exception{
		ActionContext.getContext().getSession().clear();
		return SUCCESS;
	}
	

	
	public String transfer(){
		String tips = null;
		account = accountService.getAccount(ac_No);
		toAccount = accountService.getAccount(toAc_No);	
		if(toAccount == null){
			msg = "The account you want to transfer to does not exist.";
			return ERROR;
		}
		else
		{
			if(customerService.isValidAccount(toAccount.getID(), toName))
			{
				System.out.println(account.getPassword());
				if(account.getPassword().equals(PIN)){
					if(account.getBalance() > amount){
						account.setBalance(account.getBalance() - amount);
						toAccount.setBalance(toAccount.getBalance() + amount);
						
						accountService.updateAccount(account);
						accountService.updateAccount(toAccount);

						type="Transfer out";
						type2="Transfer in";
						date = new Date();
					    t_id = transactionService.addTransaction(t_id, date, type, amount, account.getBalance(), account);
					    t_id = transactionService.addTransaction(t_id, date, type2, amount, toAccount.getBalance(), toAccount);
						
					    tips = "Successfully transfer";
					    ActionContext.getContext().put("tips", tips);
						return SUCCESS;
					}
					else
					{
						msg="Your balance is insufficient.";
						ID = (String) ActionContext.getContext().getSession().get("loginID");
						acList = accountService.listAccount(ID);	
						return ERROR;
					}
				}
				else
				{
					msg="The card PIN is wrong.";
					ID = (String) ActionContext.getContext().getSession().get("loginID");
					acList = accountService.listAccount(ID);	
					return ERROR;
				}
			}
			else
			{
				msg="The account you want to transfer to is not in conformity with the name.";
				ID = (String) ActionContext.getContext().getSession().get("loginID");
				acList = accountService.listAccount(ID);	
				return ERROR;
			}
		}
		
	}
	
	
	public String userActivation() throws Exception{
		System.out.println("encryted ID:" + ID);
		ID = DES.decrypt(ID);
		System.out.println("decryted ID:" + ID);
		
		if(accountService.listAccount(ID).size() == 1){
			status = 1;
			
			//account.setID(ID);
			account = accountService.findAccount(ID);
			
			account.setStatus(status);			
			accountService.updateAccount(account);
			return SUCCESS;
		}
		else
		{
			msg = "The user does not exist, Please contact with our Bank: 0754-12345678";
			return ERROR;
		}
	}
	public String userChangePwd() throws Exception{	
		JOptionPane.setDefaultLocale(Locale.ENGLISH); 
		Object[] option = {"Return"};
		
		System.out.println("ID:" + ID);
		
		ID = DES.decrypt(ID);
		System.out.println("deID:" + ID);
		
		if(pwd.trim()==""||conPwd.trim()==""){
			msg = "Password can not be empty!";
			System.out.println(msg);
			return ERROR;
		}
		else if(pwd.length() >= 6){
			if(pwd.matches(pwd_regex)){
				if(pwd.equals(conPwd)){
					user = userService.getUser(ID);
					user.setPwd(pwd);

					userService.updateUser(user);
					
					JOptionPane.showOptionDialog(null, "The password has already changed!", 
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
			JOptionPane.showMessageDialog(null, "Your password must be at least 6 characters!", 
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
			if(userService.isMail(ID, email)){
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
			if(userService.getUser(ID) != null){
				rTips = "This ID had been registered.";
				ActionContext.getContext().put("rTips",rTips );
				return ERROR;
			}else{
			userService.addUser(ID,name, pwd1, email,3);
			User user = userService.getUser(ID);
			ActionContext.getContext().getSession().put("customer", customer);
			ActionContext.getContext().getSession().put("user", user);
//				if(EmailUtils.sendAccountActivateEmail(user)){
//					rTips="Create a user successfully.There will be an verification mail send to your security email.";
//					ActionContext.getContext().put("rTips", rTips);		
//				}
			return SUCCESS;
			}
		} else if (ID != null || name != null){
			rTips = "Wrong ID or name.";
			ActionContext.getContext().put("rTips",rTips );
			return ERROR;
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

	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public double gettBalance() {
		return tBalance;
	}
	public void settBalance(double tBalance) {
		this.tBalance = tBalance;
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
	public int getT_id() {
		return t_id;
	}
	public void setT_id(int t_id) {
		this.t_id = t_id;
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
	public Account getAccount() {
		return account;
	}
	public void setAccount(Account account) {
		this.account = account;
	}
	public List<Account> getAcList() {
		return acList;
	}
	public void setAcList(List<Account> acList) {
		this.acList = acList;
	}
	public Account getToAccount() {
		return toAccount;
	}
	public void setToAccount(Account toAccount) {
		this.toAccount = toAccount;
	}
	public double getAmount() {
		return amount;
	}
	public void setAmount(double amount) {
		this.amount = amount;
	}
	public String getToAc_No() {
		return toAc_No;
	}
	public void setToAc_No(String toAc_No) {
		this.toAc_No = toAc_No;
	}
	public String getToName() {
		return toName;
	}
	public void setToName(String toName) {
		this.toName = toName;
	}
	public String getPIN() {
		return PIN;
	}
	public void setPIN(String pIN) {
		PIN = pIN;
	}
	public String getAc_No() {
		return ac_No;
	}
	public void setAc_No(String ac_No) {
		this.ac_No = ac_No;
	}
	public String getType2() {
		return type2;
	}
	public void setType2(String type2) {
		this.type2 = type2;
	}
	
}
