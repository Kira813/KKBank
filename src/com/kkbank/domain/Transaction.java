package com.kkbank.domain;

import java.util.Date;

public class Transaction {
	
	private int t_id;
	private Date date;
	private String type;
	private double amount;
	private double tBalance;
	private Account account;
	
	public Transaction() {
		super();
	}


	public Transaction(int t_id, Date date, String type, double amount,
			double tBalance, Account account) {
		super();
		this.t_id = t_id;
		this.date = date;
		this.type = type;
		this.amount = amount;
		this.tBalance = tBalance;
		this.account = account;
	}


	public int getT_id() {
		return t_id;
	}

	public void setT_id(int t_id) {
		this.t_id = t_id;
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

	public double getAmount() {
		return amount;
	}

	public void setAmount(double amount) {
		this.amount = amount;
	}

	public double gettBalance() {
		return tBalance;
	}

	public void settBalance(double tBalance) {
		this.tBalance = tBalance;
	}

	public Account getAccount() {
		return account;
	}



	public void setAccount(Account account) {
		this.account = account;
	}


	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((account == null) ? 0 : account.hashCode());
		long temp;
		temp = Double.doubleToLongBits(amount);
		result = prime * result + (int) (temp ^ (temp >>> 32));
		result = prime * result + ((date == null) ? 0 : date.hashCode());
		temp = Double.doubleToLongBits(tBalance);
		result = prime * result + (int) (temp ^ (temp >>> 32));
		result = prime * result + t_id;
		result = prime * result + ((type == null) ? 0 : type.hashCode());
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
		Transaction other = (Transaction) obj;
		if (account == null) {
			if (other.account != null)
				return false;
		} else if (!account.equals(other.account))
			return false;
		if (Double.doubleToLongBits(amount) != Double
				.doubleToLongBits(other.amount))
			return false;
		if (date == null) {
			if (other.date != null)
				return false;
		} else if (!date.equals(other.date))
			return false;
		if (Double.doubleToLongBits(tBalance) != Double
				.doubleToLongBits(other.tBalance))
			return false;
		if (t_id != other.t_id)
			return false;
		if (type == null) {
			if (other.type != null)
				return false;
		} else if (!type.equals(other.type))
			return false;
		return true;
	}

}