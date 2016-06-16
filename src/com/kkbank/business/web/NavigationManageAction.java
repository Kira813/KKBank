package com.kkbank.business.web;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;


import java.util.Set;

import org.apache.struts2.ServletActionContext;
import org.json.JSONArray;
import org.json.JSONObject;

import com.kkbank.business.service.IAccountService;
import com.kkbank.business.service.ITransactionService;
import com.kkbank.business.service.impl.AccountService;
import com.kkbank.business.service.impl.TransactionService;
import com.kkbank.domain.Account;
import com.kkbank.domain.Transaction;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.show.api.ShowApiRequest;

public class NavigationManageAction extends ActionSupport{
	private static final long serialVersionUID = 1L;
	
	private List<Account> acList;
	private String ID;
	private String ac_No;
	private int term;
	private double amount;
	private String PIN;
	private String pin;
	private boolean confirm;
	private double rate;
	private String currency;
	private double amt;
	
	IAccountService accountService = new AccountService();
	ITransactionService transactionService = new TransactionService();
	
	public String toForeignConfirm() throws Exception{
		ActionContext.getContext().put("ac_No", ac_No);
		double rmb = amt*rate; 
		ActionContext.getContext().put("amt", rmb );
        double bal = accountService.getAccount(ac_No).getBalance();
        ActionContext.getContext().put("balance", bal);
		ActionContext.getContext().put("rate", rate);
		ActionContext.getContext().put("currency", currency);
		return SUCCESS;
	}
	public String toForeign() throws Exception{
		// 105-31 一个汇率
		// 105-30  很多个汇率
		String res=new ShowApiRequest("http://route.showapi.com/105-30", "20612", "aa4b6aa11d3943ca8c0973570fdf23dc")
        .addTextPara("code", "")
        .post();
		
        System.out.println(res);
        
        JSONObject json = new JSONObject(res);
        JSONArray list = json.getJSONObject("showapi_res_body").getJSONArray("list");
        
        ActionContext.getContext().put("res", res);
        ActionContext.getContext().put("ac_No", ac_No);
        double bal = accountService.getAccount(ac_No).getBalance();
        ActionContext.getContext().put("balance", bal);
		return SUCCESS;
	}
	public String toExchange() throws Exception{
		ID = (String) ActionContext.getContext().getSession().get("loginID");
		acList = accountService.listAccount(ID);
		ActionContext.getContext().put("acList", acList);
		return SUCCESS;
	}
	public String toForeignExchange() throws Exception{
		return SUCCESS;
	}
	public String toTimeDepositConfirm() throws Exception{

		ActionContext.getContext().put("ac_No", ac_No);
		ActionContext.getContext().put("amount", amount);
		ActionContext.getContext().put("term", term);
		PIN = accountService.getAccount(ac_No).getPassword();
		ActionContext.getContext().put("PIN", PIN);
		//不能在这里做判断 应该在提交表单的action返回的success那里放tips，dialog也要写在那个页面
		//if(pin == PIN){
		//	String tips = "Deposit successfully.";
		//	ActionContext.getContext().put("tips", tips);
		//} 
		double rateOfReturn;		
		Calendar cal = Calendar.getInstance();//使用默认时区和语言环境获得一个日历。    
		cal.add(Calendar.MONTH, + term);
		java.text.SimpleDateFormat format = new java.text.SimpleDateFormat("yyyy-MM-dd");    
		System.out.println("Today is:"+format.format(Calendar.getInstance().getTime())); 
		System.out.println("maturityDate is:"+format.format(cal.getTime()));  
		System.out.println("pin is:"+PIN); 
		double interestRate;
		String period;
		if(term!=0){
			switch(term){
			case 3:
				interestRate = 1.35;
				period="3 months";
				break;
			case 6:
				interestRate = 1.55;
				period="6 months";
				break;
			case 12:
				interestRate = 1.75;
				period="1 year";
				break;
			case 24:
				interestRate = 2.25;
				period="2 years";
				break;
			case 36:
				interestRate = 2.75;
				period="3 years";
				break;
			default:
				interestRate = 2.75;
				period="5 years";
			}
			rateOfReturn = interestRate * term / 12;
			//DecimalFormat df = new DecimalFormat("#.00");
			String rateReturn = String.format("%.2f", rateOfReturn);
			//String rateReturn = df.format(rateOfReturn);  这个方法0没了
			ActionContext.getContext().put("intRate",interestRate);
			ActionContext.getContext().put("rateReturn",rateReturn);
			ActionContext.getContext().put("period", period);
		}
			ActionContext.getContext().put("date",format.format(cal.getTime()));
		return SUCCESS;
	}
	public String toTimeDeposit() throws Exception{
		if(confirm){
			String tips = "Deposit successfully.";
			ActionContext.getContext().put("tips", tips);
		}
		ID = (String) ActionContext.getContext().getSession().get("loginID");
		acList = accountService.listAccount(ID);
		ActionContext.getContext().put("acList", acList);
		return SUCCESS;
	}
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
		List<Transaction> list = transactionService.listTransaction(account);
		ActionContext.getContext().put("list", list);
		ActionContext.getContext().put("ac_No", ac_No);
		return SUCCESS;
	}
	public String toTransctionHistory() throws Exception{
		String ac_No = ServletActionContext.getRequest().getParameter("ac_No");
		Account account = accountService.getAccount(ac_No);
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

	public String getAc_No() {
		return ac_No;
	}
	public void setAc_No(String ac_No) {
		this.ac_No = ac_No;
	}

	public double getRate() {
		return rate;
	}
	public void setRate(double rate) {
		this.rate = rate;
	}
	public String getCurrency() {
		return currency;
	}
	public void setCurrency(String currency) {
		this.currency = currency;
	}
	public double getAmt() {
		return amt;
	}
	public void setAmt(double amt) {
		this.amt = amt;
	}
	public String getPIN() {
		return PIN;
	}
	public void setPIN(String pIN) {
		PIN = pIN;
	}
	
	public String getPin() {
		return pin;
	}
	public void setPin(String pin) {
		this.pin = pin;
	}
	public int getTerm() {
		return term;
	}
	public void setTerm(int term) {
		this.term = term;
	}
	public double getAmount() {
		return amount;
	}
	public void setAmount(double amount) {
		this.amount = amount;
	}
	
	public boolean isConfirm() {
		return confirm;
	}
	public void setConfirm(boolean confirm) {
		this.confirm = confirm;
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
