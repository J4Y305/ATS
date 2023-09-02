package com.ats.dto;

import java.util.Date;

public class AppPassDTO {

	private int appNum;
	private String annName;
	private Date appRegDate;
	private Date evaRegDate;
	private int passCheck;
	private String passMsg;

	public int getAppNum() {
		return appNum;
	}

	public void setAppNum(int appNum) {
		this.appNum = appNum;
	}

	public String getAnnName() {
		return annName;
	}

	public void setAnnName(String annName) {
		this.annName = annName;
	}

	public Date getAppRegDate() {
		return appRegDate;
	}

	public void setAppRegDate(Date appRegDate) {
		this.appRegDate = appRegDate;
	}

	public Date getEvaRegDate() {
		return evaRegDate;
	}

	public void setEvaRegDate(Date evaRegDate) {
		this.evaRegDate = evaRegDate;
	}

	public int getPassCheck() {
		return passCheck;
	}

	public void setPassCheck(int passCheck) {
		this.passCheck = passCheck;
	}

	public String getPassMsg() {
		return passMsg;
	}

	public void setPassMsg(String passMsg) {
		this.passMsg = passMsg;
	}

	@Override
	public String toString() {
		return "AppPassDTO [appNum=" + appNum + ", annName=" + annName + ", appRegDate=" + appRegDate + ", evaRegDate="
				+ evaRegDate + ", passCheck=" + passCheck + ", passMsg=" + passMsg + "]";
	}

}
