package com.kkbank.domain;

import java.util.Set;

public class Fund {
	private String fName;
	private String fCode;
	private String fType;
	private double fAnnualized_rate;
	private String fBackground;
	private String fManage;
	private String fInvest_portfolio;
	private double fPur_rate;	
	private double nav;
	private Set<MyFund> myfund;
	
	public Fund() {
		super();
	}

	public Fund(String fName, String fCode, String fType, double fAnnualized_rate, String fBackground, String fManage,
			String fInvest_portfolio, double fPur_rate, double nav, Set<MyFund> myfund) {
		super();
		this.fName = fName;
		this.fCode = fCode;
		this.fType = fType;
		this.fAnnualized_rate = fAnnualized_rate;
		this.fBackground = fBackground;
		this.fManage = fManage;
		this.fInvest_portfolio = fInvest_portfolio;
		this.fPur_rate = fPur_rate;
		this.nav = nav;
		this.myfund = myfund;
	}



	public String getfName() {
		return fName;
	}

	public void setfName(String fName) {
		this.fName = fName;
	}

	public String getfCode() {
		return fCode;
	}

	public void setfCode(String fCode) {
		this.fCode = fCode;
	}

	public String getfType() {
		return fType;
	}

	public void setfType(String fType) {
		this.fType = fType;
	}

	public double getfAnnualized_rate() {
		return fAnnualized_rate;
	}

	public void setfAnnualized_rate(double fAnnualized_rate) {
		this.fAnnualized_rate = fAnnualized_rate;
	}

	public String getfBackground() {
		return fBackground;
	}

	public void setfBackground(String fBackground) {
		this.fBackground = fBackground;
	}

	public String getfManage() {
		return fManage;
	}

	public void setfManage(String fManage) {
		this.fManage = fManage;
	}

	public String getfInvest_portfolio() {
		return fInvest_portfolio;
	}

	public void setfInvest_portfolio(String fInvest_portfolio) {
		this.fInvest_portfolio = fInvest_portfolio;
	}

	public double getfPur_rate() {
		return fPur_rate;
	}

	public void setfPur_rate(double fPur_rate) {
		this.fPur_rate = fPur_rate;
	}

	public double getNav() {
		return nav;
	}

	public void setNav(double nav) {
		this.nav = nav;
	}

	public Set<MyFund> getMyfund() {
		return myfund;
	}

	public void setMyfund(Set<MyFund> myfund) {
		this.myfund = myfund;
	}

	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		long temp;
		temp = Double.doubleToLongBits(fAnnualized_rate);
		result = prime * result + (int) (temp ^ (temp >>> 32));
		result = prime * result + ((fBackground == null) ? 0 : fBackground.hashCode());
		result = prime * result + ((fCode == null) ? 0 : fCode.hashCode());
		result = prime * result + ((fInvest_portfolio == null) ? 0 : fInvest_portfolio.hashCode());
		result = prime * result + ((fManage == null) ? 0 : fManage.hashCode());
		result = prime * result + ((fName == null) ? 0 : fName.hashCode());
		temp = Double.doubleToLongBits(fPur_rate);
		result = prime * result + (int) (temp ^ (temp >>> 32));
		result = prime * result + ((fType == null) ? 0 : fType.hashCode());
		result = prime * result + ((myfund == null) ? 0 : myfund.hashCode());
		temp = Double.doubleToLongBits(nav);
		result = prime * result + (int) (temp ^ (temp >>> 32));
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
		Fund other = (Fund) obj;
		if (Double.doubleToLongBits(fAnnualized_rate) != Double.doubleToLongBits(other.fAnnualized_rate))
			return false;
		if (fBackground == null) {
			if (other.fBackground != null)
				return false;
		} else if (!fBackground.equals(other.fBackground))
			return false;
		if (fCode == null) {
			if (other.fCode != null)
				return false;
		} else if (!fCode.equals(other.fCode))
			return false;
		if (fInvest_portfolio == null) {
			if (other.fInvest_portfolio != null)
				return false;
		} else if (!fInvest_portfolio.equals(other.fInvest_portfolio))
			return false;
		if (fManage == null) {
			if (other.fManage != null)
				return false;
		} else if (!fManage.equals(other.fManage))
			return false;
		if (fName == null) {
			if (other.fName != null)
				return false;
		} else if (!fName.equals(other.fName))
			return false;
		if (Double.doubleToLongBits(fPur_rate) != Double.doubleToLongBits(other.fPur_rate))
			return false;
		if (fType == null) {
			if (other.fType != null)
				return false;
		} else if (!fType.equals(other.fType))
			return false;
		if (myfund == null) {
			if (other.myfund != null)
				return false;
		} else if (!myfund.equals(other.myfund))
			return false;
		if (Double.doubleToLongBits(nav) != Double.doubleToLongBits(other.nav))
			return false;
		return true;
	}

	

	
}
