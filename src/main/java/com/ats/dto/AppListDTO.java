package com.ats.dto;

import java.util.Date;

public class AppListDTO {

	private int appNum;
	private int annNum;
	private String userId;
	private String annName;
	private Date annStartDate;
	private Date annEndDate;
	private Date appRegDate;

	public int getAppNum() {
		return appNum;
	}

	public void setAppNum(int appNum) {
		this.appNum = appNum;
	}

	public int getAnnNum() {
		return annNum;
	}

	public void setAnnNum(int annNum) {
		this.annNum = annNum;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getAnnName() {
		return annName;
	}

	public void setAnnName(String annName) {
		this.annName = annName;
	}

	public Date getAnnStartDate() {
		return annStartDate;
	}

	public void setAnnStartDate(Date annStartDate) {
		this.annStartDate = annStartDate;
	}

	public Date getAnnEndDate() {
		return annEndDate;
	}

	public void setAnnEndDate(Date annEndDate) {
		this.annEndDate = annEndDate;
	}

	public Date getAppRegDate() {
		return appRegDate;
	}

	public void setAppRegDate(Date appRegDate) {
		this.appRegDate = appRegDate;
	}

	@Override
	public String toString() {
		return "appListDTO [appNum=" + appNum + ", annNum=" + annNum + ", userId=" + userId + ", annName=" + annName
				+ ", annStartDate=" + annStartDate + ", annEndDate=" + annEndDate + ", appRegDate=" + appRegDate + "]";
	}

}
