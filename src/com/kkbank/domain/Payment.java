package com.kkbank.domain;

import java.sql.Date;

public class Payment {
	private String bNo;
	private String bItem;
	private Date start_date;
	private Date end_date;
	private double amount;
	private String ID;
	private String detail;
	private int status;
	
	public Payment(){
		super();
	}

	public Payment(String bNo, String bItem, Date start_date, Date end_date, double amount, String iD, String detail,
			int status) {
		super();
		this.bNo = bNo;
		this.bItem = bItem;
		this.start_date = start_date;
		this.end_date = end_date;
		this.amount = amount;
		ID = iD;
		this.detail = detail;
		this.status = status;
	}

	
	public String getbNo() {
		return bNo;
	}
	public void setbNo(String bNo) {
		this.bNo = bNo;
	}
	public String getbItem() {
		return bItem;
	}
	public void setbItem(String bItem) {
		this.bItem = bItem;
	}
	public Date getStart_date() {
		return start_date;
	}
	public void setStart_date(Date start_date) {
		this.start_date = start_date;
	}
	public Date getEnd_date() {
		return end_date;
	}
	public void setEnd_date(Date end_date) {
		this.end_date = end_date;
	}
	public double getAmount() {
		return amount;
	}
	public void setAmount(double amount) {
		this.amount = amount;
	}
	public String getID() {
		return ID;
	}
	public void setID(String iD) {
		ID = iD;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	
	public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}

	
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((ID == null) ? 0 : ID.hashCode());
		long temp;
		temp = Double.doubleToLongBits(amount);
		result = prime * result + (int) (temp ^ (temp >>> 32));
		result = prime * result + ((bItem == null) ? 0 : bItem.hashCode());
		result = prime * result + ((bNo == null) ? 0 : bNo.hashCode());
		result = prime * result + ((detail == null) ? 0 : detail.hashCode());
		result = prime * result + ((end_date == null) ? 0 : end_date.hashCode());
		result = prime * result + ((start_date == null) ? 0 : start_date.hashCode());
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
		Payment other = (Payment) obj;
		if (ID == null) {
			if (other.ID != null)
				return false;
		} else if (!ID.equals(other.ID))
			return false;
		if (Double.doubleToLongBits(amount) != Double.doubleToLongBits(other.amount))
			return false;
		if (bItem == null) {
			if (other.bItem != null)
				return false;
		} else if (!bItem.equals(other.bItem))
			return false;
		if (bNo == null) {
			if (other.bNo != null)
				return false;
		} else if (!bNo.equals(other.bNo))
			return false;
		if (detail == null) {
			if (other.detail != null)
				return false;
		} else if (!detail.equals(other.detail))
			return false;
		if (end_date == null) {
			if (other.end_date != null)
				return false;
		} else if (!end_date.equals(other.end_date))
			return false;
		if (start_date == null) {
			if (other.start_date != null)
				return false;
		} else if (!start_date.equals(other.start_date))
			return false;
		if (status != other.status)
			return false;
		return true;
	}

}
