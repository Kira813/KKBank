package com.kkbank.business.web;

import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Set;

import com.kkbank.business.service.IAccountService;
import com.kkbank.business.service.ICustomerService;
import com.kkbank.business.service.ITimeDepositService;
import com.kkbank.business.service.ITransactionService;
import com.kkbank.business.service.impl.AccountService;
import com.kkbank.business.service.impl.CustomerService;
import com.kkbank.business.service.impl.TimeDepositService;
import com.kkbank.business.service.impl.TransactionService;
import com.kkbank.domain.Account;
import com.kkbank.domain.Customer;
import com.kkbank.domain.Transaction;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class AccountManageAction extends ActionSupport{
	 private static final long serialVersionUID = 1L;
	/*
	 * serialVersionUID用来作为Java对象序列化中的版本标示之用； 如果一个序列化类没有声明这样一个static
	 * final的产量，JVM会根据各种参数为这个类计算一个； 对于同样一个类，不同版本的JDK可能会得出不同的serivalVersionUID;
	 */
	protected IAccountService accountService = new AccountService();
	protected ICustomerService customerService = new CustomerService();
	protected ITimeDepositService timeDepositService = new TimeDepositService();
	protected ITransactionService transactionService = new TransactionService();

	private String ID;
	private String ac_No;
	private String ac_No2;
	private String password;
	private String password1;
	private double balance;
	private int status;
	private Customer customer;
	private Set<Transaction> transactions;
	private String name;
	private String PIN;
	private String tips;
	private double amount;
	private int term;
	private double intRate;
	private boolean confirm;
	private int t_id;

	private HashMap<String, Object> resultMap = new HashMap<String, Object>();

	public String timeDepositConfirm() throws Exception{
		Date depositDate = new Date();
		Calendar cal = Calendar.getInstance();//使用默认时区和语言环境获得一个日历。    
		cal.add(Calendar.MONTH, + term);//cal.getTime()
		Account account = accountService.getAccount(ac_No);
		timeDepositService.addTimeDeposit("Lump Fixed Deposit", term, amount, intRate, depositDate,cal.getTime(), account);
		
		double bal = account.getBalance() - amount;
		System.out.println(bal);
		account.setBalance(bal);
		accountService.updateAccount(account);
		
		String type="Time Deposit";
	    Date date = new Date();
		t_id = transactionService.addTransaction(t_id, date, type, amount, bal, account);

		return SUCCESS;
	}
	
	public String delAccount() throws Exception{
		String sTips = null;
		Account account = accountService.getAccount(ac_No);
		
		if(account != null){
			double balance = account.getBalance();
			if(balance > 0) {
				sTips="Balance:"+balance+" This account can't be closed now."; //useless
				ActionContext.getContext().put("sTips", sTips);
			} else {
				accountService.delAccount(account);
			}
			return SUCCESS;
		}
		return SUCCESS;
	}
	
	public String addAccount() throws Exception {
		Customer customer = new Customer();
		customer.setID(ID);
		customer.setName(name);
		if (customerService.checkCustomer(customer) == true) {
			customer = customerService.getCustomer(customer);

			// 创建一个 account, 并通过返回的 ac_no 获取到刚创建的 account
			String ac_no = accountService.addAccount(ID, password1, 0.0, 1,
					customer,null);
			
			Account account = accountService.getAccount(ac_no);

			ActionContext.getContext().getSession().put("customer", customer);
			ActionContext.getContext().getSession().put("account", account);

			return SUCCESS;
		}
		//ActionContext都是用来存放数据的。Struts2本身会在其中放入不少数据，而使用者也可以放入自己想要的数据
		//ActionContext.getContext().put("tips", "Wrong ID or Name");
		tips= "Wrong ID or Name";
		return "opencard";
	}
	
	public String getBalanceAjax() throws Exception {
		resultMap = new HashMap<String, Object>();
		Account account = accountService.getAccount(ac_No);
		
		if(account != null) {
			Double balance = account.getBalance();
			DecimalFormat df = new DecimalFormat("#,##0.00");
			String bal = df.format(balance);
			
			if(balance == 0) {
				resultMap.put("txt", bal);
				resultMap.put("balance", balance);
				resultMap.put("status", true);
			} else {
				resultMap.put("txt", bal);
				resultMap.put("balance", balance);
				resultMap.put("status", true);
				resultMap.put("tips", "You can't close this account,since this account still has " + balance + " right now.");
			}
			
		} else {
			resultMap.put("status", false);
		}
		
		return SUCCESS;
	}
	
	public String getAcnoAjax() throws Exception {
		resultMap = new HashMap<String, Object>();
		Account account = accountService.getAccount(ac_No);
		if(account == null) {
			resultMap.put("tips", "Wrong ac_No");
			resultMap.put("status", false);
		} else {
			resultMap.put("status", true);
		}
		return SUCCESS;
	}
	
	public String getAccountAjax() throws Exception{
		resultMap = new HashMap<String, Object>();
		Account account = accountService.getAccount(ac_No);
		Account account2 = accountService.getAccount(ac_No2);//the transfer out account
		resultMap.put("status", true);
		if(account == null){
			resultMap.put("tips", "Wrong ac_No");
			resultMap.put("status", false);
		} else if(account.getStatus() == 2) {
			resultMap.put("tips", "Account is locked.");
			resultMap.put("status", false);
		} else if(customerService.isValidAccount(account.getID(), name)){
			resultMap.put("acStatus", true);
			if(account2.getPassword().equals(PIN)){
				resultMap.put("PINStatus", true);
			} else{
				resultMap.put("PINStatus", false);
			}
		}else{
			resultMap.put("acStatus", false);
		}
		return SUCCESS;
	}

	public String unlockAjax() throws Exception{
		resultMap = new HashMap<String, Object>();
		Account account = accountService.getAccount(ac_No);
		if(account.getStatus() == 2)
		{
			resultMap.put("result", true);	
		}
		else
		{
			resultMap.put("result", false);
			resultMap.put("tips", "The operation is invalid. This account is not locked.");
		}
		return SUCCESS;
		
	}
	
	public String unlock() throws Exception{
		String sTips = null;
		Account account = accountService.getAccount(ac_No);
		
		if(account != null){
			status = 1;
			account.setStatus(status);
			accountService.updateAccount(account);
			return SUCCESS;
		}
		
		return ERROR;
	}

	public String frozenAjax() throws Exception{
		resultMap = new HashMap<String, Object>();
		Account account = accountService.getAccount(ac_No);
		if(account.getStatus() == 2)
		{
			resultMap.put("result", 1);	
		}
		else if(account.getStatus() == 5)
		{
			resultMap.put("result", 2);	
		}
		else
		{
			resultMap.put("result", 0);
			resultMap.put("tips", "Successfully frozen this account.");
		}
		return SUCCESS;	
	}
	
	public String frozen() throws Exception{
		String sTips = null;
		Account account = accountService.getAccount(ac_No);
		
		if(account != null){
			status = 5;
			account.setStatus(status);
			accountService.updateAccount(account);
			return SUCCESS;
		}
		
		return ERROR;
	}
	
	public String unfreezeAjax() throws Exception{
		resultMap = new HashMap<String, Object>();
		Account account = accountService.getAccount(ac_No);
		if(account.getStatus() == 5)
		{
			resultMap.put("result", 0);	
			resultMap.put("tips", "This account is frozen.");
		}
		else
		{
			resultMap.put("result", 1);
		}
		return SUCCESS;	
	}
	
	public String unfreeze() throws Exception{
		String sTips = null;
		Account account = accountService.getAccount(ac_No);
		
		if(account != null){
			status = 1;
			account.setStatus(status);
			accountService.updateAccount(account);
			return SUCCESS;
		}
		
		return ERROR;
	}
	
	public String openCard() throws Exception {
		return SUCCESS;
	}
	
	public String returnMain() throws Exception {
		return SUCCESS;
	}

	public String getID() {
		return ID;
	}

	public void setID(String id) {
		ID = id;
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

	public String getAc_No() {
		return ac_No;
	}

	public void setAc_No(String ac_No) {
		this.ac_No = ac_No;
	}
	
	

	public String getAc_No2() {
		return ac_No2;
	}

	public void setAc_No2(String ac_No2) {
		this.ac_No2 = ac_No2;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPassword1() {
		return password1;
	}

	public void setPassword1(String password1) {
		this.password1 = password1;
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

	public Set<Transaction> getTransactions() {
		return transactions;
	}

	public void setTransactions(Set<Transaction> transactions) {
		this.transactions = transactions;
	}

	public String getPIN() {
		return PIN;
	}

	public void setPIN(String pIN) {
		PIN = pIN;
	}

	public double getAmount() {
		return amount;
	}

	public void setAmount(double amount) {
		this.amount = amount;
	}

	public int getTerm() {
		return term;
	}

	public void setTerm(int term) {
		this.term = term;
	}

	public double getIntRate() {
		return intRate;
	}

	public void setIntRate(double intRate) {
		this.intRate = intRate;
	}

	public String getTips() {
		return tips;
	}

	public void setTips(String tips) {
		this.tips = tips;
	}

	public boolean isConfirm() {
		return confirm;
	}

	public void setConfirm(boolean confirm) {
		this.confirm = confirm;
	}

	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	public HashMap<String, Object> getResultMap() {
		return resultMap;
	}

	public void setResultMap(HashMap<String, Object> resultMap) {
		this.resultMap = resultMap;
	}

	public IAccountService getAccountService() {
		return accountService;
	}

	public void setAccountService(IAccountService accountService) {
		this.accountService = accountService;
	}

	public ICustomerService getCustomerService() {
		return customerService;
	}

	public void setCustomerService(ICustomerService customerService) {
		this.customerService = customerService;
	}

	public ITimeDepositService getTimeDepositService() {
		return timeDepositService;
	}

	public void setTimeDepositService(ITimeDepositService timeDepositService) {
		this.timeDepositService = timeDepositService;
	}

}
