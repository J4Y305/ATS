package com.ats.dto;

public class AdminLoginDTO {

	private String adminId;
	private String adminPwd;
	private boolean adminCookie;

	public String getAdminId() {
		return adminId;
	}

	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}

	public String getAdminPwd() {
		return adminPwd;
	}

	public void setAdminPwd(String adminPwd) {
		this.adminPwd = adminPwd;
	}

	public boolean isAdminCookie() {
		return adminCookie;
	}

	public void setAdminCookie(boolean adminCookie) {
		this.adminCookie = adminCookie;
	}

	@Override
	public String toString() {
		return "AdminLoginDTO [adminId=" + adminId + ", adminPwd=" + adminPwd + ", adminCookie=" + adminCookie + "]";
	}

}
