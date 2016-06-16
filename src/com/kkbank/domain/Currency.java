package com.kkbank.domain;

public class Currency {
	private String ac_No;
	private double USD;
	private double JPY;
	private double HKD;
	private double GBP;
	private double AUD;
	private Account account;

	public Currency() {
		super();
	}

	public Currency(String ac_No, double uSD, double jPY, double hKD,
			double gBP, double aUD, Account account) {
		super();
		this.ac_No = ac_No;
		USD = uSD;
		JPY = jPY;
		HKD = hKD;
		GBP = gBP;
		AUD = aUD;
		this.account = account;
	}

	public String getAc_No() {
		return ac_No;
	}

	public void setAc_No(String ac_No) {
		this.ac_No = ac_No;
	}




	public Account getAccount() {
		return account;
	}
	public void setAccount(Account account) {
		this.account = account;
	}
	public double getUSD() {
		return USD;
	}
	public void setUSD(double uSD) {
		USD = uSD;
	}
	public double getJPY() {
		return JPY;
	}
	public void setJPY(double jPY) {
		JPY = jPY;
	}
	public double getHKD() {
		return HKD;
	}
	public void setHKD(double hKD) {
		HKD = hKD;
	}
	public double getGBP() {
		return GBP;
	}
	public void setGBP(double gBP) {
		GBP = gBP;
	}
	public double getAUD() {
		return AUD;
	}
	public void setAUD(double aUD) {
		AUD = aUD;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		long temp;
		temp = Double.doubleToLongBits(AUD);
		result = prime * result + (int) (temp ^ (temp >>> 32));
		temp = Double.doubleToLongBits(GBP);
		result = prime * result + (int) (temp ^ (temp >>> 32));
		temp = Double.doubleToLongBits(HKD);
		result = prime * result + (int) (temp ^ (temp >>> 32));
		temp = Double.doubleToLongBits(JPY);
		result = prime * result + (int) (temp ^ (temp >>> 32));
		temp = Double.doubleToLongBits(USD);
		result = prime * result + (int) (temp ^ (temp >>> 32));
		result = prime * result + ((ac_No == null) ? 0 : ac_No.hashCode());
		result = prime * result + ((account == null) ? 0 : account.hashCode());
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
		Currency other = (Currency) obj;
		if (Double.doubleToLongBits(AUD) != Double.doubleToLongBits(other.AUD))
			return false;
		if (Double.doubleToLongBits(GBP) != Double.doubleToLongBits(other.GBP))
			return false;
		if (Double.doubleToLongBits(HKD) != Double.doubleToLongBits(other.HKD))
			return false;
		if (Double.doubleToLongBits(JPY) != Double.doubleToLongBits(other.JPY))
			return false;
		if (Double.doubleToLongBits(USD) != Double.doubleToLongBits(other.USD))
			return false;
		if (ac_No == null) {
			if (other.ac_No != null)
				return false;
		} else if (!ac_No.equals(other.ac_No))
			return false;
		if (account == null) {
			if (other.account != null)
				return false;
		} else if (!account.equals(other.account))
			return false;
		return true;
	}

}
