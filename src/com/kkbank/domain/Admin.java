package com.kkbank.domain;

public class Admin {
	
	private String adm_id;
	private String admin;
	private String psd;
	
	
	public Admin() {
		super();
	}
	
	public Admin(String adm_id, String admin, String psd) {
		super();
		this.adm_id = adm_id;
		this.admin = admin;
		this.psd = psd;
	}
	
	public String getAdmin() {
		return admin;
	}
	public void setAdmin(String admin) {
		this.admin = admin;
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
		result = prime * result + ((admin == null) ? 0 : admin.hashCode());
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
		if (admin == null) {
			if (other.admin != null)
				return false;
		} else if (!admin.equals(other.admin))
			return false;
		if (psd == null) {
			if (other.psd != null)
				return false;
		} else if (!psd.equals(other.psd))
			return false;
		return true;
	}
}
