package com.kkbank.domain;

import java.util.Set;

public class Account {
	
	private String ac_No;
	private String ID;
	private String password;
	private double balance;
	private int status;
	private Customer customer;
	private Set<Transaction> transactions;
	private Set<TimeDeposit> timeDeposits;
	
	public Account() {
		super();
	}

	public Account(String ac_No, String iD, String password, double balance,
			int status, Customer customer, Set<Transaction> transactions,
			Set<TimeDeposit> timeDeposits) {
		super();
		this.ac_No = ac_No;
		ID = iD;
		this.password = password;
		this.balance = balance;
		this.status = status;
		this.customer = customer;
		this.transactions = transactions;
		this.timeDeposits = timeDeposits;
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

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
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


	public Customer getCustomer() {
		return customer;
	}


	public void setCustomer(Customer customer) {
		this.customer = customer;
	}


	public Set<Transaction> getTransactions() {
		return transactions;
	}


	public void setTransactions(Set<Transaction> transactions) {
		this.transactions = transactions;
	}


	public Set<TimeDeposit> getTimeDeposits() {
		return timeDeposits;
	}


	public void setTimeDeposits(Set<TimeDeposit> timeDeposits) {
		this.timeDeposits = timeDeposits;
	}


	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((ID == null) ? 0 : ID.hashCode());
		result = prime * result + ((ac_No == null) ? 0 : ac_No.hashCode());
		long temp;
		temp = Double.doubleToLongBits(balance);
		result = prime * result + (int) (temp ^ (temp >>> 32));
		result = prime * result
				+ ((customer == null) ? 0 : customer.hashCode());
		result = prime * result
				+ ((password == null) ? 0 : password.hashCode());
		result = prime * result + status;
		result = prime * result
				+ ((timeDeposits == null) ? 0 : timeDeposits.hashCode());
		result = prime * result
				+ ((transactions == null) ? 0 : transactions.hashCode());
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
		Account other = (Account) obj;
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
		if (Double.doubleToLongBits(balance) != Double
				.doubleToLongBits(other.balance))
			return false;
		if (customer == null) {
			if (other.customer != null)
				return false;
		} else if (!customer.equals(other.customer))
			return false;
		if (password == null) {
			if (other.password != null)
				return false;
		} else if (!password.equals(other.password))
			return false;
		if (status != other.status)
			return false;
		if (timeDeposits == null) {
			if (other.timeDeposits != null)
				return false;
		} else if (!timeDeposits.equals(other.timeDeposits))
			return false;
		if (transactions == null) {
			if (other.transactions != null)
				return false;
		} else if (!transactions.equals(other.transactions))
			return false;
		return true;
	}
}