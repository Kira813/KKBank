package com.kkbank.util.api;

import java.util.List;

import com.kkbank.business.service.IFundService;
import com.kkbank.business.service.IMyFundService;
import com.kkbank.business.service.impl.FundService;
import com.kkbank.business.service.impl.MyFundService;
import com.kkbank.domain.Fund;
import com.kkbank.domain.MyFund;

public class FundConfirm {
	static IMyFundService myFundService = new MyFundService();
	static IFundService fundService = new FundService();
	static MyFund myFund = new MyFund();
	static Fund fund = new Fund();
	
	private static String fCode;
	private static double nav;
	
	public static void confirmPurchaseFund(){
		int status = 0;
		//myFund = myFundService.findNotConfirm(status);
		
		List<MyFund> mylist = myFundService.findNotConfirm(status);
		
		System.out.println(mylist);
		
		if(mylist ==  null){
			System.out.println("There is no apply to confirm");
		}
		else{
			for(int i = 0; i < mylist.size(); i++){
				fCode = mylist.get(i).getFund().getfCode();
				nav = fundService.get(fCode).getNav();
				myFund.setNav(nav);
				myFund.setStatus(1);
				myFundService.update(myFund);
			}			
		}
		
	}
	
	/*public static void confirmRedeemFund(){
		
	}*/

	public static void main(String[] args) {
		confirmPurchaseFund();
	}
	
}
