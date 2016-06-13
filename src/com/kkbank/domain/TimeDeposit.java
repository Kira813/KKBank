package com.kkbank.domain;

import java.util.Date;

public class TimeDeposit {
	private int id;
	private String type;
	private int term;
	private double amount;
	private String interestRate;
	private Date depositDate;
	private Account account;
	
	public TimeDeposit() {
		super();
	}

	public TimeDeposit(int id, String type, int term, double amount,
			String interestRate, Date depositDate, Account account) {
		super();
		this.id = id;
		this.type = type;
		this.term = term;
		this.amount = amount;
		this.interestRate = interestRate;
		this.depositDate = depositDate;
		this.account = account;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
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
	public String getInterestRate() {
		return interestRate;
	}
	public void setInterestRate(String interestRate) {
		this.interestRate = interestRate;
	}
	public Date getDepositDate() {
		return depositDate;
	}
	public void setDepositDate(Date depositDate) {
		this.depositDate = depositDate;
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
		result = prime * result
				+ ((depositDate == null) ? 0 : depositDate.hashCode());
		result = prime * result + id;
		result = prime * result
				+ ((interestRate == null) ? 0 : interestRate.hashCode());
		result = prime * result + term;
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
		TimeDeposit other = (TimeDeposit) obj;
		if (account == null) {
			if (other.account != null)
				return false;
		} else if (!account.equals(other.account))
			return false;
		if (Double.doubleToLongBits(amount) != Double
				.doubleToLongBits(other.amount))
			return false;
		if (depositDate == null) {
			if (other.depositDate != null)
				return false;
		} else if (!depositDate.equals(other.depositDate))
			return false;
		if (id != other.id)
			return false;
		if (interestRate == null) {
			if (other.interestRate != null)
				return false;
		} else if (!interestRate.equals(other.interestRate))
			return false;
		if (term != other.term)
			return false;
		if (type == null) {
			if (other.type != null)
				return false;
		} else if (!type.equals(other.type))
			return false;
		return true;
	}

}
