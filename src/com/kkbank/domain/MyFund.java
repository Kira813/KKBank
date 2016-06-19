package com.kkbank.domain;

import java.util.Date;

public class MyFund {
	private int fund_id;
	//private String fCode;
	private String ID;
	private String ac_No;
	private double amount;
	private Date dealDate;
	private double nav;
	private int status;
	private Fund fund;
	
	public MyFund(){
		super();
	}
	
	public MyFund(int fund_id, String iD, String ac_No, double amount, Date dealDate, double nav, int status,
			Fund fund) {
		super();
		this.fund_id = fund_id;
		ID = iD;
		this.ac_No = ac_No;
		this.amount = amount;
		this.dealDate = dealDate;
		this.nav = nav;
		this.status = status;
		this.fund = fund;
	}





	public int getFund_id() {
		return fund_id;
	}

	public void setFund_id(int fund_id) {
		this.fund_id = fund_id;
	}

	public String getID() {
		return ID;
	}

	public void setID(String iD) {
		ID = iD;
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

	public Date getDealDate() {
		return dealDate;
	}

	public void setDealDate(Date dealDate) {
		this.dealDate = dealDate;
	}

	public double getNav() {
		return nav;
	}

	public void setNav(double nav) {
		this.nav = nav;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public Fund getFund() {
		return fund;
	}

	public void setFund(Fund fund) {
		this.fund = fund;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((ID == null) ? 0 : ID.hashCode());
		result = prime * result + ((ac_No == null) ? 0 : ac_No.hashCode());
		long temp;
		temp = Double.doubleToLongBits(amount);
		result = prime * result + (int) (temp ^ (temp >>> 32));
		result = prime * result + ((dealDate == null) ? 0 : dealDate.hashCode());
		//result = prime * result + ((fCode == null) ? 0 : fCode.hashCode());
		result = prime * result + ((fund == null) ? 0 : fund.hashCode());
		result = prime * result + fund_id;
		temp = Double.doubleToLongBits(nav);
		result = prime * result + (int) (temp ^ (temp >>> 32));
		result = prime * result + status;
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		MyFund other = (MyFund) obj;
		if (ID == null) {
			if (other.ID != null)
				return false;
		} else if (!ID.equals(other.ID))
			return false;
		if (ac_No == null) {
			if (other.ac_No != null)
				return false;
		} else if (!ac_No.equals(other.ac_No))
			return false;
		if (Double.doubleToLongBits(amount) != Double.doubleToLongBits(other.amount))
			return false;
		if (dealDate == null) {
			if (other.dealDate != null)
				return false;
		} else if (!dealDate.equals(other.dealDate))
			return false;
		/*if (fCode == null) {
			if (other.fCode != null)
				return false;
		} else if (!fCode.equals(other.fCode))
			return false;*/
		if (fund == null) {
			if (other.fund != null)
				return false;
		} else if (!fund.equals(other.fund))
			return false;
		if (fund_id != other.fund_id)
			return false;
		if (Double.doubleToLongBits(nav) != Double.doubleToLongBits(other.nav))
			return false;
		if (status != other.status)
			return false;
		return true;
	}

	

}
