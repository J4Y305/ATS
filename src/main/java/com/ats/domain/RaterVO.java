package com.ats.domain;

import java.util.Date;

public class RaterVO {

	private String raterId;
	private String raterPwd;
	private String raterName;
	private String raterDept;
	private String raterRank;
	private String raterPhone;
	private String raterEmail;
	private String mngId;
	private Date raterRegDate;

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

	public String getRaterName() {
		return raterName;
	}

	public void setRaterName(String raterName) {
		this.raterName = raterName;
	}

	public String getRaterDept() {
		return raterDept;
	}

	public void setRaterDept(String raterDept) {
		this.raterDept = raterDept;
	}

	public String getRaterRank() {
		return raterRank;
	}

	public void setRaterRank(String raterRank) {
		this.raterRank = raterRank;
	}

	public String getRaterPhone() {
		return raterPhone;
	}

	public void setRaterPhone(String raterPhone) {
		this.raterPhone = raterPhone;
	}

	public String getRaterEmail() {
		return raterEmail;
	}

	public void setRaterEmail(String raterEmail) {
		this.raterEmail = raterEmail;
	}

	public String getMngId() {
		return mngId;
	}

	public void setMngId(String mngId) {
		this.mngId = mngId;
	}

	public Date getRaterRegDate() {
		return raterRegDate;
	}

	public void setRaterRegDate(Date raterRegDate) {
		this.raterRegDate = raterRegDate;
	}

	@Override
	public String toString() {
		return "RaterVO [raterId=" + raterId + ", raterPwd=" + raterPwd + ", raterName=" + raterName + ", raterDept="
				+ raterDept + ", raterRank=" + raterRank + ", raterPhone=" + raterPhone + ", raterEmail=" + raterEmail
				+ ", mngId=" + mngId + ", raterRegDate=" + raterRegDate + "]";
	}

}
