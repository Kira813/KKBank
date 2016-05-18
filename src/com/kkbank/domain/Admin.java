package com.kkbank.domain;

public class Admin {
	
	private String adm_id;
	private String aName;
	private String psd;
	
	
	public Admin() {
		super();
	}
	
	public Admin(String adm_id, String aName, String psd) {
		super();
		this.adm_id = adm_id;
		this.aName = aName;
		this.psd = psd;
	}
	

	public String getaName() {
		return aName;
	}

	public void setaName(String aName) {
		this.aName = aName;
	}

	public String getPsd() {
		return psd;
	}
	public void setPsd(String psd) {
		this.psd = psd;
	}
	public String getAdm_id() {
		return adm_id;
	}
	public void setAdm_id(String adm_id) {
		this.adm_id = adm_id;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((adm_id == null) ? 0 : adm_id.hashCode());
		result = prime * result + ((aName == null) ? 0 : aName.hashCode());
		result = prime * result + ((psd == null) ? 0 : psd.hashCode());
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
		Admin other = (Admin) obj;
		if (adm_id == null) {
			if (other.adm_id != null)
				return false;
		} else if (!adm_id.equals(other.adm_id))
			return false;
		if (aName == null) {
			if (other.aName != null)
				return false;
		} else if (!aName.equals(other.aName))
			return false;
		if (psd == null) {
			if (other.psd != null)
				return false;
		} else if (!psd.equals(other.psd))
			return false;
		return true;
	}
}
