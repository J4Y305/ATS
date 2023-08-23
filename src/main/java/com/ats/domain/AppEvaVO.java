package com.ats.domain;

import java.util.Date;

public class AppEvaVO {

	private int appNum;
	private int evaNum;
	private String raterId;
	private int scoreSum;
	private String scoreComment;
	private Date scoreRegDate;

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

	public String getRaterId() {
		return raterId;
	}

	public void setRaterId(String raterId) {
		this.raterId = raterId;
	}

	public int getScoreSum() {
		return scoreSum;
	}

	public void setScoreSum(int scoreSum) {
		this.scoreSum = scoreSum;
	}

	public String getScoreComment() {
		return scoreComment;
	}

	public void setScoreComment(String scoreComment) {
		this.scoreComment = scoreComment;
	}

	public Date getScoreRegDate() {
		return scoreRegDate;
	}

	public void setScoreRegDate(Date scoreRegDate) {
		this.scoreRegDate = scoreRegDate;
	}

	@Override
	public String toString() {
		return "AppEvaVO [appNum=" + appNum + ", evaNum=" + evaNum + ", raterId=" + raterId + ", scoreSum=" + scoreSum
				+ ", scoreComment=" + scoreComment + ", scoreRegDate=" + scoreRegDate + "]";
	}

	
}
