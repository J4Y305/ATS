package com.ats.dto;

public class MngLoginDTO {

	private String mngId;
	private String mngPwd;
	private boolean mngCookie;

	public String getMngId() {
		return mngId;
	}

	public void setMngId(String mngId) {
		this.mngId = mngId;
	}

	public String getMngPwd() {
		return mngPwd;
	}

	public void setMngPwd(String mngPwd) {
		this.mngPwd = mngPwd;
	}

	public boolean isMngCookie() {
		return mngCookie;
	}

	public void setMngCookie(boolean mngCookie) {
		this.mngCookie = mngCookie;
	}

	@Override
	public String toString() {
		return "MngLoginDTO [mngId=" + mngId + ", mngPwd=" + mngPwd + ", mngCookie=" + mngCookie + "]";
	}

}
