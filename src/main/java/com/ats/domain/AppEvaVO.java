package com.ats.domain;

import java.util.Date;

public class AppEvaVO {

	private int appNum;
	private int evaNum;
	private int annNum;
	private String raterId;
	private int scoreSum;
	private String scoreComment;
	private Date scoreRegDate;
	private String userId;
	private Date appRegDate;

	private int evaItemNum;
	private int evaDetailScore;

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

	public int getAnnNum() {
		return annNum;
	}

	public void setAnnNum(int annNum) {
		this.annNum = annNum;
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

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public int getEvaItemNum() {
		return evaItemNum;
	}

	public void setEvaItemNum(int evaItemNum) {
		this.evaItemNum = evaItemNum;
	}

	public int getEvaDetailScore() {
		return evaDetailScore;
	}

	public Date getAppRegDate() {
		return appRegDate;
	}

	public void setAppRegDate(Date appRegDate) {
		this.appRegDate = appRegDate;
	}

	public void setEvaDetailScore(int evaDetailScore) {
		this.evaDetailScore = evaDetailScore;
	}

	@Override
	public String toString() {
		return "AppEvaVO [appNum=" + appNum + ", evaNum=" + evaNum + ", annNum=" + annNum + ", raterId=" + raterId
				+ ", scoreSum=" + scoreSum + ", scoreComment=" + scoreComment + ", scoreRegDate=" + scoreRegDate
				+ ", userId=" + userId + ", appRegDate=" + appRegDate + ", evaItemNum=" + evaItemNum
				+ ", evaDetailScore=" + evaDetailScore + "]";
	}

}
