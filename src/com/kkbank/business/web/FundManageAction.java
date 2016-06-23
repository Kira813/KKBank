package com.kkbank.business.web;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.swing.JOptionPane;
import org.apache.struts2.ServletActionContext;

/*import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;*/
import com.kkbank.business.service.IAccountService;
import com.kkbank.business.service.ICustomerService;
import com.kkbank.business.service.IFundService;
import com.kkbank.business.service.IMyFundService;
import com.kkbank.business.service.ITransactionService;
import com.kkbank.business.service.impl.AccountService;
import com.kkbank.business.service.impl.CustomerService;
import com.kkbank.business.service.impl.FundService;
import com.kkbank.business.service.impl.MyFundService;
import com.kkbank.business.service.impl.TransactionService;
import com.kkbank.domain.Account;
import com.kkbank.domain.Fund;
import com.kkbank.domain.MyFund;
import com.kkbank.util.api.FundAPI;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;
import net.sf.json.util.PropertyFilter;

public class FundManageAction extends ActionSupport{
	IFundService fundService = new FundService();
	IAccountService accountService = new AccountService();
	IMyFundService myFundService = new MyFundService();
	
	private String fName;
	private String fCode;
	private String fType;
	private double fAnnualized_rate;
	private String fBackground;
	private String fManage;
	private String fInvest_portfolio;
	private double fPur_rate;	

	Fund fund = new Fund();
	
	List<Fund> fundli;
	List<MyFund> myfundli;
	
	List<Account> acList;
	private String ID;
	private String ac_No;
	private double amount;
	private String PIN;
	private double balance;
	private String msg;
	Account account = new Account();
	MyFund myFund = new MyFund();
	
	private int fund_id;
	private Date dealDate;
	private double income;
	private int myStatus;
	private double nav;
	private double share;
	
	//transaction
	protected ITransactionService transactionService = new TransactionService();
	private int t_id;
	
	//customer
	ICustomerService customerService = new CustomerService();
	private String name;
	
	
	
	//list all the fund
	public String listFund() throws Exception{		
    	//getRequest1();
    	/*fund = fundService.get("000997");
    	fund.setfBackground("managementCompany:南方基金管理有限公司; custodian:交通银行股份有限公司; 本基金主要投资于国内依法发行和上市交易的国债、央行票据、金融债券、企业债券、公司债券、中期票据、短期融资券、超短期融资券、次级债券、政府机构债券、地方政府债券、资产支持证券、信贷资产支持证券、可交换债券、减记债券、中小企业私募债券、可转换债券、债券回购、银行存款、货币市场工具、国债期货以及经中国证监会允许基金投资的其他金融工具，但需符合中国证监会的相关规定。");
    	fund.setfManage("何康");
    	fund.setfInvest_portfolio("本基金为债券型基金，其长期平均风险和预期收益率低于股票型基金、混合型基金，高于货币市场基金。");
    	fundService.update(fund);*/
    	fundli = fundService.findAllFund();  
		return SUCCESS;
	}

	//look at fund details
	public String toFundDetail(){
		fCode = ServletActionContext.getRequest().getParameter("fCode");
		fundli = fundService.findFundDetail(fCode);
		return SUCCESS;
	}
	
	//click "Purchase" button to confirmation page
	public String toFundTradingConfirm(){
		ID = (String) ActionContext.getContext().getSession().get("loginID");
		acList = accountService.listAccount(ID);
		fCode = ServletActionContext.getRequest().getParameter("fCode");
		fName = fundService.get(fCode).getfName();
		return SUCCESS;
	}
	
	//purchase fund
	public String fundPurchase(){
		fund = fundService.get(fCode);
		Object[] option = {"Return"};
		
		ID = (String) ActionContext.getContext().getSession().get("loginID");
		acList = accountService.listAccount(ID);
		fName = fundService.get(fCode).getfName();
		
		/*if(ac_No == "null"){
			msg="nullaaaa";
			return ERROR;
		}*/

		System.out.println("account:" + ac_No);
		account = accountService.getAccount(ac_No);
		if(account.getStatus() == 2){
			msg = "This account is locked. Please contact system administrator";
			return ERROR;
		}
		
		if(account.getStatus() == 5){
			msg = "This account is frozen. Please contact system administrator";
			return ERROR;
		}
		
		//retrieval password
		if(account.getPassword().equals(PIN)){
			
			//amount should be at least 1000
			if(amount >= 1000){
				if(amount <= account.getBalance()){			
					//set myFund's attribute
					myFund.setFund_id(0);
					myFund.setFund(fund);
					myFund.setAc_No(ac_No);
					myFund.setID(ID);
					myFund.setAmount(amount);
					myFund.setDealDate(new Date());
					myFund.setStatus(0);
						
					//insert the record
					myFundService.save(myFund);
						
					//update the balance from corresponding account
					balance = account.getBalance() - amount;
					account.setBalance(balance);
					accountService.updateAccount(account);

					//insert transaction record
					t_id = transactionService.addTransaction(t_id, new Date(), "Fund buy", amount, account.getBalance(), account);
					
					//msg="You have purchased successfully";
					//JOptionPane.showOptionDialog(null, "You have purchased successfully", 
					//		"Tips", JOptionPane.DEFAULT_OPTION, JOptionPane.INFORMATION_MESSAGE, null, option, option[0]);
					return SUCCESS;				
				}
				else{
					msg = "Your balance is insufficient.";
					return ERROR;
				}
			}
			else{
				msg = "The amount is at least 1000";
				return ERROR;
			}			
		}
		else{
			msg = "Your card PIN is wrong";
			return ERROR;
		}
	}
	
	//to show my fund which i have bought
	public String listMyFund(){
		ID = (String) ActionContext.getContext().getSession().get("loginID");	
		System.out.println("ID:" + ID);
		//confirmPurchaseFund();
		myfundli = myFundService.findMyFund(ID);
		return SUCCESS;
	}
	
	//click "Redeem" button to confirmation page
	public String toFundRedeemConfirm(){
		try{
			fund_id =  Integer.valueOf(ServletActionContext.getRequest().getParameter("fund_id")).intValue();
		}catch(NumberFormatException e){
			e.printStackTrace();
		}

		myFund = myFundService.get(fund_id);
		fCode = myFund.getFund().getfCode();
		fName = myFund.getFund().getfName();
		ID = myFund.getID();
		name = customerService.getCustomer(ID).getName();
		ac_No = myFund.getAc_No();
		dealDate = myFund.getDealDate();
		amount = myFund.getAmount();
		share = myFund.getShare();
		income = ( myFund.getFund().getNav() - myFund.getNav())* share;
		System.out.println(income);
		return SUCCESS;
	}
	
	public String fundRedeem(){
		Object[] option = {"Return"};
		ID = (String) ActionContext.getContext().getSession().get("loginID");
		account = accountService.getAccount(ac_No);
		myFund = myFundService.get(fund_id);
		
		if(account.getPassword().equals(PIN)){
			System.out.println("share:" + share);
			System.out.println("my share" + myFund.getShare());
			if(share < myFund.getShare()){
				//update my fund
				amount = amount - myFund.getNav()* share;
				myFund.setShare(myFund.getShare() - share);
				myFund.setAmount(amount);
				myFundService.update(myFund);
				
				//update my account
				balance = account.getBalance() + myFund.getFund().getNav()* share * (1-0.005);
				account.setBalance(balance);
				accountService.updateAccount(account);
				
				//insert the transaction record
				t_id = transactionService.addTransaction(t_id, new Date(), "Fund Sell", myFund.getFund().getNav()* share * (1-0.005), account.getBalance(), account);
				
				//JOptionPane.showOptionDialog(null, "You have redeemed successfully", 
				//		"Tips", JOptionPane.DEFAULT_OPTION, JOptionPane.INFORMATION_MESSAGE, null, option, option[0]);
				return SUCCESS;
			}
			else if(share == myFund.getShare()){
				//delete the record in my fund
				myFundService.delete(fund_id);
				System.out.println("balance:" + account.getBalance());
				System.out.println(income);
				
				//calculate the balance
				balance = account.getBalance() + (amount + income)*(1-0.005);
				System.out.println(balance);
				
				//update my account
				account.setBalance(balance);
				accountService.updateAccount(account);
				
				//insert the transaction record
				t_id = transactionService.addTransaction(t_id, new Date(), "Fund Sell", (amount + income)*(1-0.005), account.getBalance(), account);
				
				//JOptionPane.showOptionDialog(null, "You have redeemed successfully", 
				//		"Tips", JOptionPane.DEFAULT_OPTION, JOptionPane.INFORMATION_MESSAGE, null, option, option[0]);
				return SUCCESS;
			}
			else{
				fCode = myFund.getFund().getfCode();
				fName = myFund.getFund().getfName();
				ac_No = myFund.getAc_No();
				amount = myFund.getAmount();
				dealDate = myFund.getDealDate();
				share = myFund.getShare();
				income = ( myFund.getFund().getNav() - myFund.getNav())* share;
				msg = "Invalid share amount.";
				return ERROR;
			}
		}
		else{
			fCode = myFund.getFund().getfCode();
			fName = myFund.getFund().getfName();
			ac_No = myFund.getAc_No();
			amount = myFund.getAmount();
			dealDate = myFund.getDealDate();
			share = myFund.getShare();
			income = ( myFund.getFund().getNav() - myFund.getNav())* share;
			msg = "Your card PIN is wrong.";
			return ERROR;
		}
	}
	
	
	
	
	/*
	**Other methods
	*/
	
	//ask real-time data
	public void getRequest1(){
        String result =null;
        String url ="http://apis.haoservice.com/lifeservice/netdata/all";//请求接口地址
        Map params = new HashMap();//请求参数
            params.put("key", FundAPI.APPKEY);//APPKEY值
 
        try {
            result = FundAPI.net(url, params, "GET");
            JSONObject object = JSONObject.fromObject(result);
            if(object.getInt("error_code")==0){
            	System.out.println(object.get("result"));
            	
            	JSONArray res = object.getJSONArray("result");
                
            	for(int i = 0; i< res.size(); i++){
            		Fund fund1 = new Fund();
            		//fund1 = fundService.get(res.getJSONObject(i).get("code").toString());
            		fund1.setfCode(res.getJSONObject(i).get("code").toString());
        			System.out.println(res.getJSONObject(i).get("code").toString());
        			fund1.setfName(res.getJSONObject(i).get("name").toString());
        			System.out.println(res.getJSONObject(i).get("name").toString());
        			fund1.setfType("Open-End Fund");
        			fund1.setfAnnualized_rate(Double.parseDouble(res.getJSONObject(i).get("annualincome").toString()));
        			System.out.println(Double.parseDouble(res.getJSONObject(i).get("annualincome").toString()));
        			fund1.setNav(Double.parseDouble(res.getJSONObject(i).get("newnet").toString()));
        			fund1.setfPur_rate(0.015);
        			fundService.save(fund1);
        			//fundService.update(fund1);
        		}
            }else{
                System.out.println(object.get("error_code")+":"+object.get("reason"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
	
	//ask for other fund info
	/* public void getRequestInfo(){
	        String result =null;
	        String url =" http://apis.haoservice.com/lifeservice/fund/info?key=79f4969d15ae443794111e8cbfd7a336&";//请求接口地址
	        Map params = new HashMap();//请求参数
	            params.put("code", FundAPI.APPKEY);//APPKEY值
	 
	        try {
	            result = FundAPI.net(url, params, "GET");
	            JSONObject object = JSONObject.fromObject(result);
	            if(object.getInt("error_code")==0){
	                System.out.println(object.get("result"));
	            }else{
	                System.out.println(object.get("error_code")+":"+object.get("reason"));
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }*/
	
	//confirm the fund apply
		public void confirmPurchaseFund(){
			
			List<MyFund> mylist = myFundService.findNotConfirm(0);
			
			System.out.println("list size:" + mylist.size());
			
			if(mylist ==  null)
				System.out.println("There is no apply to confirm");
			
			else{
				for(int i = 0; i < mylist.size(); i++){
					fCode = mylist.get(i).getFund().getfCode();
					myFund = mylist.get(i);
					
					amount = myFund.getAmount();
					System.out.println("amount:" + amount);
					nav = fundService.get(fCode).getNav();
					System.out.println("nav:" + nav);
					share = (amount - amount * myFund.getFund().getfPur_rate())/nav;	
					System.out.println("share:" + share);
					
					myFund.setNav(nav);	
					myFund.setShare(share);
					myFund.setStatus(1);
					myFundService.update(myFund);
				}			
			}
		}
	

		
		
	//getter & setter
	public IFundService getFundService() {
		return fundService;
	}

	public void setFundService(IFundService fundService) {
		this.fundService = fundService;
	}

	public String getFName() {
		return fName;
	}

	public void setFName(String fName) {
		this.fName = fName;
	}

	public String getFCode() {
		return fCode;
	}

	public void setFCode(String fCode) {
		this.fCode = fCode;
	}

	public String getFType() {
		return fType;
	}

	public void setFType(String fType) {
		this.fType = fType;
	}

	public double getFAnnualized_rate() {
		return fAnnualized_rate;
	}

	public void setFAnnualized_rate(double fAnnualized_rate) {
		this.fAnnualized_rate = fAnnualized_rate;
	}

	public String getFBackground() {
		return fBackground;
	}

	public void setFBackground(String fBackground) {
		this.fBackground = fBackground;
	}

	public String getFManage() {
		return fManage;
	}

	public void setFManage(String fManage) {
		this.fManage = fManage;
	}

	public String getFInvest_portfolio() {
		return fInvest_portfolio;
	}

	public void setFInvest_portfolio(String fInvest_portfolio) {
		this.fInvest_portfolio = fInvest_portfolio;
	}

	public double getFPur_rate() {
		return fPur_rate;
	}

	public void setFPur_rate(double fPur_rate) {
		this.fPur_rate = fPur_rate;
	}

	public Fund getFund() {
		return fund;
	}

	public void setFund(Fund fund) {
		this.fund = fund;
	}


	public List<Fund> getFundli() {
		return fundli;
	}

	public void setFundli(List<Fund> fundli) {
		this.fundli = fundli;
	}

	public IAccountService getAccountService() {
		return accountService;
	}

	public void setAccountService(IAccountService accountService) {
		this.accountService = accountService;
	}

	public String getID() {
		return ID;
	}

	public void setID(String iD) {
		ID = iD;
	}

	public List<Account> getAcList() {
		return acList;
	}

	public void setAcList(List<Account> acList) {
		this.acList = acList;
	}

	public String getAc_No() {
		return ac_No;
	}

	public void setAc_No(String ac_No) {
		this.ac_No = ac_No;
	}

	public double getAmount() {
		return amount;
	}

	public void setAmount(double amount) {
		this.amount = amount;
	}

	public String getPIN() {
		return PIN;
	}

	public void setPIN(String pIN) {
		PIN = pIN;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public Account getAccount() {
		return account;
	}

	public void setAccount(Account account) {
		this.account = account;
	}

	public IMyFundService getMyFundService() {
		return myFundService;
	}

	public void setMyFundService(IMyFundService myFundService) {
		this.myFundService = myFundService;
	}

	public double getBalance() {
		return balance;
	}

	public void setBalance(double balance) {
		this.balance = balance;
	}

	public MyFund getMyFund() {
		return myFund;
	}

	public void setMyFund(MyFund myFund) {
		this.myFund = myFund;
	}

	public int getFund_id() {
		return fund_id;
	}

	public void setFund_id(int fund_id) {
		this.fund_id = fund_id;
	}

	public Date getDealDate() {
		return dealDate;
	}

	public void setDealDate(Date dealDate) {
		this.dealDate = dealDate;
	}

	public double getIncome() {
		return income;
	}

	public void setIncome(double income) {
		this.income = income;
	}

	public List<MyFund> getMyfundli() {
		return myfundli;
	}

	public void setMyfundli(List<MyFund> myfundli) {
		this.myfundli = myfundli;
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

	public int getMyStatus() {
		return myStatus;
	}

	public void setMyStatus(int myStatus) {
		this.myStatus = myStatus;
	}

	public double getNav() {
		return nav;
	}

	public void setNav(double nav) {
		this.nav = nav;
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

	public double getShare() {
		return share;
	}

	public void setShare(double share) {
		this.share = share;
	}
	
	
}
