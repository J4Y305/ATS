package com.ats.domain;

import java.util.Date;

public class MngVO {
	private String mngId;
	private String mngName;
	private String mngDept;
	private String mngRank;
	private String mngPhone;
	private String mngPwd;
	private int mngAct;
	private int entNum;
	private Date mngRegDate;

	public String getMngId() {
		return mngId;
	}

	public void setMngId(String mngId) {
		this.mngId = mngId;
	}

	public String getMngName() {
		return mngName;
	}

	public void setMngName(String mngName) {
		this.mngName = mngName;
	}

	public String getMngDept() {
		return mngDept;
	}

	public void setMngDept(String mngDept) {
		this.mngDept = mngDept;
	}

	public String getMngRank() {
		return mngRank;
	}

	public void setMngRank(String mngRank) {
		this.mngRank = mngRank;
	}

	public String getMngPhone() {
		return mngPhone;
	}

	public void setMngphone(String mngphone) {
		this.mngPhone = mngphone;
	}

	public String getMngPwd() {
		return mngPwd;
	}

	public void setMngPwd(String mngPwd) {
		this.mngPwd = mngPwd;
	}

	public int getMngAct() {
		return mngAct;
	}

	public void setMngAct(int mngAct) {
		this.mngAct = mngAct;
	}

	public int getEntNum() {
		return entNum;
	}

	public void setEntNum(int entNum) {
		this.entNum = entNum;
	}

	public Date getMngRegDate() {
		return mngRegDate;
	}

	public void setMngRegDate(Date mngRegDate) {
		this.mngRegDate = mngRegDate;
	}

	@Override
	public String toString() {
		return "MngVO [mngId=" + mngId + ", mngName=" + mngName + ", mngDept=" + mngDept + ", mngRank=" + mngRank
				+ ", mngphone=" + mngPhone + ", mngPwd=" + mngPwd + ", mngAct=" + mngAct + ", entNum=" + entNum
				+ ", mngRegDate=" + mngRegDate + "]";
	}

}
