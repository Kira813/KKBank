package com.kkbank.domain;

public class Supervisor {
	
	private String auth_code;
	private String sp_id;

	public Supervisor() {
		super();
	}

	public Supervisor(String auth_code, String sp_id) {
		super();
		this.auth_code = auth_code;
		this.sp_id = sp_id;
	}


	public String getSp_id() {
		return sp_id;
	}

	public void setSp_id(String sp_id) {
		this.sp_id = sp_id;
	}

	public String getAuth_code() {
		return auth_code;
	}

	public void setAuth_code(String auth_code) {
		this.auth_code = auth_code;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((auth_code == null) ? 0 : auth_code.hashCode());
		result = prime * result + ((sp_id == null) ? 0 : sp_id.hashCode());
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
		Supervisor other = (Supervisor) obj;
		if (auth_code == null) {
			if (other.auth_code != null)
				return false;
		} else if (!auth_code.equals(other.auth_code))
			return false;
		if (sp_id == null) {
			if (other.sp_id != null)
				return false;
		} else if (!sp_id.equals(other.sp_id))
			return false;
		return true;
	}
	
}
