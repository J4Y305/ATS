package com.ats.dto;

public class RaterLoginDTO {  
	private String raterId;
	private String raterPwd;
	private boolean raterCookie;

	public String getRaterId() {   
		return raterId;
	}

	public void setRaterId(String raterId) {
		this.raterId = raterId;
	}

	public String getRaterPwd() {
		return raterPwd;
	}

	public void setRaterPwd(String raterPwd) {
		this.raterPwd = raterPwd;
	}

	public boolean isRaterCookie() {
		return raterCookie;
	}

	public void setRaterCookie(boolean raterCookie) {
		this.raterCookie = raterCookie;
	}

	@Override
	public String toString() {
		return "RaterLoginDTO [raterId=" + raterId + ", raterPwd=" + raterPwd + ", raterCookie=" + raterCookie + "]";
	}

}
