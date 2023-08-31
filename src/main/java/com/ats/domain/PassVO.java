package com.ats.domain;

import java.util.Arrays;
import java.util.Date;

public class PassVO {

	private int appNum;
	private int evaNum;
	private String[] appNumList;
	private Date passRegDate;

	public int getAppNum() {
		return appNum;
	}

	public void setAppNum(int appNum) {
		this.appNum = appNum;
	}

	public int getEvaNum() {
		return evaNum;
	}

	public void setEvaNum(int evaNum) {
		this.evaNum = evaNum;
	}

	public String[] getAppNumList() {
		return appNumList;
	}

	public void setAppNumList(String[] appNumList) {
		this.appNumList = appNumList;
	}

	public Date getPassRegDate() {
		return passRegDate;
	}

	public void setPassRegDate(Date passRegDate) {
		this.passRegDate = passRegDate;
	}

	@Override
	public String toString() {
		return "PassVO [appNum=" + appNum + ", evaNum=" + evaNum + ", appNumList=" + Arrays.toString(appNumList)
				+ ", passRegDate=" + passRegDate + "]";
	}

}
