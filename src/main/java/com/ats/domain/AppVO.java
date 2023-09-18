package com.ats.domain;

import java.util.Date;

public class AppVO {

	private String userId;
	private int annNum;
	private int appNum;
	private String appFile;
	private String etc;
	private Date appRegDate;
	private int appSave;
	private int evaEnd;
	private String fileName;

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public int getAnnNum() {
		return annNum;
	}

	public void setAnnNum(int annNum) {
		this.annNum = annNum;
	}

	public int getAppNum() {
		return appNum;
	}

	public void setAppNum(int appNum) {
		this.appNum = appNum;
	}

	public String getAppFile() {
		return appFile;
	}

	public void setAppFile(String appFile) {
		this.appFile = appFile;
	}

	public String getEtc() {
		return etc;
	}

	public void setEtc(String etc) {
		this.etc = etc;
	}

	public Date getAppRegDate() {
		return appRegDate;
	}

	public void setAppRegDate(Date appRegDate) {
		this.appRegDate = appRegDate;
	}

	public int getAppSave() {
		return appSave;
	}

	public void setAppSave(int appSave) {
		this.appSave = appSave;
	}

	public int getEvaEnd() {
		return evaEnd;
	}

	public void setEvaEnd(int evaEnd) {
		this.evaEnd = evaEnd;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	@Override
	public String toString() {
		return "AppVO [userId=" + userId + ", annNum=" + annNum + ", appNum=" + appNum + ", appFile=" + appFile
				+ ", etc=" + etc + ", appRegDate=" + appRegDate + ", appSave=" + appSave + ", evaEnd=" + evaEnd
				+ ", fileName=" + fileName + "]";
	}

}